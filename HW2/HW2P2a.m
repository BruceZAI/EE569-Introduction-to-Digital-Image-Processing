width = 600;
height = 400;
image = myReadRaw('bridge.raw',width,height,0);

showImage(image,'Original Image');
%Fixed thresholding

threshold = 128;

F=rebinaryImage(height,width,image,threshold);
showImage(F,'Fixed Thresholding');


%Random thresholding
F1 = image;

R=randomThresholding(height,width, F1);

showImage(R,'Random Thresholding');

%Dithering Matrix
I0=0;
n=2;
r=1;

D=ditheringMatrix(I0,n,r,F,F1,height,width);

showImage(D,'Dithering Matrix 2x2');


I0=0;
n=8;
r=3;

D=ditheringMatrix(I0,n,r,F,F1,height,width);
showImage(D,'Dithering Matrix 8x8');


I0=0;
n=32;
r=5;

D=ditheringMatrix(I0,n,r,F,F1,height,width);
showImage(D,'Dithering Matrix 32x32');
