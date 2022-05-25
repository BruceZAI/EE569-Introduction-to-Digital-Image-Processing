function [] = maskShow(G, mask)
G_masked = ones(size(G)) * 255;
for i=1:size(G,1)
    for j=1:size(G,2)
        if mask(i,j) == 1
            G_masked(i,j,1) = G(i,j,1);
            G_masked(i,j,2) = G(i,j,2);
            G_masked(i,j,3) = G(i,j,3);
        end
    end
end
imshow(uint8(G_masked))
end