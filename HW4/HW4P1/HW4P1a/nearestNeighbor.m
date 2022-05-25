function label = nearestNeighbor(featuresTrainPCA,vectorTest)

% Split train set
    blanketTrain = featuresTrainPCA(1:9,:);
    brickTrain = featuresTrainPCA(10:18,:);
    grassTrain = featuresTrainPCA(19:27,:);
    stonesTrain = featuresTrainPCA(28:36,:);
    
    % get the mahalanobis distance of each sample in test w.r.t each
    % texture
    
    dBlanket = mahal(vectorTest, blanketTrain);
    dBrick = mahal(vectorTest, brickTrain);
    dGrass = mahal(vectorTest, grassTrain);
    dStones = mahal(vectorTest, stonesTrain);
    
    
    % Output Label
    % Set blanket to 1, brick to 2, grass to 3, stones to 4

    if (dBlanket < dBrick) && (dBlanket < dGrass) && (dBlanket < dStones)
        label = 1;
    elseif (dBrick < dBlanket) && (dBrick < dGrass) && (dBrick < dStones)
        label = 2;
    elseif (dGrass < dBlanket) && (dGrass < dBrick) && (dGrass < dStones)
        label = 3;
    elseif (dStones < dBlanket) && (dStones < dBrick) && (dStones < dGrass)
        label = 4;
    end
end