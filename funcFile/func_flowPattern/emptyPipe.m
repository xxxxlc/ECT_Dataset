function [flowGrid, name] = emptyPipe(Eempty,GRID_NUM)
% EMPTYPIPE
% This function is used to generate an empty pipe flow pattern grid
%
%   Input parameters
%   Eempty: Empty tube capacitance
%   GRID_NUM: Generated mesh size

%   Output parameters
%   flowGrid: Generate flow pattern concentration grid
%   name: Chinese name of flow type

flowGrid = zeros(GRID_NUM, GRID_NUM) + Eempty;
name = '空管';


end

