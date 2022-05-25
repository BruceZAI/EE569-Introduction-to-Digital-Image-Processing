% Name: Changjun Zai
% ID: 1127473900
% Email: czai@usc.edu
% Date: January 30, 2022

% Homework1.2.a
Flower = myReadRaw('Flower_gray.raw',768,512,0);
FlowerNoisy = myReadRaw('Flower_gray_noisy.raw',768,512,0);

myHistogram(FlowerNoisy);

figure()
subplot(3,2,1);

imshow(uint8(Flower));
title('original picture `Flower`','interpreter','latex');

% figure with noise
subplot(3,2,2);

imshow(uint8(FlowerNoisy));
title('pircture with noisy','interpreter','latex');

meanFilter3 = meanFilter(FlowerNoisy,3);
subplot(3,2,3);
imshow(uint8(meanFilter3));
title('mean filter with size 3*3','interpreter','latex');

meanFilter5 = meanFilter(FlowerNoisy,5);
subplot(3,2,4);
imshow(uint8(meanFilter5));
title('mean filter with size 5*5','interpreter','latex');
myWriteRaw(meanFilter5, 'Flower_gray_meanFilter5.raw');

meanFilter7 = meanFilter(FlowerNoisy,7);
subplot(3,2,5);
imshow(uint8(meanFilter7));
title('mean filter with size 7*7','interpreter','latex');

% Gaussian filter
figure()

GaussianFilter3_1 = GaussianFilter(FlowerNoisy, 3, 1.5);
subplot(3,2,1);
imshow(uint8(GaussianFilter3_1));
title('Gaussian filter with size 3*3, $\sigma=1.5$','interpreter','latex');

GaussianFilter3_2 = GaussianFilter(FlowerNoisy, 3, 2.5);
subplot(3,2,2);
imshow(uint8(GaussianFilter3_2));
title('Gaussian filter with size 3*3, $\sigma=2.5$','interpreter','latex');

GaussianFilter3_3 = GaussianFilter(FlowerNoisy, 3, 3.5);
subplot(3,2,3);
imshow(uint8(GaussianFilter3_3));
title('Gaussian filter with size 3*3, $\sigma=3.5$','interpreter','latex');

GaussianFilter3_5 = GaussianFilter(FlowerNoisy, 3, 5.5);
subplot(3,2,5);
imshow(uint8(GaussianFilter3_5));
title('Gaussian filter with size 3*3, $\sigma=5.5$','interpreter','latex');
myWriteRaw(GaussianFilter3_5, 'Flower_gray_GaussianFilter3_5.raw');

GaussianFilter5 = GaussianFilter(FlowerNoisy, 5, 2.5);
subplot(3,2,4);
imshow(uint8(GaussianFilter5));
title('Gaussian filter with size 5*5, $\sigma=2.5$','interpreter','latex');

GaussianFilter7 = GaussianFilter(FlowerNoisy, 7, 2.5);
subplot(3,2,6);
imshow(uint8(GaussianFilter7));
title('Gaussian filter with size 7*7, $\sigma=2.5$','interpreter','latex');


%%% using psnr to check the performance
figure()
% mean filter
psnr_mean = zeros(5,1);
for i=1:5
    size = 2 * i + 1;
    flower_new = meanFilter(FlowerNoisy,size);
    psnr = PSNR(Flower, flower_new);
    psnr_mean(i) = psnr;
%     disp(printf('filter size: %d, psnr: %f',size, psnr))
end
subplot(1,2,1)
plot(3:2:11,psnr_mean);
xlabel('filter size')
ylabel('psnr')
title('performance of different sizes of uniform weight filter')

% Gaussian filter
psnr_gaussian = zeros(5,1);
for i=1:5
    size = 2 * i + 1;
    s = i + 0.5;
    flower_new = GaussianFilter(FlowerNoisy, size, s);
    %flower_new = meanFilter(FlowerNoisy,size);
    psnr = PSNR(Flower, flower_new);
    psnr_gaussian(i) = psnr;
%     disp(printf('filter size: %d, psnr: %f',size, psnr))
end
subplot(1,2,2)
plot(3:2:11,psnr_gaussian);
xlabel('filter size')
ylabel('psnr')
title('performance of different sizes of Gaussian filter')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



