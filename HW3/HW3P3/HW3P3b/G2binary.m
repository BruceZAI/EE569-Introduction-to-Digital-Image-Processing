function G2 = G2binary(G)
G_max = max(G(:));
G2 = zeros(size(G));
for i=1:size(G,1)
    for j=1:size(G,2)
        if G(i,j) * 2 >= G_max
            G2(i,j) = 1;
        else
            G2(i,j) = 0;
        end
    end
end

end