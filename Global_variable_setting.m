
%% 网格文件读入
Gridinf='GridElec8Node32Image1054';                                        % Grid file
s=regexp(Gridinf,'\d+','match');                                           %正则化搜索数字
NumElectrode=str2num(char(s(1)));                                          %电极个数
NumOneElecNode=str2num(char(s(2)));                                        %电极？
NumElePair=NumElectrode*(NumElectrode-1)/2;                                %每对电极数

AllElecNode = AllElecNode_func(NumOneElecNode);                            %这个函数啥用，选规格？

nodeinf = 'GridElec8Node32Image1054.xlsx';
[grid_index, NumImageElem] = grid_meshing(nodeinf);                        %网格划分??

