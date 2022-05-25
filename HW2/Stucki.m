function b = Stucki(image,height,width,b,T)

F2=cArray(height+4,width+4);
m=1;
n=-1;
p=2;
q=-2;
F2(3:height+p,3:width+p)= image;

i=3;
while i <= height+2
    j=3;
    while j<= width+2
        if(F2(i,j)>T)
            b(i+q,j+q) = 255;
            e=F2(i,j)-255;
        else
            b(i+q,j+q) = 0;
            e=F2(i,j);
        end
        F2(i,j+m)=F2(i,j+m)+(8/42)*e;
        F2(i,j+p)=F2(i,j+p)+(4/42)*e;
        F2(i+m,j)=F2(i+m,j)+(8/42)*e;
        F2(i+p,j)=F2(i+p,j)+(4/42)*e;
        F2(i+m,j+m)=F2(i+m,j+m)+(4/42)*e;
        F2(i+m,j+p)=F2(i+m,j+p)+(2/42)*e;
        F2(i+p,j+m)=F2(i+p,j+m)+(2/42)*e;
        F2(i+p,j+p)=F2(i+p,j+p)+(1/42)*e;
        F2(i+m,j+n)=F2(i+m,j+n)+(4/42)*e;
        F2(i+m,j+q)=F2(i+m,j+q)+(2/42)*e;
        F2(i+p,j+n)=F2(i+p,j+n)+(2/42)*e;
       F2(i+p,j+q)=F2(i+p,j+q)+(1/42)*e;
        j=j+1;
    end
    i=i+1;
end
end