% Name: Changjun Zai
% ID: 1127473900
% Email: czai@usc.edu
% Date: January 30, 2022


% Homework1.2.b
figure()
Flower_noisy = myReadRaw('Flower_gray_noisy.raw',768,512,0);
set(gcf,'unit','centimeters','position',[1,2,60,60]);

subplot(3,3,1);
Flower_filtered = BilateralFilter(Flower_noisy,1,20,5);
imshow(uint8(Flower_filtered))
title('$\sigma_c=1$','Interpreter','Latex','Position',[-80,256])

subplot(3,3,2);
Flower_filtered = BilateralFilter(Flower_noisy,1,50,5);
imshow(uint8(Flower_filtered))

subplot(3,3,3);
Flower_filtered = BilateralFilter(Flower_noisy,1,500,5);
imshow(uint8(Flower_filtered))
myWriteRaw(Flower_filtered, 'Flower_noisy_bilateralFiltered.raw');

subplot(3,3,4);
Flower_filtered = BilateralFilter(Flower_noisy,3,20,5);
imshow(uint8(Flower_filtered))
title('$\sigma_c=3$','Interpreter','Latex','Position',[-80,256])

subplot(3,3,5);
Flower_filtered = BilateralFilter(Flower_noisy,3,50,5);
imshow(uint8(Flower_filtered))

subplot(3,3,6);
Flower_filtered = BilateralFilter(Flower_noisy,3,500,5);
imshow(uint8(Flower_filtered))

subplot(3,3,7);
Flower_filtered = BilateralFilter(Flower_noisy,20,20,5);
imshow(uint8(Flower_filtered))
title('$\sigma_c=20$','Interpreter','Latex','Position',[-80,256])
text(384,600,'$\sigma_s=20$','Interpreter','Latex')


subplot(3,3,8);
Flower_filtered = BilateralFilter(Flower_noisy,20,50,5);
imshow(uint8(Flower_filtered))
text(384,600,'$\sigma_s=50$','Interpreter','Latex')

subplot(3,3,9);
Flower_filtered = BilateralFilter(Flower_noisy,20,500,5);
imshow(uint8(Flower_filtered))
text(384,600,'$\sigma_s=500$','Interpreter','Latex')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
