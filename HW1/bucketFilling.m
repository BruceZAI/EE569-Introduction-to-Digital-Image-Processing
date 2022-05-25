function G2 = bucketFilling(G, Gmin, Gmax)
%Cumulative Probability based Histogram Equalization : Bucket Filling Method
%   usage in p1.b: G2 = bucketFilling(G)
%   usage in p1.c: G2 = bucketFilling(G, 15, 235) since `Y` in YUV format
%   has minimum 15 and maximum 235
%   G: origon graph
%   Gmin (omittable): the smallest possible value of G
%   Gmax (omittable): the largest possible value of G

if nargin==1
    Gmin = 0;
    Gmax = 255;
end
height = size(G,1);%return rows
width = size(G,2);%return cols
G2 = zeros(height, width);

bucket = Gmax-Gmin+1;
pixelPerBucket = ceil(width * height / bucket);
hist = zeros(bucket,1);
indices = zeros(2, width*height);

% compute the histogram
% store the indices of each pixel in indices
m = 1;
for int=Gmin:Gmax
    for i=1:height
        for j=1:width
            if G(i,j)==int
                hist(int-Gmin+1) = hist(int-Gmin+1) + 1;
                indices(1,m) = i;
                indices(2,m) = j;
                m = m + 1;
            end
        end
    end
end

% 
p = Gmin;
n = 1;
for i=1:width*height
    if n > pixelPerBucket
        n = 1;
        p = p+1;
    end
    G2(indices(1,i), indices(2,i)) = p;
    n = n + 1;
end


end

