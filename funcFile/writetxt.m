function [FileName,PathName] = writetxt(A, fileName)
%WRITETXT ������д��.txt�ļ�
%   �˴���ʾ��ϸ˵��
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

