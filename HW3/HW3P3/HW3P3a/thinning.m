function G = thinning(G)
G = G2binary(G);
figure()
subplot(1,3,1)
imshow(G)
title('Binary Image');

G2 = thin_mask(G,20);
subplot(1,3,2)
imshow(G2)
title('20TH Processing Image');

G3 = thin_mask(G2,Inf);
subplot(1,3,3)
imshow(G3)
title('Final Image');
end