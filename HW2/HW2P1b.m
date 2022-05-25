% Name: Changjun Zai
% ID: 1127473900
% Email: czai@usc.edu
% Date: February 20, 2022

image = imread('Pig.jpg');
image = rgb2gray(image);
image = double(image);

sigma = 1;
gausFilter = fspecial('gaussian', [3,3], sigma);
image= imfilter(image, gausFilter, 'replicate');

threshold_low = 0.15;
threshold_high = 0.3;

BW = edge(image, 'Canny', [threshold_low threshold_high]);
figure();
imshow(BW);
title('Canny Edge Detector ');
