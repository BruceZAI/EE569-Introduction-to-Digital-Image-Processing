function G3 = meanFilter(G, n)
filter = ones(n); % Generate an N*N all-1 matrix

corner = uint32((n-1)/2);
G2 = complete(G, corner);

% convolution
G3 = convolution(G2,filter);
for i=1:size(G3,1)
    for j=1:size(G3,2)
        G3(i,j) = G3(i,j)/n^2;
    end
end
end
