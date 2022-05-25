function [n,G] = find_connect_size(G, x, y)
% if only one argout, this function will output the number of pixel
% connected; if two argout, it will also return the corrected picture
height = size(G,1);
width = size(G,2);
waiting_list = [x,y];
n = 0;
while length(waiting_list) >= 1
    n = n+1;
    i = waiting_list(1,1);
    j = waiting_list(1,2);
    waiting_list(1,:) = []; %remove first row
    G(i,j)=0;%add up,down,left,right fit points to waitinglist
    if i >1 && G(i-1,j)==1
        G(i-1,j) = 0;
        waiting_list = [waiting_list; [i-1,j]];%queue
    end
    if i < height && G(i+1,j)==1
        G(i+1,j) = 0;
        waiting_list = [waiting_list; [i+1,j]];
    end
    if j > 1 && G(i,j-1)==1
        G(i,j-1) = 0;
        waiting_list = [waiting_list; [i,j-1]];
    end
    if j < width && G(i, j+1)==1
        G(i,j+1) = 0;
        waiting_list = [waiting_list; [i,j+1]];
    end
end
    

end