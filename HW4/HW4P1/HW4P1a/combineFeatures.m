function features = combineFeatures(featureImages)

features = [];
for i = 1:size(featureImages,2)
    matrixes = cell2mat(featureImages(i));
    features = [features; matrixes];
end
end