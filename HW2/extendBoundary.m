function G = extendBoundary(Image, width, height)

n = 1;
Boundary_extended_image(n+1:height+n,n+1:width+n)=Image(1:height,1:width);
for i=1:n
   Boundary_extended_image(i,n+1:width+n)=Image(n-i+2,1:width);
   Boundary_extended_image(n+height+i,n+1:width+n)=Image(height-i,1:width);
end
for j=1:n
   Boundary_extended_image(:,j)=Boundary_extended_image(:,2*n-j+2);
   Boundary_extended_image(:,width+n+j)=Boundary_extended_image(:,(n+width)-j);
end

G=Boundary_extended_image;