clear
clc
height=432;
width=576;
band =3;

 G1= readRawHW('left.raw');
 
 images{1} = G1;
 G2= readRawHW('middle.raw');
 
 images{2} = G2;
 G3= readRawHW('right.raw');
 
 images{3} = G3;
 [result,H,numInliers,residual] = stitchMultiple(images);
 figure;
 imshow(result);


