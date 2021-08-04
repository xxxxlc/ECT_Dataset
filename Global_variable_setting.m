%% 网格文件读入
addpath('func_file');
Gridinf='GridElec8Node32Image1054';                                        %网格文件名字
s=regexp(Gridinf,'\d+','match');                                           %正则化搜索数字
NumElectrode=str2num(char(s(1)));                                          %电极个数
NumOneElecNode=str2num(char(s(2)));                                        %电极？
NumElePair=NumElectrode*(NumElectrode-1)/2;                                %每对电极数

AllElecNode = AllElecNode_func(NumOneElecNode);                            %这个函数啥用，选规格？

nodeinf = 'GridElec8Node32Image1054.xlsx';
[grid_index, NumImageElem] = grid_meshing(nodeinf);                        %网格划分??



%% 文件路径
outputtxt_filepath = '..\data_set_txt';

%% 流型
flowpattern = {'Empty_pipe', 'Filled_pipe', 'Laminar_flow', 'Full_ring', 'Center_ring', 'Eccentric_ring', ...
    'Central_flow', 'Eccentric_flow', 'Any_core_stream', 'rand_flow_pattern'};
%% 物理量
global Eempty
global Efull
global Eglass
global Eout
e0=8.855e-12;                                                              %介电常数
Efull=3.4;                                                                 %管内介电常数
Eempty=1;                                                                  %空气介电常数
Eglass=3.4;                                                                %石英玻璃管道介电常数
Eout=1;                                                                    %屏蔽层介电常数
BigNum=1e10;


%% COMSOL 常量
GRID_NUM = 200;                                                            %COMSOL网格数量