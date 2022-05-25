% Name: Changjun Zai
% ID: 1127473900
% Email: czai@usc.edu
% Date: January 30, 2022


%Homework1.2.c
clear
figure()
set(gcf,'unit','centimeters','position',[1,2,60,60]);
Flower = myReadRaw('Flower_gray_noisy.raw',768,512,0);
subplot(3,3,1);
imshow(uint8(Flower))
title('with noise')

subplot(3,3,2)
Flower_filtered = imnlmfilt(Flower);
imshow(uint8(Flower_filtered));
title('denoised with nlm filter')

% parameter SearchWindowSize, the same as \mathcal{N} in homework
subplot(3,3,3)
Flower_filtered = imnlmfilt(Flower,'SearchWindowSize',5);
imshow(uint8(Flower_filtered));
title('SearchWindowSize=5')

subplot(3,3,4)
Flower_filtered = imnlmfilt(Flower,'SearchWindowSize',11);
imshow(uint8(Flower_filtered));
title('SearchWindowSize=11')

subplot(3,3,5)
Flower_filtered = imnlmfilt(Flower,'SearchWindowSize',21);
imshow(uint8(Flower_filtered));
title('SearchWindowSize=21')
myWriteRaw(Flower_filtered, 'Flower_gray_nlm_filtered.raw');

% parameter ComparisonWindowSize, the same as small window size N' 
subplot(3,3,6)
Flower_filtered = imnlmfilt(Flower,'ComparisonWindowSize',3);
imshow(uint8(Flower_filtered));
title('ComparisonWindowSize=3')

subplot(3,3,7)
Flower_filtered = imnlmfilt(Flower,'ComparisonWindowSize',5);
imshow(uint8(Flower_filtered));
title('ComparisonWindowSize=5')

subplot(3,3,8)
Flower_filtered = imnlmfilt(Flower,'ComparisonWindowSize',11);
imshow(uint8(Flower_filtered));
title('ComparisonWindowSize=11')

subplot(3,3,9)
Flower_filtered = imnlmfilt(Flower,'ComparisonWindowSize',15);
imshow(uint8(Flower_filtered));
title('ComparisonWindowSize=15')

figure();
psnr_search = zeros(20,1);
for i=1:10
    size = 4 * i + 1;
    Flower_filtered = imnlmfilt(Flower,'SearchWindowSize',size);
    psnr = PSNR(Flower, Flower_filtered);
    psnr_search(i) = psnr;
%     disp(printf('filter size: %d, psnr: %f',size, psnr))
end

plot(psnr_search);
xlabel('filter size')
ylabel('psnr')

figure();
psnr_comparison = zeros(6,1);
for i=1:6
    size = 2 * i + 1;
    Flower_filtered = imnlmfilt(Flower,'ComparisonWindowSize',size);
    psnr = PSNR(Flower, Flower_filtered);
    psnr_comparison(i) = psnr;
%     disp(printf('filter size: %d, psnr: %f',size, psnr))
end

plot(psnr_comparison);
xlabel('filter size')
ylabel('psnr')
