width = 600;
height = 400;
image = myReadRaw('bridge.raw',width,height,0);



[height,width] = size(image);

b=zeros(height,width);
T=128;
%Floyd-Steinberg

b=FS(image,height,width,b,T);
showImage(b,'Floyd-Steinberg');

%JJN
%ed = [0 0 0 7 5; 3 5 7 5 3; 1 3 5 3 1]/48;



b=JJN(image,height,width,b,T);
showImage(b,'JJN');

%Stucki


b=Stucki(image,height,width,b,T);
showImage(b,'Stucki');
