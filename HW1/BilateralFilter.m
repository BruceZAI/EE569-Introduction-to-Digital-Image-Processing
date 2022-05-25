function G2 = BilateralFilter(G,c,s,n)
if nargin==3
    n = 3;
end
corner = floor(n/2);
height = size(G,1); width = size(G,2);
G_complete = complete(G,corner);
G2 = zeros(height,width);
for i = 1:height
    for j = 1:width
        G2(i,j) = bilateral_y(i+corner,j+corner,corner,G_complete,c,s);
    end
end
end

function y = bilateral_y(i,j,corner,I,c,s)
numerator = 0;
denominator = 0;
for k=i-corner:i+corner
    for l=j-corner:j+corner
        w = bilateral_w(i,j,k,l,I,c,s);
        numerator = numerator + I(k,l)*w;
        denominator = denominator + w;
    end
end
y = numerator / denominator;
end


function w = bilateral_w(i,j,k,l,I,c,s)
% compute w(i,j,k,l) in the definition of Bilateral Filtering
% c: sigma_c
% s: sigma_s
w = exp(-((i-k)^2+(j-l)^2)/(2*c^2) - (I(i,j)-I(k,l))^2/(2*s^2));
end