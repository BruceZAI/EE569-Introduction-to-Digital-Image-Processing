% Name: Changjun Zai
% ID: 1127473900
% Email: czai@usc.edu
% Date: February 20, 2022

% Demo for Structured Edge Detector (please see readme.txt first).

%% set opts for training (see edgesTrain.m)
opts=edgesTrain();                % default options (good settings)
opts.modelDir='models/';          % model will be in models/forest
opts.modelFnm='modelBsds';        % model name
opts.nPos=5e5; opts.nNeg=5e5;     % decrease to speedup training
opts.useParfor=0;                 % parallelize if sufficient memory

%% train edge detector (~20m/8Gb per tree, proportional to nPos/nNeg)
tic, model=edgesTrain(opts); toc; % will load model if already trained

%% set detection parameters (can set after training)
model.opts.multiscale=1;          % for top accuracy set multiscale=1
model.opts.sharpen=2;             % for top speed set sharpen=0
model.opts.nTreesEval=4;          % for top speed set nTreesEval=1
model.opts.nThreads=4;            % max number threads for evaluation
model.opts.nms=1;                 % set to true to enable nms

%% evaluate edge detector on BSDS500 (see edgesEval.m)
if(0), edgesEval( model, 'show',1, 'name','' ); end

%% detect edge and visualize results
I = imread('Tiger.jpg');
tic, E=edgesDetect(I,model); toc
figure(1); im(I); figure(2); im(1-E);
%P=1-E;

[thrs,cntR,sumR,cntP,sumP,V] = edgesEvalImg(E, 'Tiger_GT.mat');
R=cntR./sumR;
P=cntP./sumP;
for i = 1:thrs
F(i) = 2 * (P(i) * R(i))/(P(i) + R(i));
end
%figure();
%plot(F);
p=mean(P,'omitnan');
r=mean(R);
f =(2*p*r)/(p+r);


