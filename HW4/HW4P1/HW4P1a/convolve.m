
function out = convolve(Data, filter, row, col)
    % loop through the filter
    out = 0;
    for i = 0:4
        for j = 0:4
            out = out + (Data(row+i, col+j) * filter(i+1, j+1));
        end
    end
end