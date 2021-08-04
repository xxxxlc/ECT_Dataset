function  randompic(filename)
%RANDOMPIC 产生随机流型
%% 产生随机点
M=200;
Efull=3.4;
Eempty=1;
con=rand(M,M);

%% 过滤器：对产生的随机矩阵进行多维过滤
CC=imfilter(con,1/1600*ones(40),'symmetric');
CC1=imfilter(CC,1/1600*ones(40),'symmetric');
CC2=imfilter(CC1,1/1600*ones(40),'symmetric');

%% 映射
km=1.5;
la=0;
maxY=max(max(CC2));
minY=min(min(CC2));
minR=rand(1)*(Efull-Eempty+km)+(Eempty-km);%empty-km~~efull
mm=minR;
if minR<Eempty
mm=Eempty+0.1;
end
maxR=rand(1)*(Efull+km-mm)+mm;         %minR~~efull+km       
CCend=(CC2-minY)*(maxR-mm)/(maxY-minY)+mm;
% Y=(Y-minY)*(Efull+1)/(maxY-minY);%这里直接将数值映射到0-4.4，然后截取1-3，使之可以有大片满管或空管
CCend(CCend>Efull)=Efull;
CCend(CCend<Eempty)=Eempty;

%% 输出成.txt文件
x_output = [];
y_output = [];
z_output = [];
for i = 1:1:size(CCend,2)
    for j = 1:1:size(CCend,1)
        x_output = [x_output;(i-100)/10*2];
        y_output = [y_output;(j-100)/10*2];
        z_output = [z_output;CCend(i,j)];
    end
    
end

A = [x_output,y_output,z_output];
[FileName, FilePath] = writetxt(A, filename);
end

