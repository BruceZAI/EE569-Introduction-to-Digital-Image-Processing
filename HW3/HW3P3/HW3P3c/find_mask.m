function [mask] = find_mask(G, x, y)
% if only one argout, this function will output the number of pixel
% connected; if two argout, it will also return the corrected picture
height = size(G,1);
width = size(G,2);
mask = zeros(size(G));

waiting_list = [x,y];
n = 0;
while length(waiting_list) >= 1
    n = n+1;
    i = waiting_list(1,1);
    j = waiting_list(1,2);
    waiting_list(1,:) = [];
    G(i,j)=0;
    mask(i,j)=1;
    if i >1 && G(i-1,j)==1
        G(i-1,j) = 0;
        mask(i-1,j)=1;
        waiting_list = [waiting_list; [i-1,j]];
    end
    if i < height && G(i+1,j)==1
        G(i+1,j) = 0;
        mask(i+1,j)=1;
        waiting_list = [waiting_list; [i+1,j]];
    end
    if j > 1 && G(i,j-1)==1
        G(i,j-1) = 0;
        mask(i,j-1)=1;
        waiting_list = [waiting_list; [i,j-1]];
    end
    if j < width && G(i, j+1)==1
        G(i,j+1) = 0;
        mask(i,j+1)=1;
        waiting_list = [waiting_list; [i,j+1]];
    end
end
    

end