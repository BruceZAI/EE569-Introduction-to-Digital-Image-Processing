function choice = match(G,i,j,pattern)
height = size(G,1);
width = size(G,2);
choice = 0;

if i == 1 || i ==height || j==1 || j==width || G(i,j)==0
    return
end

abc_flag = 0;
abc_exsit = 0;
for x=1:3
    for y=1:3
        if pattern(x,y)==1
            if G(i-2+x, j-2+y)==0
            % doesn't match, return
                return
            end
        elseif pattern(x,y)==0
            if G(i-2+x, j-2+y)==1
            % doesn't match return
            return
            end
        elseif pattern(x,y)==14
            continue
        elseif pattern(x,y)>10    % this is a or b or c
            abc_flag = abc_flag + G(i-2+x, j-2+y);
            abc_exsit = 1;
        end
    end
end
if abc_exsit == 1 && abc_flag == 0  % first, has abc, second, none of them is one
    return
end

% match
choice = 1;
return

end