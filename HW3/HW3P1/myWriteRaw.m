function count = myWriteRaw(G, filename)
%writeraw - write RAW format grey/rgb image file 
% Usage :	myWriteRaw(G, filename)
% G:		input image matrix
% filename: file name of the file to write to disk
% count:	return value, the elements written to file

	disp([' Write image data to'  filename ' ...']);

	% Get file ID
	fid = fopen(filename,'wb');

	% Check if file exists
	if fid == -1
		error('can not open output image filem press CTRL-C to exit \n')
    end

    width = size(G,2);
    height = size(G,1);
    if length(size(G))==2
        G2 = zeros(width * height,1);
        for i=1:height
            for j=1:width
                G2((i-1)*width + j) = G(i, j);
            end
        end
    else
        G2 = zeros(width * height * 3, 1);
        for i=1:height
            for j=1:width
                G2((i-1)*width*3 + j*3 - 2) = G(i, j, 1);
                G2((i-1)*width*3 + j*3 - 1) = G(i, j, 2);
                G2((i-1)*width*3 + j*3    ) = G(i, j, 3);
            end
        end
    end
    
	% Write and close file
	count = fwrite(fid, G2, 'uchar');
	fclose(fid);
        
end %function