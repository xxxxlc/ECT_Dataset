function [flowGrid, name] = laminarFlow(GRID_NUM, Eempty, Efull, height)
%LAMINARFLOW 
%  This function is used to generate laminar flow grid
%  
%   Input parameters
%   Eempty: Empty tube capacitance
%   Efull: Efull tube capacitance
%   GRID_NUM: Generated mesh size
%   height: Height of laminar flow pattern, If the height of the laminar 
%   flow pattern is not output, the height is randomly generated

%   Output parameters
%   flowGrid: Generate flow pattern concentration grid
%   name: Chinese name of flow type

    if nargin < 4
        height = round(rand() * GRID_NUM/2);                                   % Random height that produces laminar flow
    end
    
    flowGrid = zeros(GRID_NUM, GRID_NUM);
    for row = 1:1:GRID_NUM
        for col = 1:1:GRID_NUM
            if col <= height
                flowGrid(row,col) = Efull;
            else
                flowGrid(row,col) = Eempty;
            end
        end
    end
    name = '层流';
end

