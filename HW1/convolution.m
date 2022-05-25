function G2 = convolution(G,filter)
height = size(G,1); width = size(G,2);
n = size(filter,1);
height_new = height-n+1;
width_new = width-n+1;
G2 = zeros(height_new, width_new);
for i=1:height_new
    for j=1:width_new
        x = 0;
        for k=1:n
            for l=1:n
                x = x + filter(k,l) * G(i+k-1,j+l-1);
            end
        end
        G2(i,j) = x;
    end
end
end