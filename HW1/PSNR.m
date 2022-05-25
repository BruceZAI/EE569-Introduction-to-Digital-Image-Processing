function psnr = PSNR(X, Y)
% return the PSNR value
%   psnr: has the length of size(X,3)
MAX = 255;
N = size(X, 1);
M = size(X, 2);
channel = size(X,3);
for c=1:channel
    mse = 0;
    for i=1:N
        for j=1:M
            mse = mse + (Y(i,j,c)-X(i,j,c))^2;
        end
    end
    mse = mse / (N * M);
    psnr(c) = 10 * log(MAX^2 / mse) / log(10);
end

end

