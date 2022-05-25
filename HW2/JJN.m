function b = JJN(image,height,width,b,T)
F1=cArray(height+4,width+4);
m=1;
n=-1;
p=2;
q=-2;
F1(3:height+p,3:width+p)= image;

i=3;
while i <= height+2
    j=3;
    while j<= width+2
        if(F1(i,j)>T)
            b(i+q,j+q) = 255;
            e=F1(i,j)-255;
        else
            b(i+q,j+q) = 0;
            e=F1(i,j);
        end
        F1(i,j+m)=F1(i,j+m)+(7/48)*e;
        F1(i,j+p)=F1(i,j+p)+(5/48)*e;
       F1(i+m,j)=F1(i+m,j)+(7/48)*e;
        F1(i+p,j)=F1(i+p,j)+(5/48)*e;
        F1(i+m,j+m)=F1(i+m,j+m)+(5/48)*e;
        F1(i+m,j+p)=F1(i+m,j+p)+(3/48)*e;
        F1(i+p,j+m)=F1(i+p,j+m)+(3/48)*e;
        F1(i+p,j+p)=F1(i+p,j+p)+(1/48)*e;
        F1(i+m,j+n)=F1(i+m,j+n)+(5/48)*e;
        F1(i+m,j+q)=F1(i+m,j+q)+(3/48)*e;
        F1(i+p,j+n)=F1(i+p,j+n)+(3/48)*e;
        F1(i+p,j+q)=F1(i+p,j+q)+(1/48)*e;
        j=j+1;
    end
    i=i+1;
end

end