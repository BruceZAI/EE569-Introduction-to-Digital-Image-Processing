function errorRate = KMeans(inputData, labels)
    MaxIters = 2000;
    predictions = kmeans(inputData, 4, 'Distance', 'cityblock', 'MaxIter', MaxIters);
    
    labelCounter = zeros(4,4);
    for i = 1:size(predictions)
        labelCounter(predictions(i), labels(i)) = labelCounter(predictions(i), labels(i)) + 1;
    end

    labelKmean = [];
    for i = 1:4
        [M,I] = max(labelCounter(i,:)); 
        labelKmean = [labelKmean, I];
    end

    correct = 0;
    for i = 1:48
       if labelKmean(predictions(i)) == labels(i)
           correct = correct + 1;
       end
    end
    errorRate = 1 - correct/48;
end