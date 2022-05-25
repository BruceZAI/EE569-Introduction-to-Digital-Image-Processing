% Name: Changjun Zai
% ID: 1127473900
% Email: czai@usc.edu
% Date: January 30, 2022

% 1) Salt-and-pepper noise(impulse noise): the noise presents itself as
% sparsely occurring pixels for R/G/B. Besides, there is shot noise. Since
% impulse noise can be filtered out with median filter effectively, we
% should first apply a median filter. Otherwise, after we use a linear or
% unlinear filter to handle poisson(shot) noise, pixel with impulse noise 
% will affect the neighbours around them.

% After trying linear/Gaussian/Bilateral/NML filter, the best result is
% given by Bilateral filter with sigma_c=1, sigma_s=300, window size=7. The
% shortcoming of this method: it cannot fully remove Poisson noise of the
% picture.To improve its performance. Thus to imporve its performance, 
% we can apply more powerful shot noise denoising method, such as deep
% learning algorithm like PURE-LET

Flower = myReadRaw('Flower.raw',768,512,1);
Flower_noise = myReadRaw('Flower_noisy.raw',768,512,1);

figure()
subplot(2,2,1)
imshow(uint8(Flower))
title('original picture')
subplot(2,2,2)
imshow(uint8(Flower_noise))
title('with noise')

% using median filter to denoise impulse noise in R/G/B respectively
subplot(2,2,3)
f = @(G) (medianFilter(G, 3));
Flower_1 = RgbFilter(Flower_noise, f);
imshow(uint8(Flower_1))
title('After median filter')

% using filter to denoise Poisson noise in R/G/B respectively
subplot(2,2,4)
% f = @(G) GaussianFilter(G, 5, 0.5);
f = @(G) BilateralFilter(G,1.5,300,7);
Flower_2 = RgbFilter(Flower_1, f);
imshow(uint8(Flower_2))
title('After Bilateral filter')
myWriteRaw(Flower_2, 'Flower_mix_denoise.raw');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function G2 = medianFilter(G,windowSize)
width = size(G,2); height = size(G,1);
corner = floor(windowSize/2);
G_complete = complete(G,corner);
G2 = zeros(height, width);
for i=1:height
    for j=1:width
        G2(i,j) = medianPixel(i+corner,j+corner);
    end
end

    function pix = medianPixel(x,y)
        pixList = zeros(windowSize^2,1);
        flag = 1;
        for k=x-corner:x+corner
            for l=y-corner:y+corner
                pixList(flag) = G_complete(k,l);
                flag = flag + 1;
            end
        end
        pixList = sort(pixList);   % this function have equivalence in C++
        pix = pixList(floor(length(pixList)/2));
    end
end

