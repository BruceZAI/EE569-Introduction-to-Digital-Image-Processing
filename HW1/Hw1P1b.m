% Name: Changjun Zai
% ID: 1127473900
% Email: czai@usc.edu
% Date: January 30, 2022

Hat=readraw1("Hat_new.raw");

N=256;
%Transfer function based histogram equalization
X=0:255;
for i=0:255
    count=0;
    
    for j=1:N
        for k=1:N
            if(Hat(j,k)==i)
                count=count+1;
            end
            
        end
    end
    
   Y(1,i+1)=count;
     
end


Probability=Y/(N*N);
CDF(1,1)=Probability(1,1);

for i=2:256
    CDF(1,i)=CDF(1,i-1)+Probability(1,i);
    
end
HS1=floor(CDF*255);

figure(1)

plot(X,CDF);
title('Histograms for Hat');
xlabel('Pixel intensity');
ylabel('CDF');


for k=1:256
    for i=1:N
        for j=1:N
            if(Hat(i,j)==k-1)
                Hat_h(i,j)=HS1(1,k);
            end
            
        end
    end
end

figure(2);
imshow(uint8(Hat_h));
title('Transfer function based Histogram equalization enhanced image for Hat');


for i=0:255
    count=0;
    
    for j=1:N
        for k=1:N
            if(Hat_h(j,k)==i)
                count=count+1;
            end
            
        end
    end
    
   Y_h(1,i+1)=count;
   
end
Probability=Y_h/(N*N);
CDF(1,1)=Probability(1,1);

for i=2:256
    CDF(1,i)=CDF(1,i-1)+Probability(1,i);
    
end
figure(3)
plot(X,CDF);
title('Transfer function after Histogram equalization for Hat');
xlabel('Pixel intensity');
ylabel('CDF');



% Bucket filling method

G = myReadRaw('Hat_new.raw', 256, 256, 0);
Gnew = bucketFilling(G,0,255);
%Gnew = histEqualTrans(G);
figure(4)
imshow(uint8(Gnew));
title('Cumulative Probability based Histogram equalization for Hat');
figure(5)
hist1 = myHist(G);
stem(X,hist1);
title('Original CDF');
xlabel('Pixel intensity');
ylabel('Frequency/Count');
figure(6)
hist2 = myHist(Gnew);
stem(X,hist2);
title('Cumulative Probability Histogram for Hat');
xlabel('Pixel intensity');
ylabel('Frequency/Count');



function hist = myHist(G)

width = size(G, 2);
height = size(G, 1);
hist = zeros(256, 1);
for int=0:255
    for i=1:height
        for j=1:width
            if int==G(i,j)
                hist(int+1) = hist(int+1) + 1;
            end
        end
    end
end
end













