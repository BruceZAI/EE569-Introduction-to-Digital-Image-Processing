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
v=zeros(height,width,band);
[height, width]=size(Red);

F_Red = initialFSRGB(height,width,Red);
F_Green = initialFSRGB(height,width,Green);
F_Blue = initialFSRGB(height,width,Blue);


i=2;
q=-1;
while i<=height+1
    j=2;
    while j<= width+1
       
       r=double(Red(i-1,j-1));
       g=double(Green(i-1,j-1));
       b=double(Blue(i-1,j-1));
       mbvq=MBVQ(r,g,b);
        v=closetVertex(mbvq,F_Red(i,j),F_Green(i,j),F_Blue(i,j));
        r= 1;
        c = 1;
        b1 =1;
        b2=2;
        b3=3;
        m=1;
        n=-1;
        b_Red(i-1,j-1)=v(r,c,b1);
        e_Red = F_Red(i+n,j+n)-b_Red(i+n,j+n);

        b_Green(i-1,j-1)=v(r,c,b2);
        e_Green=F_Green(i+n,j+n)-b_Green(i+n,j+n);

        b_Blue(i-1,j-1)=v(r,c,b3);            
        e_Blue=F_Blue(i+n,j+n)-b_Blue(i+n,j+n);

        
        F_Red = fsMBVQ(e_Red,F_Red,i,j);
        F_Green = fsMBVQ(e_Green,F_Green,i,j);
        F_Blue = fsMBVQ(e_Blue,F_Blue,i,j);
        j=j+1;
    end
    i=i+1;
end


mbvqRGB(:,:,1)=b_Red;
mbvqRGB(:,:,2)=b_Green;
mbvqRGB(:,:,3)=b_Blue;
figure();
imshow(uint8(mbvqRGB));
title('MBVQ-based Error diffusion');