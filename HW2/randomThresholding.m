function R = randomThresholding(height,width, F1);

m=height;
n=width;
i=1;
while i<= m
    j=1;
    while j<= n
        p=0;
        q=255;
        r(i,j)=randi([p q],1);
        if(F1(i,j) >= p && F1(i,j) < r(i,j))
            R(i,j)=p;
        else
            R(i,j)=q;
        end
        j= j+1;
    end
    i= i+1;
end

end