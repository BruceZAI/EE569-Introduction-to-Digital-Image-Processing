function G = readRawHW(filename)
f = fopen(filename,'r');
Data=fread(f,[576*3 432],'*uint8');
fclose(f);
Red=Data(1:3:1726,:)';
Green=Data(2:3:1727,:)';
Blue=Data(3:3:1728,:)';
G(:,:,1)=Red;
G(:,:,2)=Green;
G(:,:,3)=Blue;

end