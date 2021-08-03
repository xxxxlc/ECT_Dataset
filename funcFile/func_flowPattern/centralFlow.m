function [flowGrid, name] = centralFlow(GRID_NUM, Eempty, Efull, r)
%CENTRALFLOW
%  The inner diameter of the flow pattern that produces the center flow
%  
%   Input parameters
%   Eempty: Empty tube capacitance
%   Efull: Efull tube capacitance
%   GRID_NUM: Generated mesh size
%   r: The radius of thecenter flow type, 
%   if there is no input, it will be randomly generated

%   Output parameters
%   flowGrid: Generate flow pattern concentration grid
%   name: Chinese name of flow type


    if nargin < 4
        r = round(rand() * GRID_NUM/2);                                    % Generate circle radius
    end
    
    flowGrid = zeros(GRID_NUM, GRID_NUM);

    for row = 1:1:GRID_NUM
        for col = 1:1:GRID_NUM
            if (col - GRID_NUM/2)^2 + (row - GRID_NUM/2)^2 <= r^2
                flowGrid(row,col) = Efull;
            else
                flowGrid(row,col) = Eempty;
            end
        end
    end
    name = '中心流';
end

