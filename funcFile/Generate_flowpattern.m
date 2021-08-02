function [matrix, feature] = Generate_flowpattern(flowpattern, filename, num)
% 根据输入参数产生需要的流型
global grid_num
global Eempty
global Efull
global Eglass
if flowpattern == 1                                                        % 空管流型
    con = zeros(grid_num, grid_num) + Eempty;
    name = '空管';

elseif flowpattern == 2                                                    % 满管流型
    con = zeros(grid_num, grid_num) + Efull;   
    name = '满管';

elseif flowpattern == 3                                                    % 层流流型
    %height = round(rand() * grid_num/2);                                  % 产生层流的随机高度
    height = grid_num/2;
    con = zeros(grid_num, grid_num);
    for row = 1:1:grid_num
        for col = 1:1:grid_num
            if col <= height
                con(row,col) = Efull;
            else
                con(row,col) = Eempty;
            end
        end
    end
    name = '层流';
    
elseif flowpattern == 4                                                    % 满环流型
    con = zeros(grid_num, grid_num);
%     r = round(rand() * grid_num/2);                                        % 产生圆环半径
    r = 60;
    for row = 1:1:grid_num
        for col = 1:1:grid_num
            if (col - grid_num/2)^2 + (row - grid_num/2)^2 <= r^2
                con(row,col) = Eempty;
            else
                con(row,col) = Efull;
            end
        end
    end
    name = '满环';
    
    
elseif flowpattern == 5                                                    % 圆心环流型
    con = zeros(grid_num, grid_num);
%     r1 = round(rand() * grid_num/2);                                       % 产生圆环半径r1
%     r2 = round(rand() * (grid_num/2 - r1)) + r1;                           % 产生圆环半径r2
    r1 = 30;
    r2 = 60;
    for row = 1:1:grid_num
        for col = 1:1:grid_num
            if ((col - grid_num/2)^2 + (row - grid_num/2)^2 <= r2^2) & ...
                ((col - grid_num/2)^2 + (row - grid_num/2)^2 >= r1^2)
                con(row,col) = Efull;
            else
                con(row,col) = Eempty;
            end
        end
    end
    name = '圆心环';

elseif flowpattern == 6                                                    % 偏心环流型
    con = zeros(grid_num, grid_num);
%     center_x = round(rand() * grid_num);                              
%     center_y = round(rand() * grid_num);
    center_x = 70;
    center_y = 70;
    while ((center_x - grid_num/2)^2 + (center_y - grid_num/2)^2 >= (grid_num/2)^2)
        center_x = round(rand() * grid_num);                               % 产生圆心的x坐标
        center_y = round(rand() * grid_num);                               % 产生圆心的y坐标
    end
    a = [center_x, center_y, ...
        grid_num - center_x, grid_num - center_y];
    max_r = min(a);
%     r1 = round(rand() * max_r);                                            % 产生圆环半径r1
%     r2 = round(rand() * (max_r - r1)) + r1;                                % 产生圆环半径r2
    r1 = 30;
    r2 = 60;
    for row = 1:1:grid_num
        for col = 1:1:grid_num
            if ((col - center_x)^2 + (row - center_y)^2 <= r2^2) & ...
                ((col - center_x)^2 + (row - center_y)^2 >= r1^2)
                con(row,col) = Efull;
            else
                con(row,col) = Eempty;
            end
        end
    end
    name = '偏心环';

elseif flowpattern == 7                                                    % 中心流流型
    con = zeros(grid_num, grid_num);
%     r = round(rand() * grid_num/2);                                        % 产生圆环半径
    r = 60;
    for row = 1:1:grid_num
        for col = 1:1:grid_num
            if (col - grid_num/2)^2 + (row - grid_num/2)^2 <= r^2
                con(row,col) = Efull;
            else
                con(row,col) = Eempty;
            end
        end
    end
    name = '中心流';
    

elseif flowpattern == 8                                                    % 偏心流流型
    con = zeros(grid_num, grid_num);
%     center_x = round(rand() * grid_num);                              
%     center_y = round(rand() * grid_num);
    center_x = 70;
    center_y = 70;
    while ((center_x - grid_num/2)^2 + (center_y - grid_num/2)^2 >= (grid_num/2)^2)
        center_x = round(rand() * grid_num);                               % 产生圆心的x坐标
        center_y = round(rand() * grid_num);                               % 产生圆心的y坐标
    end
    a = [center_x, center_y, ...
        grid_num - center_x, grid_num - center_y];
    max_r = min(a);
%     r = round(rand() * max_r);                                            % 产生圆环半径r
    r = 60;
    for row = 1:1:grid_num
        for col = 1:1:grid_num
            if ((col - center_x)^2 + (row - center_y)^2 <= r^2)
                con(row,col) = Efull;
            else
                con(row,col) = Eempty;
            end
        end
    end
    name = '偏心流';
    
elseif flowpattern == 9                                                    % 任意核心流流型
%     center_num = randi([2,4]);
    center_num = 3;
    center_x_all = [160, 70, 70];
    center_y_all = [100, 150, 50];
    con = zeros(grid_num, grid_num);
    for i = 1:1:center_num
%         center_x = round(rand() * grid_num);                              
%         center_y = round(rand() * grid_num);
        center_x = center_x_all(i);
        center_y = center_y_all(i);
%         while ((center_x - grid_num/2)^2 + (center_y - grid_num/2)^2 >= (grid_num/2)^2)
%             center_x = round(rand() * grid_num);                           
%             center_y = round(rand() * grid_num);                          
%         end
        a = [center_x, center_y, ...
        grid_num - center_x, grid_num - center_y];
        max_r = min(a);
%         r = round(rand() * max_r);                                            % 产生圆环半径r
        r = 40;
        for row = 1:1:grid_num
            for col = 1:1:grid_num
                if ((col - center_x)^2 + (row - center_y)^2 <= r^2)
                    con(row,col) = Efull;
                else
                    if con(row,col) ~= Efull
                        con(row,col) = Eempty;
                    end
                end
            end
        end
    end
    name = '任意核心流';
    
elseif flowpattern == 10
    
    con = rand(grid_num, grid_num);
    CC=imfilter(con,1/1600*ones(40),'symmetric');
    CC1=imfilter(CC,1/1600*ones(40),'symmetric');
    CC2=imfilter(CC1,1/1600*ones(40),'symmetric');
    
    km=1.5;
    % la=0;
    maxY=max(max(CC2));
    minY=min(min(CC2));
    minR=rand(1)*(Efull-Eempty+km)+(Eempty-km);%empty-km~~efull
    mm=minR;
    if minR<Eempty
        mm=Eempty+0.1;
    end
    maxR=rand(1)*(Efull+km-mm)+mm;         %minR~~efull+km       
    CCend=(CC2-minY)*(maxR-minR)/(maxY-minY)+minR;
    % Y=(Y-minY)*(Efull+1)/(maxY-minY);%这里直接将数值映射到0-4.4，然后截取1-3，使之可以有大片满管或空管
    CCend(CCend>Efull)=Efull;
    CCend(CCend<Eempty)=Eempty;
    con = CCend;
    name = '随机流';
end


    

showpicture(con);

% 生成插值的数据
x_output = [];                                                             % 坐标x
y_output = [];                                                             % 坐标y
z_output = [];                                                             % 该坐标下的介电常数
for i = 1:1:size(con,2)
    for j = 1:1:size(con,1)
        x_output = [x_output;(i-100)/10*2.5/1000];                                
        y_output = [y_output;(j-100)/10*2.5/1000];
        z_output = [z_output;con(i,j)];
    end
    
end


A = [x_output,y_output,z_output];
[FileName, FilePath] = writetxt(A, filename);

matrix = con;
feature = [name];

if flowpattern == 10
    con = zeros(grid_num, grid_num) + 3.4 - con + 1;
    showpicture(con);
    x_output = [];                                                             % 坐标x
    y_output = [];                                                             % 坐标y
    z_output = [];                                                             % 该坐标下的介电常数
    for i = 1:1:size(con,2)
        for j = 1:1:size(con,1)
            x_output = [x_output;(i-100)/10*2.5/1000];                                
            y_output = [y_output;(j-100)/10*2.5/1000];
            z_output = [z_output;con(i,j)];
        end
    
    end
    A = [x_output,y_output,z_output];
    
    [FileName, FilePath] = writetxt(A, strcat(num2str(num + 1), '.txt'));
end



end

