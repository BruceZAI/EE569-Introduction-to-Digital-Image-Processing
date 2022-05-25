% Name: Changjun Zai
% ID: 1127473900
% Email: czai@usc.edu
% Date: March 27, 2022

clc
clear
h=512;
w=512;
w_size = 21;
L5=[1 4 6 4 1];
E5=[-1 -2 0 2 1];
S5=[-1 0 2 0 -1];
W5=[-1 2 0 -2 1];
R5=[1 -4 6 -4 1];

img=readraw('Mosaic.raw',h,w);
figure(1);
imshow(img,[]);

kernel=fspecial('laplacian'); %Generate Laplace filter
boundary = imfilter(img,kernel); %Laplacian filtering of images
img = img + boundary;%boundary extensions

%1D Kernel for 5 * 5 Laws Filters
law_filter{1}=L5;
law_filter{2}=E5;
law_filter{3}=S5;
law_filter{4}=W5;
law_filter{5}=R5;

filter25D={};
count=1;

filteredImage=zeros(w,h);
filteredImg=zeros(w,h,25);

%25 2D filters
for i=1:5
    for j=1:5
        filter25D{count}=law_filter{i}'*law_filter{j};
        count=count+1;
    end
end

%Extract the response vectors
for k=1:25
    filteredImage = imfilter(img,filter25D{k},'same');%apply 25 5x5 Laws filters to get 25 filtered images

%Calculate average energy within a window 
%Window
filteredImageExt=zeros(h + w_size - 1,w + w_size - 1);
half_size = floor(w_size / 2);
filteredImageExt(half_size + 1:h + half_size,half_size + 1:w + half_size)=filteredImage(:,:);
%Try different window sizes. Get 25-D energy feature vector for each pixel.
for i=half_size + 1:(w+half_size)
    for j=half_size + 1:(h+half_size)
            filteredImg(i-half_size,j-half_size,k)=sqrt(sum(sum(abs(filteredImageExt(i-half_size:i+half_size,j-half_size:j+half_size)))));
    end
end
end

filteredImg24=zeros(w,h,24);
L5L5=filteredImg(:,:,1);
for k = 2:25
filteredImg24(:,:,k - 1)= filteredImg(:,:,k)./L5L5;%Normalize to L5^T * L5, get 24D feature vector
end


basic_res = basic(filteredImg24,w,h);
%se = strel('disk',7);
%basic_res = imclose(basic_res,se);
figure(2);
imshow(basic_res);
title('Basic Texture Segmentation');

P_vector = extract_pca(filteredImg24,10);
P_res = PCA_seg(P_vector);

%merge small holes
se = strel('disk',7);
P_res = imclose(P_res,se);

figure(3);
imshow(P_res);
title('Advanced Texture Segmentation Using PCA');

function [res] = basic(filteredImg,w,h)
kmeansInput=zeros(w*h,24);
for k=1:24
    counter=1;
    for i=1:(w)
        for j=1:(h)
            kmeansInput(counter,k)=filteredImg(i,j,k);
            counter=counter+1;
        end
    end
end

%Use the K-means algorithm, divide the pixel into 6 clusters
[idx,~] = kmeans(kmeansInput,6);

counter=1;
for i=1:(w)
     for j=1:(h)
            kmeansOutput(i,j)=idx(counter,1);
            counter=counter+1;
     end
end

res = zeros([w,h,3]);
for i = 1:w
    for j = 1:h
        if kmeansOutput(i,j) == 1
            res(i,j,:) = [107,143,159];
        end
        if kmeansOutput(i,j) == 2
            res(i,j,:) = [114,99,107];
        end
        if kmeansOutput(i,j) == 3
            res(i,j,:) = [175,128,74];
        end
        if kmeansOutput(i,j) == 4
            res(i,j,:) = [167,57,32];
        end
        if kmeansOutput(i,j) == 5
            res(i,j,:) = [144,147,104];
        end
        if kmeansOutput(i,j) == 6
            res(i,j,:) = [157,189,203];
        end
    end
end
res = uint8(res);

end

function [res] = PCA_seg(filteredImg)
[w,h,n] = size(filteredImg);
kmeansInput=zeros(w*h,n);    

for k=1:n
    counter=1;
    for i=1:(w)
        for j=1:(h)
            kmeansInput(counter,k)=filteredImg(i,j,k);
            counter=counter+1;
        end
    end
end

%Use the K-means algorithm, divide the pixel into 6 clusters
[idx,~] = kmeans(kmeansInput,6);

counter=1;
for i=1:(w)
     for j=1:(h)
            kmeansOutput(i,j)=idx(counter,1);
            counter=counter+1;
     end
end

%Use randomly generated color map to represent the K=6 regions
res = zeros([w,h,3]);
for i = 1:w
    for j = 1:h
        if kmeansOutput(i,j) == 1
            res(i,j,:) = [107,143,159];
        end
        if kmeansOutput(i,j) == 2
            res(i,j,:) = [114,99,107];
        end
        if kmeansOutput(i,j) == 3
            res(i,j,:) = [175,128,74];
        end
        if kmeansOutput(i,j) == 4
            res(i,j,:) = [167,57,32];
        end
        if kmeansOutput(i,j) == 5
            res(i,j,:) = [144,147,104];
        end
        if kmeansOutput(i,j) == 6
            res(i,j,:) = [157,189,203];
        end
    end
end
res = uint8(res);

end

function [image] = readraw(filename,M, N)
f1 = fopen(filename, 'r');
data = fread(f1, 'ubit8');
fclose(f1);
len = length(data);
k = len/(M*N);
image = reshape(data,k,M,N);
image = permute(image,[3,2,1]);
end

function [P_vector ,value,tem] = PCA2D(vectors2D)
vectors2D = double(vectors2D) /255;
[h ,w ,c] = size(vectors2D);
pixels = h*w;

vectors2D = reshape(vectors2D, [pixels,c]);
tem = vectors2D;
meanValue =  mean(vectors2D,1);
vectors2D = vectors2D - repmat(meanValue,[h*w,1]);
cor = (vectors2D'*vectors2D)/pixels;

[vector ,value] = eig(cor);%Eigenvalues and eigenvectors
value = fliplr(value);%Left and right flip
value = flipud(value);%Flip up and down
P_vector = fliplr(vector);

end

function [res] = extract_pca(vectors2D,n)
[h,w,~]=size(vectors2D);
[vector,~,tem]= PCA2D(vectors2D);%reduce feature dimension to 2 using PCA
res = zeros([h,w,n]);
PC = tem*vector; 

for i = 1:n
    pic_vector = PC(:,i);
    pic_vector = reshape(pic_vector,[h,w]);
    res(:,:,i) = pic_vector;
end
end