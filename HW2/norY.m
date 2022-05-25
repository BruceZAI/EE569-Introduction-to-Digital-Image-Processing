function normalized = norY(height,width,size, extended,Gx,Gy)
gao=height;
kuan=width;
Gr=cArray(gao,kuan);
Gc=cArray(gao,kuan);

i=2;
while i <= gao + 1
    j=2;
    while j <= kuan+1
        m=-1;
        while m<= 1
            n=-1;
            while n<= 1
                Gr(i-1,j-1)=Gr(i-1,j-1)+Gx(((size+1)/2)+m,((size+1)/2)+n)*extended(i+m,j+n);
                Gc(i-1,j-1)=Gc(i-1,j-1)+Gy(((size+1)/2)+m,((size+1)/2)+n)*extended(i+m,j+n);
                n=n+1;
            end
            m=m+1;
        end
        j=j+1;
    end
    i=i+1;
end
normalized=((GC(height,width,3,extended,Gy)-min(min(GC(height,width,3,extended,Gy))))./(max(max(GC(height,width,3,extended,Gy)))-min(min(GC(height,width,3,extended,Gy))))) * 255;

end