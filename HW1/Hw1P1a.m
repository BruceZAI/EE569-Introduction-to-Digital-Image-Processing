% Name: Changjun Zai
% ID: 1127473900
% Email: czai@usc.edu
% Date: January 30, 2022

Imagedata=readraw("House.raw");
w = 768;
h = 512;

I_data=zeros(516,772);
fid=fopen('House.raw','rb');

A=fread(fid,[512 768],'uchar');
%A=A'; 
%Assign data to matrix I
for i=1:512

     for j=1:768
         I_data(i,j)=A((i-1)*w+j);

         
         
         
     end

end
% Bilinear Demosaicing
%Computation of bilinear interpolation of all pixels in the image except at the boundary pixel 

for i=3:514
    for j=3:770
        if(mod((i-1),2)==0)
            if(mod((j-1),2)==0)
                 G(i-2,j-2)=I_data(i,j); 
                 R(i-2,j-2)=0.5*(I_data(i,j+1)+I_data(i,j-1));
                 B(i-2,j-2)=0.5*(I_data(i+1,j)+I_data(i-1,j));
             else
                 R(i-2,j-2)=I_data(i,j); 
                 B(i-2,j-2)=0.25*(I_data(i-1,j-1)+I_data(i-1,j+1)+I_data(i+1,j-1)+I_data(i+1,j+1));
                 G(i-2,j-2)=0.25*(I_data(i,j-1)+I_data(i,j+1)+I_data(i-1,j)+I_data(i+1,j));
            end
        else
               if(mod((j-1),2)==0)
                 B(i-2,j-2)=I_data(i,j); 
                 G(i-2,j-2)=0.25*(I_data(i,j-1)+I_data(i,j+1)+I_data(i-1,j)+I_data(i+1,j));
                 R(i-2,j-2)=0.25*(I_data(i-1,j-1)+I_data(i-1,j+1)+I_data(i+1,j-1)+I_data(i+1,j+1));
               else
                 G(i-2,j-2)=I_data(i,j); 
                 R(i-2,j-2)=0.5*(I_data(i+1,j)+I_data(i-1,j));
                 B(i-2,j-2)=0.5*(I_data(i,j+1)+I_data(i,j-1));
             end
        end
    end
end
    
% Stacking Red,Green and Blue plane to form RGB image from bilinear demosaicing
RGB(1:512,1:768,1)=R(1:512,1:768);
RGB(1:512,1:768,2)=G(1:512,1:768);
RGB(1:512,1:768,3)=B(1:512,1:768);

%Displaying the image obtained from Bilinear Demosaicing method
figure(1);
imshow(uint8(RGB));   %Since the RGB matrix is of type "double", the matrix is first casted to type "uint8) before displaying
title("Bilinear Demosaicing");