function [flowGrid,name] = filledPipe(Efull,GRID_NUM)
%FILLEDPIPE 
% This function is used to generate an full pipe flow pattern grid
%
%   Input parameters
%   Efull: Efull tube capacitance
%   GRID_NUM: Generated mesh size

%   Output parameters
%   flowGrid: Generate flow pattern concentration grid
%   name: Chinese name of flow type

flowGrid = zeros(GRID_NUM, GRID_NUM) + Efull;
name = '满管';

end

