function names = appendFiles(files,path)

names = {};

for i = 1:length(files)
    % get the base and full file paths
    baseName = files(i).name;
    fullName = fullfile(path, baseName);
    
    % append full name to train names array
    names = [names, fullName];
end

end