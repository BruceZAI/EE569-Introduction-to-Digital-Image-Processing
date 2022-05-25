function errorRate = Cluster(featuresTest,featuresTrain)

testLabels = [3, 1, 1, 4, 4, 1, 3, 2, 4, 2, 1, 3];
predictLabels = clarifyImages(featuresTest,featuresTrain);


correct = 0;
testAmount = 12;
i = 1;
while i <= testAmount
    if testLabels(i) == predictLabels(i)
        correct = correct + 1;        
    
    end
    i = i + 1;
    
end

errorRate = 1 - correct/12;