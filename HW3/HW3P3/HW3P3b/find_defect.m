function [n_defect, size_defect, G] = find_defect(G, threshold)
if nargin==1
    THRESHOLD = 100;   % the maximum a defect size chould be
else
    THRESHOLD = threshold;
end

G = G2binary(G);
G = inverse(G);
G_shrink = bwmorph(G, 'shrink', Inf);

height = size(G,1);
width = size(G,2);
n = sum(G_shrink(:));
index = zeros(n,2);

flag = 1;
for i=1:height
    for j=1:width
        if G_shrink(i,j) == 1
            index(flag,1) = i;
            index(flag,2) = j;
            flag = flag + 1;
        end
    end
end

% for each point in G_shrink, check if it is a defect
n_defect = 0;
size_defect = [];

for i=1:n
    x = index(i,1);
    y = index(i,2);
    n_connect = find_connect_size(G, x, y);
    if THRESHOLD > n_connect
        n_defect = n_defect + 1;
        size_defect = [size_defect, n_connect];
        [~, G] = find_connect_size(G, x, y);
    end
end

G = inverse(G);

end