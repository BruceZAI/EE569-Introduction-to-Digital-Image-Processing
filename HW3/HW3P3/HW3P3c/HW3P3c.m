beans = myReadRaw('beans.raw', 494, 82, 1);
b3 = beans(:,:,3);


b3 = G2binary(b3);
[n,G] = find_connect_size(b3, 1, 1);%turn background to black
figure()
imshow(G)

THRESHOLD = 10000;
G_shrink = bwmorph(G, 'shrink', Inf);

height = size(G,1);
width = size(G,2);
n = sum(G_shrink(:));
index = zeros(n,2);

flag = 1;
for i=1:height
    for j=1:width
        if G_shrink(i,j) == 1%check and record holes in beans
            index(flag,1) = i;
            index(flag,2) = j;
            flag = flag + 1;
        end
    end
end

% for each point in G_shrink, check if it is a defect
n_defect = 0;
size_defect = [];

for i=1:n
    x = index(i,1);
    y = index(i,2);
    n_connect = find_connect_size(b3, x, y);
    if THRESHOLD > n_connect
        n_defect = n_defect + 1;
        size_defect = [size_defect, n_connect];
        [~, b3] = find_connect_size(b3, x, y);%turn holes in beans to black
    end
end
figure()
b3 = inverse(b3);
imshow(b3)

% now compute the number of beans
b_shrinked = bwmorph(b3, 'shrink', Inf);
n_beans = sum(b_shrinked(:));
disp(['There are ', num2str(n_beans), ' beans.'])

% find the mask
index = zeros(n_beans,2);

flag = 1;
for i=1:height
    for j=1:width
        if b_shrinked(i,j) == 1%check and record beans information
            index(flag,1) = i;
            index(flag,2) = j;
            flag = flag + 1;
        end
    end
end

masks = cell(n_beans,1);
sizes = zeros(n_beans,1);
for i=1:n_beans
    mask = find_mask(b3, index(i,1), index(i,2));%Generate the segmentation mask
    masks{i} = mask;
    sizes(i) = sum(mask(:));%compute the sizes of beans
end

figure()
% sort and show
[~,I] = sort(sizes);
for i=1:n_beans
    subplot(n_beans,1,i)
    maskShow(beans,masks{I(i)})
end

