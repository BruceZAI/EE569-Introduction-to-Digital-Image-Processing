
width = 481;
height = 321;
band = 3;
fid = fopen('Tiger.raw','rb');
pixel=fread(fid,[width * band height],'uchar');
fclose(fid);

a= pixel(1:3:1441,:)';
b= pixel(2:3:1442,:)';
c= pixel(3:3:1443,:)';
Red=double(a);
Green=double(b);
Blue=double(c);

RGB = zeros(height, width, band);

RGB = assignRGB(RGB,Red,Green,Blue);
showImage(RGB,'Original Image');

image=forLoop(height,width, Red, Green, Blue);
grey_image=image;

Mx = [-1 0 1; -2 0 2; -1 0 1];
My = [1 2 1; 0 0 0; -1 -2 -1];

Gx=0.25*Mx; % Normalize X 
Gy=0.25*My; %Normalize Y

extendedImage = extendBoundary(grey_image, width, height);


Gr=GR(height,width,3,extendedImage,Gx);
Gc=GC(height,width,3,extendedImage,Gy);
normalizedX=norX(height, width, 3, extendedImage,Gx,Gy);
normalizedY=norY(height, width, 3, extendedImage,Gx,Gy);

showImage(normalizedX,'x-gradient');
showImage(normalizedY,'y-gradient');

gradientMap=sqrt(Gr.^2 + Gc.^2);

normalizedMap=((gradientMap-min(min(gradientMap)))./(max(max(gradientMap))-min(min(gradientMap)))) * 255;

showImage(normalizedMap,'Normalized Gradient Magnitude Map');

histogram=getHistogram(height,width,normalizedMap);




syms CDF;
P=histogram/(height * width);
CDF(1,1)=P(1,1);
for pix=2:255+1
    CDF(pix)=CDF(pix-1)+P(pix);
end



percent = 0.85;
for pix=1:256
    if percent < CDF(pix)
       thresholds=pix-1;  
       break;
    end
end

edgeMap=binaryImage(height,width, normalizedMap,thresholds);
showImage(edgeMap,'Threshold = 85%');


