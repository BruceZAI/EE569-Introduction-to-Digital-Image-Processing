
function featureVector = lawFilters(Data, lawFilter)
    % Construct feature vector 
    featVec = {};

    % Calculate the global mean in image
    globalMean = 0;
    for i = 1:128
        for j = 1:128
            globalMean = globalMean + Data(i,j);
        end
    end
    globalMean = (globalMean / (128*128));
    
    % Subtract the global mean from each pixel and divide by 255 to normalize
    % normalize
     for i = 1:128
         for j = 1:128
             Data(i,j) = (Data(i,j)-globalMean); %/255.0;
         end
     end
        
        
    % Zero pad the image to apply a 5x5 filter
    paddedData = zeros(132);
    paddedData(3:130, 3:130) = Data;

    % Loop through all of the law filters and convolve them with the image
    for filter_index = 1:size(lawFilter,3)
        outFilter = zeros(128);
        for row = 1:128
            for col = 1:128
                outFilter(row,col) = convolve(paddedData, lawFilter(:,:,filter_index), row, col);
            end
        end
        % Append the output of law filter to the feature vec
        featVec = [featVec, outFilter];
    end
    
    % Loop through the feature vec and calculate the energy 
    featureVector = [];
    for i = 1:size(featVec,2)
        sum = 0;
        matrix = cell2mat(featVec(1,i));
        for j = 1:128
            for k = 1:128
                sum = sum + (matrix(i,j)*matrix(i,j));
            end
        end
        sum = sum/(128*128);
        featureVector = [featureVector, sum];
    end
    
     % Normalize the energy vector
     meanFeature = mean(featureVector);
     stdEnergy = std(featureVector);
     
     for i = 1:size(featureVector,2)
         featureVector(i) = (featureVector(i)-meanFeature)/stdEnergy;
     end
end