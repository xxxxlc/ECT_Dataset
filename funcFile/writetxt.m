function [FileName,PathName] = writetxt(A, fileName)
%WRITETXT 
%   Write the flow concentration matrix to the .txt file into the .txt file

%   Input parameters:
%   A: Flow pattern concentration distribution matrix
%   fileName: file name
% 
%   Output parameters:
%   FileName: file name
%   PathName: file path

    path = '.\data_test_txt\';
    file = fopen(strcat(path,fileName), 'w');
    [row, col] = size(A);
    for i = 1:1:row
        for j = 1:1:col
            fprintf(file, '%f\t',A(i,j));
        end
        fprintf(file,'\r\n');
    end
    fclose(file);
    FileName = fileName;
    PathName = strcat(path,FileName);
end

