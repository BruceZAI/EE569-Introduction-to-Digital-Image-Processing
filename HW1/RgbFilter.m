function G2 = RgbFilter(G,handle)
% apply function handle to G(:,:,1), G(:,:,2), G(:,:,3) respectively
height = size(G,1); width = size(G,2);
G2 = zeros(height, width, 3);
G2(:,:,1) = handle(G(:,:,1));
G2(:,:,2) = handle(G(:,:,2));
G2(:,:,3) = handle(G(:,:,3));
end