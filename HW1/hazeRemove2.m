function G2 = hazeRemove2(G, contrastFun)
width = size(G,2); height = size(G,1);

G_yuv = rgb2yuv(G);

Y = zeros(height, width);
for i=1:height
    for j=1:width
        Y(i,j) = G_yuv(i,j,1); 
    end
end
Y = uint8(Y);
Y2 = contrastFun(Y);

G_yuv2 = G_yuv;
for i=1:height
    for j=1:width
        G_yuv2(i,j,1) = Y2(i,j);
    end
end

G2 = yuv2rgb(G_yuv2);
end

function G_yuv = rgb2yuv(G)
G_yuv = zeros(size(G,1), size(G,2));
for i = 1:size(G,1)
    for j = 1:size(G,2)
        r = G(i,j,1); g = G(i,j,2); b = G(i,j,3);
        G_yuv(i, j, 1) = 0.257 * r + 0.504 * g + 0.098 * b + 16;
        G_yuv(i, j, 2) = -0.148 * r - 0.291 * g + 0.439 * b + 128;
        G_yuv(i, j, 3) = 0.439 * r - 0.368 * g - 0.071 * b + 128;
    end
end
end

function G_rgb = yuv2rgb(G)
G_rgb = zeros(size(G));
for i = 1:size(G,1)
    for j = 1:size(G,2)
        y = G(i,j,1); u=G(i,j,2); v=G(i,j,3);
        G_rgb(i, j, 1) = 1.164 * (y-16) + 1.596 * (v - 128);
        G_rgb(i, j, 2) = 1.164 * (y-16) - 0.813 * (v - 128) - 0.391* (u - 128);
        G_rgb(i, j, 3) = 1.164 * (y-16) + 2.018 * (u - 128);
    end
end
end

