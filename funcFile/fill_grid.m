function [outputArg1] = fill_grid(matrix, grid_index, NumImageElem)
%FILL_GRID �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
data = zeros(1, NumImageElem);
for i=1:NumImageElem
     data(i)=0;
     for j=1:200
         ix=grid_index(i,j,1);
         iy=grid_index(i,j,2);%�����������ڰ����ĵ㲢���
         if(ix==0)
             data(i)=data(i)/(j-1);%����������ֵ
             break;
         end
         data(i)=data(i)+matrix(ix,iy);
     end
end
outputArg1 = data;

end



