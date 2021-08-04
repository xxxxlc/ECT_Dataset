function [outputArg1] = fill_grid(matrix, grid_index, NumImageElem)
%FILL_GRID 此处显示有关此函数的摘要
%   此处显示详细说明
data = zeros(1, NumImageElem);
for i=1:NumImageElem
     data(i)=0;
     for j=1:200
         ix=grid_index(i,j,1);
         iy=grid_index(i,j,2);%差找三角形内包含的点并求和
         if(ix==0)
             data(i)=data(i)/(j-1);%查找完毕求均值
             break;
         end
         data(i)=data(i)+matrix(ix,iy);
     end
end
outputArg1 = data;

end



