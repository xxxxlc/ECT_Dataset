function [flowCoordinateMatrix] = Interpolateddata(flowGrid)
%INTERPOLATEDDATA 
%   This function is used to convert the generated flow pattern 
%   concentration distribution matrix into coordinate form

%   Input parameters:
%   flowGrid: Flow pattern concentration distribution matrix
% 
%   Output parameters:
%   flowCoordinateMatrix: Flow pattern distribution coordinate matrix

    x_output = [];                                                         % x
    y_output = [];                                                         % y
    z_output = [];                                                         % Dielectric constant at this coordinate
    for i = 1:1:size(flowGrid,2)
        for j = 1:1:size(flowGrid,1)
            x_output = [x_output;(i-100)/10*2.5/1000];                                
            y_output = [y_output;(j-100)/10*2.5/1000];
            z_output = [z_output;flowGrid(i,j)];
        end
    end
    
    flowCoordinateMatrix = [x_output,y_output,z_output];
   
end

