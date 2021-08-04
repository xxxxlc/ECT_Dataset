function [imageArray] = fill_grid(matrix, gridIndex, NumImageElem)
%FILL_GRID 
%   This function is used to write the generated flow pattern concentration
%   distribution into the generated grid file and save the data

%   Input parameters:
%   matrix: Flow pattern concentration distribution matrix
%   gridIndex: 2D meshing parameters
%   NumImageElemOut: The number of meshes of the pipe 
%
%   Output parameters:
%   imageArray: Flow pattern concentration distribution grid


    data = zeros(1, NumImageElem);
    for i=1 : NumImageElem
         data(i) = 0;
         for j = 1:200
             ix = gridIndex(i, j, 1);
             iy = gridIndex(i, j, 2);                                      % Find the points contained in the triangle and 
                                                                           % sum them
             if(ix == 0)
                 data(i) = data(i) / (j - 1);                              % Find the average
                 break;
             end
             data(i) = data(i) + matrix(ix,iy);
         end
    end
    imageArray = data;

end



