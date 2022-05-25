function G2 = inverse(G)
G2 = zeros(size(G));

if length(unique(G)) > 2
    G = G2binary(G);
end

for i=1:length(G(:))
    if G(i) == 1
        G2(i) = 0;
    else
        G2(i) = 1;
    end
end
end