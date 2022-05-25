% Name: Changjun Zai
% ID: 1127473900
% Email: czai@usc.edu
% Date: March 27, 2022

clc
clear all
image2 = readraw('Cat_1.raw',600,400);
image1 = readraw('Cat_Dog.raw',600,400);

%a
%image2 = readraw('Dog_1.raw',600,400);
%image1 = readraw('Cat_Dog.raw',600,400);

%b
%image2 = readraw('Cat_1.raw',600,400);
%image1 = readraw('Cat_2.raw',600,400);

%c
%image2 = readraw('Cat_1.raw',600,400);
%image1 = readraw('Dog_1.raw',600,400);

image1 = uint8(image1);
image2 = uint8(image2);
% grayscale
img1_gray = rgb2gray(image1);
img2_gray = rgb2gray(image2); 

img1_gray = im2single(img1_gray);
img2_gray = im2single(img2_gray);

% SIFT matches
% Calculate sift frames (key points) and descriptors
[f1,d1] = vl_sift(img1_gray) ;
[f2,d2] = vl_sift(img2_gray) ;
%[f1,d1] = vl_sift(img1_gray,'Octaves',4,'Levels',5,'PeakThresh',0.4,'EdgeThresh',10)  ;
%[f2,d2] = vl_sift(img2_gray,'Octaves',4,'Levels',5,'PeakThresh',0.4,'EdgeThresh',10) ;

[matches, scores] = vl_ubcmatch(d1,d2,1.25) ;%find closest neighboring key-point 

show_points_detail(f1,d1,f2,d2,image1,image2);
show_matches(matches,f1,f2,image1,image2)


function [image] = readraw(filename,M, N)
f1 = fopen(filename, 'r');
data = fread(f1, 'ubit8');
fclose(f1);
len = length(data);
k = len/(M*N);
image = reshape(data,k,M,N);
image = permute(image,[3,2,1]);
end

function show_points_detail(f1,d1,f2,d2,image1,image2)
%show image1
figure
imshow(image1)
%[~,sel] = maxk(f1(3,:),15);
perm = randperm(size(f1,2)); %Randomly rearrange the columns of the 1 to f matrix
sel = perm(1:15);%Select the top 50
p1 = vl_plotframe(f1(:,sel)) ;
p2 = vl_plotframe(f1(:,sel)) ;
set(p1,'color','g','linewidth',2) ;%color green
set(p2,'color','r','linewidth',2) ;%color red
p3 = vl_plotsiftdescriptor(d1(:,sel),f1(:,sel)) ;%Overlay descriptors on top of feature points
set(p3,'color','b') ;

%show image 2
figure;
imshow(image2);

%[~,sel1]=maxk(f2(3,:),20);
perm = randperm(size(f2,2)); 
sel1 = perm(1:15);
p1 = vl_plotframe(f2(:,sel1)) ;
p2 = vl_plotframe(f2(:,sel1)) ;
set(p1,'color','g','linewidth',2) ;%color green
set(p2,'color','r','linewidth',2) ;%color red
p3 = vl_plotsiftdescriptor(d2(:,sel1),f2(:,sel1)) ;%Overlay descriptors on top of feature points
set(p3,'color','b') ;
end

function show_matches(matches,f1,f2,image1,image2)
numMatches = size(matches,2) ;
X1 = f1(1:2,matches(1,:)); 
X1(3,:) = 1;
X2 = f2(1:2,matches(2,:)); 
X2(3,:) = 1;

% RANSAC  homography model to remove outliers
%choose 20 sets of matches, each set includes 4 points
for r = 1:20
  % estimate
  sub = vl_colsubset(1:numMatches, 4) ;
  A = [];
  for i = sub
    A = cat(1, A, kron(X1(:,i)', vl_hat(X2(:,i)))) ; %Do the inner product of the 4 points separately 
    % and stitch the resulting matrix together
  end
  [~,~,V] = svd(A) ;%find the SVD decomposition of the splicing matrix
  H{r} = reshape(V(:,9),3,3) ;

  % score homography
  %sort
  X2_ = H{r} * X1 ;
  du = X2_(1,:)./X2_(3,:) - X2(1,:)./X2(3,:) ;
  dv = X2_(2,:)./X2_(3,:) - X2(2,:)./X2(3,:) ;
  fine{r} = (du.*du + dv.*dv) < 6*6 ;
  score(r) = sum(fine{r}) ;
end

[~, best] = max(score) ;
H = H{best} ;
fine = fine{best} ;

h1 = max(size(image2,1)-size(image1,1),0) ;
h2 = max(size(image1,1)-size(image2,1),0) ;

%{
figure
imagesc([padarray(image1,h1,'post') padarray(image2,h2,'post')]) ;
o = size(image1,2) ;
line([f1(1,matches(1,:));f2(1,matches(2,:))+o], ...
     [f1(2,matches(1,:));f2(2,matches(2,:))]);
axis image off ;

%}

figure
imagesc([padarray(image1,h1,'post') padarray(image2,h2,'post')]) ;
o = size(image1,2) ;
line([f1(1,matches(1,fine));f2(1,matches(2,fine))+o], ...
     [f1(2,matches(1,fine));f2(2,matches(2,fine))]) ;
axis image off ;
end