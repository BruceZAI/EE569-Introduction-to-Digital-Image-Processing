% Name: Changjun Zai
% ID: 1127473900
% Email: czai@usc.edu
% Date: January 30, 2022

% Load the picture
G = myReadRaw('Taj_Mahal.raw', 600, 400, 1);

% CLAHE
f = @clahe;
G2 = hazeRemove2(G,f);
figure()
subplot(2,2,1)
imshow(uint8(G))
title('original figure Taj\_Mahal')
subplot(2,2,2)
title('Original photo')
imshow(uint8(G2))
title('After Removing Haze with CLAHE Algorithm')
myWriteRaw(G2, 'Taj_Mahal_haze_removal_with_CLAHE.raw');

% method A in (b)
f = @histEq;
G3 = hazeRemove2(G,f);
subplot(2,2,3)
imshow(uint8(G3))
title('After Removing Haze with Transfer-function-based Histogram Equalization')
myWriteRaw(G3, 'Taj_Mahal_haze_removal_with_transfer_histoEq.raw');

% method B in (b)
f = @bucketFill;
G3 = hazeRemove2(G,f);
subplot(2,2,4)
imshow(uint8(G3))
title('After Removing Haze with Cumulative-probability-based Histogram Equalization')
myWriteRaw(G3, 'Taj_Mahal_haze_removal_with_Cumulative_histoEq.raw');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CLAHE function in matlab
function G2 = clahe(G)
G2 = zeros(size(G));
for i=1:size(G2,1)
    for j=1:size(G2,2)
        G2(i,j) = double(G(i,j)) / 235;
    end
end
G2 = adapthisteq(G2, 'clipLimit',0.015);
for i=1:size(G2,1)
    for j=1:size(G2,2)
        G2(i,j) = G2(i,j) * 235;
    end
end
end

% histo-eq 
function G2 = histEq(G)
G2 = histEqTrans(G,235);
end

% bucket filling
function Gnew = bucketFill(G)
Gnew = bucketFilling(G,15, 235);
end