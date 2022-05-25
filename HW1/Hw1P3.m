% Name: Changjun Zai
% ID: 1127473900
% Email: czai@usc.edu
% Date: January 30, 2022

Flower = myReadRaw('Flower.raw',768,512,1);
Flower_noisy = myReadRaw('Flower_noisy.raw',768,512,1);
figure()
subplot(2,2,1)
imshow(uint8(Flower))
title('Flower')

% (1)

subplot(2,2,2)
f = @(G) glassEffect(G, 5);
Flower_glass5 = RgbFilter(Flower, f);
imshow(uint8(Flower_glass5))
title('Frosted glass effect on Flower with window size = 5')
myWriteRaw(Flower_glass5, 'Flower_with_frost_glass_filter.raw');
% subplot(2,2,4)
% f = @(G) glassEffect(G, 7);
% Flower_glass7 = RgbFilter(Flower, f);
% imshow(uint8(Flower_glass7))
% title('window size = 7')

% (2)
subplot(2,2,3)
imshow(uint8(Flower_noisy))
title('Flower\_noisy')
subplot(2,2,4)
f = @(G) glassEffect(G, 5);
Flower_noisy_glass5 = RgbFilter(Flower_noisy, f);
imshow(uint8(Flower_noisy_glass5))
title('Frosted glass effect on Flower\_noisy with window size = 5')

% (3.a)
figure()
Flower_gray_noisy = myReadRaw('Flower_gray_noisy.raw',768,512,0);
Fgn_bilat = BilateralFilter(Flower_gray_noisy,1.5,81,5);
Fgn_glass = glassEffect(Flower_gray_noisy,5);
Fgn_bilat_glass = glassEffect(Fgn_bilat, 5);
Fgn_glass_bilat = BilateralFilter(Fgn_glass,1.5,81,5);

subplot(2,2,1)
imshow(uint8(Fgn_bilat));
title('Bilateral filtered')
subplot(2,2,2)
imshow(uint8(Fgn_glass));
title('frosted-glass filtered')
subplot(2,2,3)
imshow(uint8(Fgn_bilat_glass));
title('Bilateral + frosted-glass filtered')
subplot(2,2,4)
imshow(uint8(Fgn_glass_bilat));
title('frosted-glass + Bilateral filtered')

myWriteRaw(Fgn_bilat_glass, 'Flower_denoise_then_glass.raw');
myWriteRaw(Fgn_glass_bilat, 'Flower_glass_then_denoise.raw');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function G2 = glassEffect(G,windowSize)
width = size(G,2); height = size(G,1);
corner = floor(windowSize/2);
G_complete = complete(G,corner);
G2 = zeros(height, width);
for i=1:height
    for j=1:width
        G2(i,j) = randomPixel(i+corner,j+corner);
    end
end

    function pix = randomPixel(x,y)
        pixList = zeros(windowSize^2,1);
        flag = 1;
        for k=x-corner:x+corner
            for l=y-corner:y+corner
                pixList(flag) = G_complete(k,l);
                flag = flag + 1;
            end
        end
        pix = pixList(randi(length(pixList)));
    end
end