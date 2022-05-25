% Name: Changjun Zai
% ID: 1127473900
% Email: czai@usc.edu
% Date: March 27, 2022

clear all;
clc;

height = 128;
width = 128;
band = 1;

trainPath = "D:\OneDrive - my.swjtu.edu.cn\BOARD\USC\Spring 2022\EE 569\Homework\HW4\EE569_2022Spring_HW4_materials\EE569_2022Spring_HW4_materials\train";
testPath = "D:\OneDrive - my.swjtu.edu.cn\BOARD\USC\Spring 2022\EE 569\Homework\HW4\EE569_2022Spring_HW4_materials\EE569_2022Spring_HW4_materials\test";

trainFiles = dir(fullfile(trainPath,'*.raw')); % gets all raw train files
testFiles = dir(fullfile(testPath,'*.raw')); % gets all raw test files

% call all train files to trainNames

trainNames = appendFiles(trainFiles, trainPath);

% call all test files to testNames

testNames = appendFiles(testFiles, testPath);


% 25 2D Law Filters

lawFilter = defineLawFilters;

% read train images and get their feature vectors 

 featureImagesTrain = getFeatureVector(trainNames,height,width,band,lawFilter);

% read test images and get their feature vectors 

featureImagesTest = getFeatureVector(testNames,height,width,band,lawFilter);

% merge all features to a large matrix

featuresTrain = combineFeatures(featureImagesTrain);

featuresTest = combineFeatures(featureImagesTest);

% Evaluate the discriminant power of train features
discriminantPowers = findDiscrimPower(featuresTrain);


% perform PCA on 25D feature set to reduce its dimension to 3
[coeffTrain, scoreTrain, latentTrain] = pca(featuresTrain);
featuresTrainPCA = featuresTrain * coeffTrain(:,1:3);

[coeffTest, scoreTest, latentTest] = pca(featuresTest);
featuresTestPCA = featuresTest * coeffTrain(:,1:3);

% Visualize the data representation in the space of the first three principal components.
% Split train set
blanketTrain = featuresTrainPCA(1:9,:);
brickTrain = featuresTrainPCA(10:18,:);
grassTrain = featuresTrainPCA(19:27,:);
stonesTrain = featuresTrainPCA(28:36,:);

scatter3(blanketTrain(:,1),blanketTrain(:,2),blanketTrain(:,3));
hold on
scatter3(brickTrain(:,1),brickTrain(:,2),brickTrain(:,3));
hold on
scatter3(grassTrain(:,1),grassTrain(:,2),grassTrain(:,3));
hold on
scatter3(stonesTrain(:,1),stonesTrain(:,2),stonesTrain(:,3));
axis equal
legend('Blanket','Brick','Grass','Stones');
xlabel('1st Principal Component')
ylabel('2nd Principal Component')
zlabel('3rd Principal Component')


% Conduct texture classification using the nearest neighbor rule based criterion
% Set blanket to 1, brick to 2, grass to 3, stones to 4 

testLabels = [3, 1, 1, 4, 4, 1, 3, 2, 4, 2, 1, 3];

predictLabels = clarifyImages(featuresTestPCA,featuresTrainPCA);

% Calculate error rate of predictions
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

disp("Error rate of predictions is: " + errorRate);

% Save the 25-D and 3-D feature vectors obtained for following questions
trainLabels = [1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4];

save('featuresTrain.mat', 'featuresTrain');  % 25-D training matrix
save('featuresTrainPCA.mat', 'featuresTrainPCA');  % 3-D training matrix
save('featuresTest.mat', 'featuresTest');  % 25-D testing matrix
save('featuresTestPCA.mat', 'featuresTestPCA');  % 3-D testing matrix
save('testLabels.mat', 'testLabels');  % labels of test 
save('trainLabels.mat', 'trainLabels');  % labels of train

