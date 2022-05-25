function image = forLoop(height,width, R, G, B)

i=1;

while i <= height
    j=1;
    while j <= width
        r=0.299;
        g= 0.5870;
        b=0.1440;
       
        r=r*R(i,j);
        g=g*G(i,j);
        b=b*B(i,j);
        image(i,j)=b+g+r;
        j =j +1;
    end
    i=i+1;
end

end