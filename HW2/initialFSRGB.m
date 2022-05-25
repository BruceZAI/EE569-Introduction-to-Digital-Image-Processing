function color = initialFSRGB(height,width,RGB)
a=2;
color=zeros(height+a,width+a);
b=1;
color(2:height+b,2:width+b)=double(RGB);

end