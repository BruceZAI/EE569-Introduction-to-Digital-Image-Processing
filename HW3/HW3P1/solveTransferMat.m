
%  to compute the transfer matrix from orginal picture to modified picture
A = zeros(6);
A(:,1) = compute_col(0,0);
A(:,2) = compute_col(0.5,0.5);
A(:,3) = compute_col(1,1);
A(:,4) = compute_col(0.5,-0.5);
A(:,5) = compute_col(1,-1);
A(:,6) = compute_col(1,0);

b = [0 0.5 1 0.5 1 0.609756 ;
     0 0.5 1 -0.5 -1 0];

disp('original to modified')
b / A

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  to compute the transfer matrix from modified picture to orginal picture
A = zeros(6);
A(:,1) = compute_col(0,0);
A(:,2) = compute_col(0.5,0.5);
A(:,3) = compute_col(1,1);
A(:,4) = compute_col(0.5,-0.5);
A(:,5) = compute_col(1,-1);
A(:,6) = compute_col(0.609756,0);

b = [0 0.5 1 0.5 1 1 ;
     0 0.5 1 -0.5 -1 0];

disp('modified to original')
b / A

function col = compute_col(x,y)
% return a column vector with the corresponding value
col = [1 x y x^2 x*y y^2];
col = col';
end