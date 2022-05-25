function GHistEq = histEqTrans(G, Gmax)
hist = myHist(G, Gmax);
width = size(G, 2); height = size(G,1);
cumuProb = myCumsum(hist);
GHistEq = zeros(height, width);
for int=0:Gmax
    for i=1:height
        for j=1:width
            if G(i,j)==int
                GHistEq(i,j) = floor(cumuProb(int+1) * Gmax/(width*height));
            end
        end
    end
end
end

function hist = myHist(G,Gmax)
width = size(G, 2);
height = size(G, 1);
hist = zeros(Gmax+1, 1);
for int=0:Gmax
    for i=1:height
        for j=1:width
            if int==G(i,j)
                hist(int+1) = hist(int+1) + 1;
            end
        end
    end
end
end

function cumuProb = myCumsum(hist)
cumuProb = zeros(size(hist));
g0 = 0;
for i=1:length(cumuProb)
    g0 = g0 + hist(i);
    cumuProb(i) = g0;
end
end

