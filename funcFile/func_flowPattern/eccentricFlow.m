function [flowGrid, name] = eccentricFlow(GRID_NUM, Eempty, Efull, r, center_x, center_y)
%ECCENTRICFLOW 
%   This function is used to generate eccentric flow pattern
%   
%   Input parameters
%   Eempty: Empty tube capacitance
%   Efull: Efull tube capacitance
%   GRID_NUM: Generated mesh size
%   r: The inner radius of the eccentric flow pattern,
%   if there is no input, it will be randomly generated
%   center_x: The abscissa of the center of the eccentric flow pattern, 
%   if there is no input, it will be randomly generated
%   center_y: The ordinate of the center of the eccentric flow pattern, 
%   if there is no input, it will be randomly generated

%   Output parameters
%   flowGrid: Generate flow pattern concentration grid
%   name: Chinese name of flow type

    if nargin < 4
        center_x = round(rand() * GRID_NUM);                              
        center_y = round(rand() * GRID_NUM);
        while ((center_x - GRID_NUM/2)^2 + (center_y - GRID_NUM/2)^2 ...
                >= (GRID_NUM/2)^2)
            center_x = round(rand() * GRID_NUM);                               
            center_y = round(rand() * GRID_NUM); 
        end
        
        a = [center_x, center_y, ...
            GRID_NUM - center_x, GRID_NUM - center_y];
        max_r = min(a);
        r = round(rand() * max_r);                                            
    end
    
    flowGrid = zeros(GRID_NUM, GRID_NUM);

    for row = 1:1:GRID_NUM
        for col = 1:1:GRID_NUM
            if ((col - center_x)^2 + (row - center_y)^2 <= r^2)
                flowGrid(row,col) = Efull;
            else
                flowGrid(row,col) = Eempty;
            end
        end
    end
    name = '偏心流';
    
end

