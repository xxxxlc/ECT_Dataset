function [flowGrid, name] = centerRing(GRID_NUM, Eempty, Efull, r1, r2)
%CENTERRING 
%   This function is used to generate circular circulation pattern
%   
%   Input parameters
%   Eempty: Empty tube capacitance
%   Efull: Efull tube capacitance
%   GRID_NUM: Generated mesh size
%   r1: The inner radius of the center circulation type, 
%   if there is no input, it will be randomly generated
%   r2: The Outer radius of the center circulation type, 
%   if there is no input, it will be randomly generated

%   Output parameters
%   flowGrid: Generate flow pattern concentration grid
%   name: Chinese name of flow type
    
    if nargin < 4
        r1 = round(rand() * GRID_NUM/2);                                   % Generate ring radius r1
        r2 = round(rand() * (GRID_NUM/2 - r1)) + r1;                       % Generate ring radius r2
    end
    
    flowGrid = zeros(GRID_NUM, GRID_NUM);
    for row = 1:1:GRID_NUM
        for col = 1:1:GRID_NUM
            if ((col - GRID_NUM/2)^2 + (row - GRID_NUM/2)^2 <= r2^2) & ...
                ((col - GRID_NUM/2)^2 + (row - GRID_NUM/2)^2 >= r1^2)
                flowGrid(row,col) = Efull;
            else
                flowGrid(row,col) = Eempty;
            end
        end
    end
    name = '圆心环';
end

