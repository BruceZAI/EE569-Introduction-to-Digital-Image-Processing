function normalized = norX(height,width,size, extended,Gx,Gy)
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
                gr=Gr(i-1,j-1);
                gc=Gc(i-1,j-1);
                Gr(i-1,j-1)=gr+Gx(((size+1)/2)+m,((size+1)/2)+n)*extended(i+m,j+n);
                Gc(i-1,j-1)=gc+Gy(((size+1)/2)+m,((size+1)/2)+n)*extended(i+m,j+n);
                n=n+1;
            end
            m=m+1;
        end
        j=j+1;
    end
    i=i+1;
end
normalized=((GR(height,width,3,extended,Gx)-min(min(GR(height,width,3,extended,Gx))))./(max(max(GR(height,width,3,extended,Gx)))-min(min(GR(height,width,3,extended,Gx))))) * 255;


end