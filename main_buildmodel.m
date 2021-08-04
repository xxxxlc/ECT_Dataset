clear all;
filepath = '.\data_test_txt\';
savepath = '.\data_test_result\';
namelist = dir(strcat(filepath, '*.txt'));
len = length(namelist);
load('.\data_mat_flow\flow_data.mat');

for i = 1:1:len
    filename = namelist(i).name;
    ect_matrix = buildmodel(strcat(filepath, filename));
    j = strsplit(filename, '.');
    j = j{1, 1};
    j = str2num(j);
    disp(j);
    
    data_out = zeros(1, 28);
    k = 1;
    for col = 1:1:7
        for row = col + 1:1:8
            data_out(k) = ect_matrix(row, col);
            k = k + 1;
        end
    end
    
    flow_data(j).ect_matrix = data_out;
    data = flow_data(j);
    name = strsplit(filename,'.');
    filename = char(strcat(name(1), '.mat'));
    save(strcat(savepath, filename), 'data');
    disp(i);
    
    
end
%ect_matrix = buildmodel(filename);

% 生成数据集

