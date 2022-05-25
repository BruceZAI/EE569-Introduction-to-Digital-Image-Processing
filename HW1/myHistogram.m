function [] = myHistogram(G)
height = size(G,1); width = size(G,2);
histogram = zeros(256,1);
for pix=0:255
    for i=1:height
        for j=1:width
            if G(i,j,1)>=pix && G(i,j,1)<pix+1
                histogram(pix+1) = histogram(pix+1) + 1;
            end
        end
    end
end
figure()
bar(histogram);

end