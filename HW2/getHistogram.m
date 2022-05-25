function h = getHistogram(height,width,Map)
h = zeros(256,1);

m=height;
n=width;
pix=0;
while pix <= 255
    i=1;
    while i <=m
        j=1;
        while j<= n
            p=1;
            if Map(i,j,p) >= pix && Map(i,j,p)< pix+p
             h(pix+p) = h(pix+p) + p;
            end
            j=j+1;
        end
        i=i+1;
    end
    pix=pix+1;
end

end