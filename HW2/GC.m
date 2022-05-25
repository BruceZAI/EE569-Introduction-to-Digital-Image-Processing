function Gc = GC(height,width,size, extended,Gy)
Gc=cArray(height,width);

i=2;
while i <= height + 1
    j=2;
    while j <= width+1
        m=-1;
        while m<= 1
            n=-1;
            while n<= 1
                Gc(i-1,j-1)=Gc(i-1,j-1)+Gy(((size+1)/2)+m,((size+1)/2)+n)*extended(i+m,j+n);
                n=n+1;
            end
            m=m+1;
        end
        j=j+1;
    end
    i=i+1;
end
end