clear all;
addpath('func_file');
addpath('grid');
%% 全局变量设定
Global_variable_setting;
%% 循环产生流型
flow = zeros(1, 8000);
for i = 1:1:8000
    if mod(i, 2) == 0
        if mod(i, 20) / 2 == 1
            flow(i) = 3;
        elseif mod(i, 20) / 2 == 2
            flow(i) = 4;
        elseif mod(i, 20) / 2 == 3
            flow(i) = 5;
        elseif mod(i, 20) / 2 == 4
            flow(i) = 6;
        elseif mod(i, 20) / 2 == 5
            flow(i) = 7;
        elseif mod(i, 20) / 2 == 6 
            flow(i) = 8;
        elseif mod(i, 20) / 2 == 7 
            flow(i) = 8;
        elseif mod(i, 20) / 2 == 8 
            flow(i) = 9;
        elseif mod(i, 20) / 2 == 9 
            flow(i) = 9;
        elseif mod(i, 20) / 2 == 0 
            flow(i) = 9;
        end
    else  
        flow(i) = 10;
    end
end
flow = [3,4,7];
j = 1;
for i = 1:1:size(flow, 2)
%     filename = Generate_file_name(i, char(flowpattern(flow(i))));
    filename = strcat(num2str(j),'.txt');
    %randompic(filename);
    [matrix, feature] = Generate_flowpattern(flow(i), filename, j);
    image_array = fill_grid(matrix, grid_index, NumImageElem);
    flow_data(j).data_in = image_array;
    flow_data(j).name = feature;
    j = j + 1;
    if flow(i) == 10
        add_image_array = fill_grid(4.4 - matrix, grid_index, NumImageElem);
        flow_data(j).data_in = add_image_array;
        flow_data(j).name = feature;
        j = j + 1;
    end
    disp(i)
end
save('.\data_mat_flow\flow_data.mat', 'flow_data');
%% COMSOL模型计算
%[x] = buildmodel(1,1);
%%
