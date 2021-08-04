function [flowGrid, name] = eccentricRing(GRID_NUM, Eempty, Efull, r1, r2, center_x, center_y)
%ECCENTRICRING 
%   This function is used to generate eccentric circulation pattern
%   
%   Input parameters
%   Eempty: Empty tube capacitance
%   Efull: Efull tube capacitance
%   GRID_NUM: Generated mesh size
%   r1: The inner radius of the center circulation type, 
%   if there is no input, it will be randomly generated
%   r2: The Outer radius of the center circulation type, 
%   if there is no input, it will be randomly generated
%   center_x: The abscissa of the center of the eccentric circulation type, 
%   if there is no input, it will be randomly generated
%   center_y: The ordinate of the center of the eccentric circulation type, 
%   if there is no input, it will be randomly generated

%   Output parameters
%   flowGrid: Generate flow pattern concentration grid
%   name: Chinese name of flow type
    
    if nargin < 4:
        center_x = round(rand() * GRID_NUM);                              
        center_y = round(rand() * GRID_NUM);
        while ((center_x - GRID_NUM/2)^2 + (center_y - GRID_NUM/2)^2 ...
                >= (GRID_NUM/2)^2)
            center_x = round(rand() * GRID_NUM);                           % The x-coordinate that produces 
                                                                           % the circular circulation pattern
            center_y = round(rand() * GRID_NUM);                           % The y-coordinate that produces 
                                                                           % the circular circulation pattern
        end
        a = [center_x, center_y, ...
            GRID_NUM - center_x, GRID_NUM - center_y];
        max_r = min(a);
        r1 = round(rand() * max_r);                                        % The inner diameter that produces 
                                                                           % the circular flow pattern
        r2 = round(rand() * (max_r - r1)) + r1;                            
    end
    
    flowGrid = zeros(GRID_NUM, GRID_NUM);
    
    for row = 1:1:GRID_NUM
        for col = 1:1:GRID_NUM
            if ((col - center_x)^2 + (row - center_y)^2 <= r2^2) & ...
                ((col - center_x)^2 + (row - center_y)^2 >= r1^2)
                flowGrid(row,col) = Efull;
            else
                flowGrid(row,col) = Eempty;
            end
        end
    end
    name = '偏心环';
end

