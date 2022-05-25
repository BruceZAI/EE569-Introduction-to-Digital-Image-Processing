function lawFilter = defineLawFilters

defineLawFilters(:,:,1) = [1 4 6 4 1; 4 16 24 16 4; 6 24 36 24 6; 4 16 24 16 4; 1 4 6 4 1]; % L5 * L5
defineLawFilters(:,:,2) = [-1 -2 0 2 1; -4 -8 0 4 8; -6 -12 0 12 6; -4 -8 0 8 4; -1 -2 0 2 1]; % L5 * E5
defineLawFilters(:,:,3) = [-1 0 2 0 -1; -4 0 8 0 -4; -6 0 12 0 -6; -4 0 8 0 -4; -1 0 2 0 -1]; % L5 * S5
defineLawFilters(:,:,4) = [-1 2 0 -2 1; -4 8 0 -8 4; -6 12 0 -12 6; -4 8 0 -8 4; -1 2 0 -2 1]; % L5 * W5
defineLawFilters(:,:,5) = [1 -4 6 -4 1; 4 -16 24 -16 4; 6 -24 36 -24 6; 4 -16 24 -16 4; 1 -4 6 -4 1]; % L5 * R5

defineLawFilters(:,:,6) = [-1 -4 -6 -4 -1; -2 -8 -12 -8 -2; 0 0 0 0 0; 2 8 12 8 12; 1 4 6 4 1]; % E5 * L5
defineLawFilters(:,:,7) = [1 2 0 -2 -1; 2 4 0 -4 -2; 0 0 0 0 0; -2 -4 0 4 2; -1 -2 0 2 1]; % E5 * E5
defineLawFilters(:,:,8) = [1 0 -2 0 1; 2 0 -4 0 2; 0 0 0 0 0; -2 0 4 0 -2; -1 0 2 0 -1]; % E5 * S5
defineLawFilters(:,:,9) = [1 -2 0 2 -1; 2 -4 0 4 -2; 0 0 0 0 0; -2 4 0 -4 2; -1 2 0 -2 1]; % E5 * W5
defineLawFilters(:,:,10) = [-1 4 -6 4 -1; -2 8 -12 8 -2; 0 0 0 0 0; 2 -8 12 -8 2; 1 -4 6 -4 1]; % E5 * R5


defineLawFilters(:,:,11) = [-1 -4 -6 -4 -1; 0 0 0 0 0; 2 8 12 8 2; 0 0 0 0 0; -1 -4 -6 -4 -1]; % S5 * L5
defineLawFilters(:,:,12) = [1 2 0 -2 -1; 0 0 0 0 0; -2 -4 0 4 2; 0 0 0 0 0; 1 2 0 -2 -1]; % S5 * E5
defineLawFilters(:,:,13) = [1 0 -2 0 1; 0 0 0 0 0; -2 0 4 0 -2; 0 0 0 0 0; 1 0 -2 0 1]; % S5 * S5
defineLawFilters(:,:,14) = [1 -2 0 2 1; 0 0 0 0 0; -2 4 0 -4 2; 0 0 0 0 0; 1 -2 0 2 -1]; % S5 * W5
defineLawFilters(:,:,15) = [-1 4 -6 4 -1; 0 0 0 0 0; 2 -8 12 -8 2; 0 0 0 0 0; -1 4 -6 4 -1]; % S5 * R5


defineLawFilters(:,:,16) = [-1 -4 -6 -4 -1; 2 8 12 8 2; 0 0 0 0 0; -2 -8 -12 -8 -2; 1 4 6 4 1]; % W5 * L5
defineLawFilters(:,:,17) = [1 2 0 -2 -1; -2 -4 0 4 2; 0 0 0 0 0; 2 4 0 -4 -2; -1 -2 0 2 1]; % W5 * E5
defineLawFilters(:,:,18) = [1 0 -2 0 1; -2 0 4 0 -2; 0 0 0 0 0; 2 0 -4 0 2; -1 0 2 0 -1]; % W5 * S5
defineLawFilters(:,:,19) = [1 -2 0 2 -1; -2 4 0 -4 2; 0 0 0 0 0; 2 -4 0 4 -2; -1 2 0 -2 1]; % W5 * W5
defineLawFilters(:,:,20) = [-1 4 -6 4 -1; 2 -8 12 -8 2; 0 0 0 0 0; -2 8 -12 8 -2; 1 -4 6 -4 1]; % W5 * R5


defineLawFilters(:,:,21) = [1 4 6 4 1; -4 -16 -24 -16 -4; 6 24 36 24 6; -4 -16 -24 -16 -4; 1 4 6 4 1]; % R5 * L5
defineLawFilters(:,:,22) = [-1 -2 0 2 1; 4 8 0 -8 -4; -6 -12 0 12 6; 4 8 0 -8 -4; -1 -2 0 2 1]; % R5 * E5
defineLawFilters(:,:,23) = [-1 0 2 0 -1; 4 0 -8 0 4; -6 0 12 0 -6; 4 0 -8 0 4; -1 0 2 0 -1]; % R5 * S5
defineLawFilters(:,:,24) = [-1 2 0 -2 1; 4 -8 0 8 -4; -6 12 0 -12 6; 4 -8 0 8 -4; -1 2 0 -2 1]; % R5 * W5
defineLawFilters(:,:,25) = [1 -4 6 -4 1; -4 16 -24 16 -4; 6 -24 36 -24 6; -4 16 -24 16 -4; 1 -4 6 -4 1]; % R5 * R5


lawFilter(:,:,1) = defineLawFilters(:,:,1);
lawFilter(:,:,2) = defineLawFilters(:,:,2);
lawFilter(:,:,3) = defineLawFilters(:,:,3);
lawFilter(:,:,4) = defineLawFilters(:,:,4);
lawFilter(:,:,5) = defineLawFilters(:,:,5);


lawFilter(:,:,6) = defineLawFilters(:,:,6);
lawFilter(:,:,7) = defineLawFilters(:,:,7);
lawFilter(:,:,8) = defineLawFilters(:,:,8);
lawFilter(:,:,9) = defineLawFilters(:,:,9);
lawFilter(:,:,10) = defineLawFilters(:,:,10);


lawFilter(:,:,11) = defineLawFilters(:,:,11);
lawFilter(:,:,12) = defineLawFilters(:,:,12);
lawFilter(:,:,13) = defineLawFilters(:,:,13);
lawFilter(:,:,14) = defineLawFilters(:,:,14);
lawFilter(:,:,15) = defineLawFilters(:,:,15);


lawFilter(:,:,16) = defineLawFilters(:,:,16);
lawFilter(:,:,17) = defineLawFilters(:,:,17);
lawFilter(:,:,18) = defineLawFilters(:,:,18);
lawFilter(:,:,19) = defineLawFilters(:,:,19);
lawFilter(:,:,20) = defineLawFilters(:,:,20);


lawFilter(:,:,21) = defineLawFilters(:,:,21);
lawFilter(:,:,22) = defineLawFilters(:,:,22);
lawFilter(:,:,23) = defineLawFilters(:,:,23);
lawFilter(:,:,24) = defineLawFilters(:,:,24);
lawFilter(:,:,25) = defineLawFilters(:,:,25);

end
