function predictLabels = clarifyImages(featuresTestPCA,featuresTrainPCA)

predictLabels = [];
S = size(featuresTestPCA);

for i = 1:S
    vectorTest = featuresTestPCA(i,:);
    label = nearestNeighbor(featuresTrainPCA,vectorTest);
    predictLabels = [predictLabels, label];
end

end