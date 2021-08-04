function [gridIndex, NumImageElem] = gridFileImport(Gridinf, nodeinf)
%GRIDFILEIMPORT 
%   Write the flow concentration matrix to the .txt file into the .txt file

%   Input parameters:
%   A: Flow pattern concentration distribution matrix
%   fileName: file name
% 
%   Output parameters:
%   FileName: file name
%   PathName: file path


[gridIndex, NumImageElem] = grid_meshing(nodeinf);                         %网格划分??

end

