width = 500;
height = 375;
band = 3;
fid = fopen('bird.raw','rb');
pixel=fread(fid,[width * band height],'uchar');
fclose(fid);
a= pixel(1:3:1498,:)';
b=pixel(2:3:1499,:)';
c=pixel(3:3:1500,:)';

Red=double(a);
Green=double(b);
Blue=double(c);

RGB = zeros(height, width, band);
RGB = assignRGB(RGB,Red,Green,Blue);

showImage(RGB,'Original Image');

C= channel(height,width,Red);
M= channel(height,width,Green);
Y= channel(height,width,Blue);

[height width]=size(C);
b=zeros(height,width);
T=128;
%C
b=FS(C,height,width,b,T);
C_halftoned=b;

b=zeros(height,width);
%M
b=FS(M,height,width,b,T);
M_halftoned=b;

b=zeros(height,width);
%Y
b=FS(Y,height,width,b,T);
Y_halftoned=b;

RGBCMY_halftoned(:,:,1)=255*ones(375,500) - (double(C_halftoned));
RGBCMY_halftoned(:,:,2)=255*ones(375,500) - (double(M_halftoned));
RGBCMY_halftoned(:,:,3)=255*ones(375,500) - (double(Y_halftoned));

showImage(RGBCMY_halftoned,'Seperable Error Diffusion');