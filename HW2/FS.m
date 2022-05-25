function b = FS(image,height,width,b,T)

F=cArray(height+2,width+2);
m=1;
n=-1;
F(2:height+m,2:width+m)= image;

i=2;
while i<=height+1
    j=2;
    while j<=width+1
        
        if(F(i,j)>T)
            b(i+n,j+n) = 255;
            e=F(i,j)-255;
        else
            b(i+n,j+n) = 0;
            e=F(i,j);
        end
        
        F(i,j+m)=F(i,j+m)+0.4375*e;
        F(i+m,j+n)=F(i+m,j+n)+0.1875*e;
        F(i+m,j)=F(i+m,j)+0.3125*e;
        F(i+m,j+m)=F(i+m,j+m)+0.0625*e;
        j=j+1;
    end
    i=i+1;
end



end