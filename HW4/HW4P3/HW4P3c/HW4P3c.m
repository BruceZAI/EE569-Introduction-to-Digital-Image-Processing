% Name: Changjun Zai
% ID: 1127473900
% Email: czai@usc.edu
% Date: March 27, 2022

clc
clear all
close all
img1 = uint8(readraw('Cat_1.raw',600,400));
img2 = uint8(readraw('Cat_2.raw',600,400));
img3 = uint8(readraw('Dog_1.raw',600,400));
img4 = uint8(readraw('Dog_2.raw',600,400));
img5 = uint8(readraw('Cat_Dog.raw',600,400));

figure
subplot(2,2,1)
imshow(img1)
subplot(2,2,2)
imshow(img2)
subplot(2,2,3)
imshow(img3)
subplot(2,2,4)
imshow(img5)

img1 = im2single(rgb2gray(img1));
img2 = im2single(rgb2gray(img2));
img3 = im2single(rgb2gray(img3));
img4 = im2single(rgb2gray(img4));
img5 = im2single(rgb2gray(img5));
% Extract features
[f1,d1] = vl_sift(img1) ;
[f2,d2] = vl_sift(img2);
[f3,d3] = vl_sift(img3);
[f4,d4] = vl_sift(img4);
[f5,d5] = vl_sift(img5);

%Apply K-means clustering to create dictionary’s visual words (k=8)
K = 8;
[C1, Ass1] = vl_kmeans(im2double(f1), K);
[C2, Ass2] = vl_kmeans(im2double(f2), K);
[C3, Ass3] = vl_kmeans(im2double(f3), K);
[C4, Ass4] = vl_kmeans(im2double(f4), K);
[C5, Ass5] = vl_kmeans(im2double(f5), K);

figure;
subplot(2,2,1)
histogram(Ass1,'Normalization','probability');
title('Cat_1')

subplot(2,2,2)
histogram(Ass2,'Normalization','probability');
title('Cat_2')

subplot(2,2,3)
histogram(Ass3,'Normalization','probability');
title('Dog_1')
subplot(2,2,4)
histogram(Ass5,'Normalization','probability');
title('Cat_Dog')

[N1,~] = histcounts(Ass1,K);
[N3,~] = histcounts(Ass3,K);
[N4,~] = histcounts(Ass4,K);

SI_14 = smiliarity(N1,N4);
SI_34 = smiliarity(N3,N4);
%The bigger of SI, the better the match
 function [image] = readraw(filename,M, N)
f1 = fopen(filename, 'r');
data = fread(f1, 'ubit8');
fclose(f1);
len = length(data);
k = len/(M*N);
image = reshape(data,k,M,N);
image = permute(image,[3,2,1]);
 end

function [smilarity_index] = smiliarity(h1,h2)
min_s = 0;
max_s = 0;
for i = 1:8
    min_s = min_s + min(h1(i),h2(i));
    max_s = max_s + max(h1(i),h2(i));
end
smilarity_index = min_s / (max_s + 10 ^(-8));
end
