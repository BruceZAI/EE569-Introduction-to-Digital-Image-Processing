function Data = readraw(path, height, width, band)
    fib = fopen(path,'rb');
    
    % Read in as a single byte stream
    I = fread(fib, width*height*band,'uchar');
    
    % Reshape
    I = reshape(I, [width height band]);
    
    % Transpose
    Data = flip(imrotate(I, -90),2);
    
    fclose(fib);
end
