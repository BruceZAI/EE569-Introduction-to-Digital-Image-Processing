function F= fsMBVQ(e,F,i,j)

        

        m=1;
        n=-1;  
        k=1;
        l=-1;

        F(i,j+m)=F(i,j+m)+(7/16)*e;
        F(i+m,j+n)=F(i+m,j+n)+(3/16)*e;
        F(i+m,j)=F(i+m,j)+(5/16)*e;
        F(i+m,j+m)=F(i+m,j+m)+(1/16)*e;
end        

         
