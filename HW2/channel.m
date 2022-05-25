function color = channel(height,width,RGB)

color=255*ones(height,width) - (double(RGB));

end