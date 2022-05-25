function D = ditheringMatrix(I0,n, r,F,F1,height,width)

I0=0;



f=4;
i=1;
while i<=r
    if i==1
    I=[f*I0+i f*I0+i+1 ;f*I0+i+2 f*I0 ];
    else
    t=I;
    j=1;
    I=[f*t+j f*t+j+1 ;f*t+j+1 f*t ];
    end
    i=i+1;
end

T=((I+0.5)/n.^2)*255;

k=height;
l=width;
i=1;
while i<=k
    j=1;
    while j<= l
        p=1;
        q=-1;
        
        if(0<=F(i,j) && F1(i,j)<=T(rem(i+q,n)+p,rem(j+q,n)+p))
            D(i,j)=0;
        else
            D(i,j)=255;
        end
        j=j+1;
    end
    i=i+1;
end

end
