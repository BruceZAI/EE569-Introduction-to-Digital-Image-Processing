function featureImages = getFeatureVector(names,height,width,band,lawFilter)

% loop through all the image paths
featureImages = {};
for i = 1:size(names,2)
    % read the image in
    path = names(i);
    trainData = readraw(path, height, width, band);
    trainData = double(trainData);
    
    % get the feature vector
    featureVector = lawFilters(trainData, lawFilter);
    
    % append feature vector to holder
    featureImages = [featureImages, featureVector];
end