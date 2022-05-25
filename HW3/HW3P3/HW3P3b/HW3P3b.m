deer = myReadRaw('deer.raw', 550, 691, 0);
[n_defect, size_defect, deer_corrected] = find_defect(deer);

disp(['the number of defect is ', num2str(n_defect)])
disp('the frequence of defect size is shown in the histogram')
figure()
imshow(deer_corrected)
figure()
histogram(size_defect)