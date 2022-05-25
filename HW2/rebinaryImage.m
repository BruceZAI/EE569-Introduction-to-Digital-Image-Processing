function edgeMap = rebinaryImage(height,width, normalizedMap,thresholds)

m=height;
n=width;
i=1;
while i<=m
    j=1;
    while j<=n
        if normalizedMap(i,j) > thresholds 
           edgeMap(i,j)=255; 
       else
           edgeMap(i,j)=0;
        end
        j=j+1;
    end
    i=i+1;
end

end