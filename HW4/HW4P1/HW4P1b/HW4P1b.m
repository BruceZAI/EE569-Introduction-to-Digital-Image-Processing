% Name: Changjun Zai
% ID: 1127473900
% Email: czai@usc.edu
% Date: March 27, 2022

clear all; 
close all;
clc;


% Load the 25-D and 3-D feature vectors obtained above
% Load .mat files
featuresTrain = load('featuresTrain.mat');
featuresTrainPCA = load('featuresTrainPCA.mat');
featuresTest = load('featuresTest.mat');
featuresTestPCA = load('featuresTestPCA.mat');
testLabels = load('testLabels.mat');
trainLabels = load('trainLabels.mat');


% Load the matrices from .mat files
featuresTest = featuresTest.featuresTest;
featuresTrain = featuresTrain.featuresTrain;
featuresTrainPCA = featuresTrainPCA.featuresTrainPCA;
featuresTestPCA = featuresTestPCA.featuresTestPCA;
testLabels = testLabels.testLabels;
trainLabels = trainLabels.trainLabels;

% Unsupervised Learning
% merge train and test
mergeAll = [featuresTrain; featuresTest];
mergePCA = [featuresTrainPCA; featuresTestPCA];
mergeLabels = [trainLabels, testLabels];

% K-means
% Apply the K-means algorithm 
errorKmeansAll = KMeans(mergeAll, mergeLabels);
disp("Error rate of KMeans on 25D Feature Vector: " + errorKmeansAll);

errorKmeansPCA = KMeans(mergePCA, mergeLabels);
disp("Error rate of KMeans on 3D Feature Vector: " + errorKmeansPCA);


% Use the test labels to evaluate the purity of each cluster. 
errorRateCluster = Cluster(featuresTestPCA,featuresTrainPCA);

disp("Error rate of using clustering: " + errorRateCluster);


% Supervised Learning
% Get the error rate of Random Forest classifier

RFLeaf = [5,10,20,50,100,200,500];
for i = 1:length(RFLeaf)
        % construct the tree and make a prediction
        RFModel = TreeBagger(2000, featuresTrainPCA, trainLabels,'MinLeafSize', RFLeaf(i));
        predChar = RFModel.predict(featuresTestPCA);
        predChar = str2double(predChar);
        
        % calculate how many values match
        numMatch = 0;
        for j = 1:size(predChar,1)
            if predChar(j) == testLabels(j)
                numMatch = numMatch + 1;
            end
        end
        
        % get the error rate
        errorRate = 1 - numMatch/length(predChar);
        disp("The error rate for using " + RFLeaf(i) + " random forest is: " + errorRate);
end


% Get the error rate of Support Vector Machine classifier

            % construct template for the SVM
            t = templateSVM('Standardize',true,'KernelFunction','rbf','Solver','SMO');
            
            % fit the svm
            SVMModel = fitcecoc(featuresTrainPCA, trainLabels, 'Learners', t, 'FitPosterior',true);
            
            % Make a prediction
            predChar2 = predict(SVMModel, featuresTestPCA);
            
            % Calculate the error rate
            numMatch = 0;
            for k = 1:size(predChar2,1)
                if predChar2(k) == testLabels(k)
                    numMatch = numMatch + 1;
                end
            end
            errorRate = 1 - numMatch/size(predChar2,1);
            
            disp("The error rate for using SVM is : "+errorRate);








