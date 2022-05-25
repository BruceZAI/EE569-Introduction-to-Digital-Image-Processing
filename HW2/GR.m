function Gr = GR(height,width,size, extended,Gx)

gao=height;
kuan=width;
Gr=cArray(gao,kuan);

i=2;
while i <= gao + 1
    j=2;
    while j <= kuan+1
        m=-1;
        while m<= 1
            n=-1;
            while n<= 1
                Gr(i-1,j-1)=Gr(i-1,j-1)+Gx(((size+1)/2)+m,((size+1)/2)+n)*extended(i+m,j+n);
                n=n+1;
            end
            m=m+1;
        end
        j=j+1;
    end
    i=i+1;
end

end