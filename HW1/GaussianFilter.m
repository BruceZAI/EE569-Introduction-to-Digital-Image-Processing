function G3 = GaussianFilter(G, n, sigma)
filter = zeros(n);
corner = floor((n-1)/2);
s = 0;
for i = -corner:corner
    for j = -corner:corner
        filter(i+corner+1,j+corner+1) = exp(-(i^2+j^2)/(2 * sigma^2)) / (2 * pi * sigma^2);
        s = s + exp(-(i^2+j^2)/(2 * sigma^2)) / (2 * pi * sigma^2);
    end
end
for i = -corner:corner
    for j = -corner:corner
        filter(i+corner+1,j+corner+1) = filter(i+corner+1,j+corner+1)/s;
    end
end

G2 = complete(G, corner);

% convolution
G3 = convolution(G2,filter);
for i=1:size(G3,1)
    for j=1:size(G3,2)
        G3(i,j) = G3(i,j);
    end
end
end
