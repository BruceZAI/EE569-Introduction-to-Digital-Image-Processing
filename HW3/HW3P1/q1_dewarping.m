warpedForky = dewarping('Forky_warp.raw', 328, 328);
myWriteRaw(warpedForky, 'Forky_dewarp.raw')
warped22 = dewarping('22_warp.raw', 328, 328);
myWriteRaw(warped22, '22_dewarp.raw')

function G2 = dewarping(filename, height, width)
% load the file
G = myReadRaw(filename, height, width, 1);
figure()
imshow(uint8(G));
G2 = zeros(size(G));
G = double(G);
for i=1:height
    for j=1:width
        % map i=height to 1; i=1 to -1; i=(height+1)/2 to 0
        x = (i - (height + 1)/2) / (height - 1) * 2;
        y = (j - (width + 1) /2) / (width - 1) * 2;
        [u,v] = ori2mod(x,y);
        p = uint32((u * (height-1) / 2) + ((height + 1) / 2));
        q = uint32((v * (width - 1) / 2 ) + ((width + 1) / 2));
        G2(i,j,1) = G(p, q, 1);
        G2(i,j,2) = G(p, q, 2);
        G2(i,j,3) = G(p, q, 3);
    end
end
figure()
imshow(uint8(G2))
end

function [u,v] = ori2mod(x,y)
if abs(x) > abs(y)
    if x > 0
        u = x - 0.3902*x^2 + 0.3902*y^2;
        v = y;
    else 
        u = x + 0.3902*x^2 - 0.3902*y^2;
        v = y;
    end
else
    if y > 0
        v = y + 0.3902*x^2 - 0.3902*y^2;
    else
        v = y - 0.3902*x^2 + 0.3902*y^2;
    end
    u = x;
end
end