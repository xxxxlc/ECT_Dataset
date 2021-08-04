function [flowGrid, name] = randomFlow(GRID_NUM, Eempty, Efull)
%RANDOMFLOW 
%   This function is used to generate a grid of random flow patterns
%   
%   Input parameters
%   Eempty: Empty tube capacitance
%   Efull: Efull tube capacitance
%   GRID_NUM: Generated mesh size

%   Output parameters
%   flowGrid: Generate flow pattern concentration grid
%   name: Chinese name of flow type

    flowGrid = rand(GRID_NUM, GRID_NUM);
    CC = imfilter(flowGrid,1/1600*ones(40),'symmetric');                   % Perform three average filtering
    CC1 = imfilter(CC,1/1600*ones(40),'symmetric');
    CC2 = imfilter(CC1,1/1600*ones(40),'symmetric');
    
    km = 1.5;
    maxY = max(max(CC2));                                                  % Filtered global maximum
    minY = min(min(CC2));                                                  % Filtered global minimum
    minR = rand(1) * (Efull - Eempty + km) + (Eempty - km);                % minR: empty - km ~~ efull
    mm = minR;
    if minR < Eempty
        mm = Eempty + 0.1;
    end
    maxR = rand(1) * (Efull + km - mm) + mm;                               % maxR: minR ~~ efull + km       
    CCend = (CC2 - minY) * (maxR - minR) / (maxY - minY) + minR;
    CCend(CCend > Efull) = Efull;
    CCend(CCend < Eempty) = Eempty;
    flowGrid = CCend;
    name = '随机流';


end

