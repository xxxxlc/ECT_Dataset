function [flowGrid, name] = anyCoreStream(GRID_NUM, Eempty, Efull, Ncenter, Ncenter_x, Ncenter_y, Nr)
%ANYCORESTREAM 
%   This function is used to generate any multi-core core stream
%   
%   Input parameters
%   Eempty: Empty tube capacitance
%   Efull: Efull tube capacitance
%   GRID_NUM: Generated mesh size
%   Ncenter: The number of cores in any multi-core core stream,
%   if there is no input, it will be randomly generated
%   Ncenter_x: The abscissa of each core,
%   if there is no input, it will be randomly generated
%   Ncenter_y: Ordinate of each core,
%   if there is no input, it will be randomly generated
%   Ncenter_y: Radius of each core,
%   if there is no input, it will be randomly generated

%   Output parameters
%   flowGrid: Generate flow pattern concentration grid
%   name: Chinese name of flow type

    if nargin < 4
        Ncenter = randi([2,4]);
        Ncenter_x = [];
        Ncenter_y = [];
        Nr = [];
        for i = 1:Ncenter
            center_x = round(rand() * GRID_NUM);                              
            center_y = round(rand() * GRID_NUM);
            while ((center_x - GRID_NUM/2)^2 + (center_y - GRID_NUM/2)^2 >= (GRID_NUM/2)^2)
                center_x = round(rand() * GRID_NUM);                           
                center_y = round(rand() * GRID_NUM);
            end
            
            Ncenter_x = [Ncenter_x, center_x];
            Ncenter_y = [Ncenter_y, center_y];
            
            a = [center_x, center_y, ...
                GRID_NUM - center_x, GRID_NUM - center_y];
            max_r = min(a);
            r = round(rand() * max_r);
            
            Nr = [Nr, r];

        end
        
    end
    

%     center_num = 3;
%     center_x_all = [160, 70, 70];
%     center_y_all = [100, 150, 50];
    flowGrid = zeros(GRID_NUM, GRID_NUM);
    for i = 1:1:Ncenter
        center_x = Ncenter_x(i);
        center_y = Ncenter_y(i);
        r = Nr(i);
        for row = 1:1:GRID_NUM
            for col = 1:1:GRID_NUM
                if ((col - center_x)^2 + (row - center_y)^2 <= r^2)
                    flowGrid(row,col) = Efull;
                else
                    if flowGrid(row,col) ~= Efull
                        flowGrid(row,col) = Eempty;
                    end
                end
            end
        end
    end
    name = '任意核心流';

end

