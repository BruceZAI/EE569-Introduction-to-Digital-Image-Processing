function G2 = complete(G, corner)
% n: linear filter size
width = size(G,2); height = size(G,1);
G2 = zeros(height+ 2 * corner, width+ 2 * corner);
for i=1:height
    for j=1:width
        G2(i+corner, j+corner) = G(i,j);
    end
end
% complete the G
for i = 1:corner
    G2 = verticalReflect(G2,height+corner-i+1,height+corner+i);
    G2 = verticalReflect(G2,corner+i,corner-i+1);
end
for i = 1:corner
    G2 = horizontalReflect(G2,width+corner-i+1,width+corner+i);
    G2 = horizontalReflect(G2,corner+i,corner-i+1);
end

end

function G = verticalReflect(G,row1,row2)
width = size(G,2);
for i=1:width
    G(row2,i) = G(row1,i);
end
end

function G = horizontalReflect(G, col1, col2)
height = size(G,1);
for i=1:height
    G(i,col2) = G(i,col1);
end
end
