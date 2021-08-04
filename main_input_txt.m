clear all;

%% Add function file path
addpath('funcFile');
addpath('grid');

%% Global variable setting
Global_variable_setting;

%% Generate flow pattern loop sequence
flowPatternSequence = generateFlow(12, 1);                                 % Generate flow sequence
                                                                           % Laminar_flow: 3
                                                                           % Full_ring: 4
                                                                           % Center_ring: 5
                                                                           % Eccentric_ring: 6
                                                                           % Central_flow: 7
                                                                           % Eccentric_flow: 8
                                                                           % Any_core_stream: 9
                                                                           % Random flow pattern:10
                                                                           % A set of random flow patterns includes two flow 
                                                                           % patterns, one of which is a randomly generated flow 
                                                                           % pattern, and the other is a complementary flow 
                                                                           % pattern of the random flow pattern


%% Generate flow pattern txt file

txtFileNameNumber = 1;                                                     % txt file name number

flowPattern = {'Empty_pipe', ...                                           % Flow type
               'Filled_pipe', ...
               'Laminar_flow', ...              
               'Full_ring',  ...              
               'Center_ring', ...
               'Eccentric_ring', ...
               'Central_flow',  ...
               'Eccentric_flow', ...
               'Any_core_stream', ...
               'Random_flow_pattern'};
                 
for i = 1:1:size(flowPatternSequence, 2)

    fileName = [num2str(txtFileNameNumber), ...                            % Txt file name generated by splicing
                '_', ...
                flowPattern{flowPatternSequence(i)}, ...
                '.txt'];

    [matrix, feature] = Generate_flowpattern(flowPatternSequence(i), ...
                                             fileName, GRID_NUM);
    image_array = fill_grid(matrix, grid_index, NumImageElem);
    flow_data(txtFileNameNumber).data_in = image_array;
    flow_data(txtFileNameNumber).name = feature;
    txtFileNameNumber = txtFileNameNumber + 1;
    if flow(i) == 10
        add_image_array = fill_grid(4.4 - matrix, grid_index, NumImageElem);
        flow_data(txtFileNameNumber).data_in = add_image_array;
        flow_data(txtFileNameNumber).name = feature;
        txtFileNameNumber = txtFileNameNumber + 1;
    end
    disp(i)
end
save('.\data_mat_flow\flow_data.mat', 'flow_data');
%% COMSOL模型计算
%[x] = buildmodel(1,1);
%%
