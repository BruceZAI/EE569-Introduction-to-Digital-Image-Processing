function G = myReadRaw(fileName, width, height, color)
% read a .raw file
%   fileName: string
%   width:    int
%   height:   int
%   color:    logical
if ~color
    G = zeros(height, width);
else
    G = zeros(height, width, 3);
end

disp(['	Retrieving Image ' fileName ' ...']);

	% Get file ID for file
	fid=fopen(fileName,'rb');

	% Check if file exists
	if (fid == -1)
	  	error('can not open input image file press CTRL-C to exit \n');
	end

	% Get all the pixels from the image
	pixel = fread(fid, inf, 'uchar');

	% Close file
	fclose(fid);
    
    % convert raw to RGB or grey pictures
    if ~color
        N_pixel = length(pixel);
        if N_pixel ~= width * height
            error('can not convert images to given width*height')
        end
        for i=1:height
            for j=1:width
                G(i, j) = pixel((i-1)*width + j);
            end
        end
        
    else
        N_pixel = int32(length(pixel) / 3);
        if N_pixel ~= width * height
            error('can not convert images to given width*height')
        end
        for i=1:height
            for j=1:width
                G(i,j,1) = pixel((i-1)*width*3 + j*3 - 2);
                G(i,j,2) = pixel((i-1)*width*3 + j*3 - 1);
                G(i,j,3) = pixel((i-1)*width*3 + j*3    );
            end
        end
    end

end

