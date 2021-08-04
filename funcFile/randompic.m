function  randompic(filename)
%RANDOMPIC �����������
%% ���������
M=200;
Efull=3.4;
Eempty=1;
con=rand(M,M);

%% ���������Բ��������������ж�ά����
CC=imfilter(con,1/1600*ones(40),'symmetric');
CC1=imfilter(CC,1/1600*ones(40),'symmetric');
CC2=imfilter(CC1,1/1600*ones(40),'symmetric');

%% ӳ��
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
% Y=(Y-minY)*(Efull+1)/(maxY-minY);%����ֱ�ӽ���ֵӳ�䵽0-4.4��Ȼ���ȡ1-3��ʹ֮�����д�Ƭ���ܻ�չ�
CCend(CCend>Efull)=Efull;
CCend(CCend<Eempty)=Eempty;

%% �����.txt�ļ�
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

