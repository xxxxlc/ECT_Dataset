function [outputArg1,outputArg2, outputArg3] = grid_meshing(nodeinf)
%   计算网格
%   此处显示详细说明



tempA=xlsread(nodeinf,'coor');
tempB=size(tempA);
NumNode=tempB(1,1);
for i=1:NumNode
    Node(i).PosX=tempA(i,2);
    Node(i).PosY=tempA(i,3);
end
P=tempA(:,2:3);

tempA= xlsread(nodeinf,'rela');
tempB=size(tempA);
NumElement=tempB(1,1);
T=tempA(:,2:4);
for i=1:NumElement
    Element(i).Node(1)=Node(tempA(i,2));
    Element(i).Node(2)=Node(tempA(i,3));
    Element(i).Node(3)=Node(tempA(i,4));
    Element(i).NodeNum(1)=tempA(i,2);
    Element(i).NodeNum(2)=tempA(i,3);
    Element(i).NodeNum(3)=tempA(i,4);
    Element(i).MidNode.PosX=(Element(i).Node(1).PosX+Element(i).Node(2).PosX+Element(i).Node(3).PosX)/3;
    Element(i).MidNode.PosY=(Element(i).Node(1).PosY+Element(i).Node(2).PosY+Element(i).Node(3).PosY)/3;
    Element(i).a(1)=Element(i).Node(2).PosX*Element(i).Node(3).PosY-Element(i).Node(3).PosX*Element(i).Node(2).PosY;
    Element(i).a(2)=Element(i).Node(3).PosX*Element(i).Node(1).PosY-Element(i).Node(1).PosX*Element(i).Node(3).PosY;
    Element(i).a(3)=Element(i).Node(1).PosX*Element(i).Node(2).PosY-Element(i).Node(2).PosX*Element(i).Node(1).PosY;
    Element(i).b(1)=Element(i).Node(2).PosY-Element(i).Node(3).PosY;
    Element(i).b(2)=Element(i).Node(3).PosY-Element(i).Node(1).PosY;
    Element(i).b(3)=Element(i).Node(1).PosY-Element(i).Node(2).PosY;
    Element(i).c(1)=Element(i).Node(2).PosX-Element(i).Node(3).PosX;
    Element(i).c(2)=Element(i).Node(3).PosX-Element(i).Node(1).PosX;
    Element(i).c(3)=Element(i).Node(1).PosX-Element(i).Node(2).PosX;
    Element(i).delta=(Element(i).b(1)*Element(i).c(2)-Element(i).b(2)*Element(i).c(1))/2;    
    Element(i).e=Eout;    
end


BoundNode=xlsread(nodeinf,'bound');%边界节点
tempB=size(BoundNode);
NumBoundNode=tempB(1,1);

ElecNode=xlsread(nodeinf,'electrode');%电极节点及左右
tempC=size(ElecNode);
NumElecNode=tempC(1,1);

EleNodeGap=1;

GlassElem=xlsread(nodeinf,'eglass');%玻璃管道单元
tempD=size(GlassElem);
NumGlassElem=tempD(1,1);

for i=1:NumGlassElem
    Element(GlassElem(i)).e=Eglass;
end

ImageElem=xlsread(nodeinf,'eimage');%成像单元
tempE=size(ImageElem);
NumImageElem=tempE(1,1);
% for i=1:NumImageElem
%     X(i)=Element(ImageElem(i)).MidNode.PosX;
%     Y(i)=Element(ImageElem(i)).MidNode.PosY;
% end

%判断点在哪个三角形内
M=200;  %行列数
L=5 ;   %绘图半径
tri=zeros(M,M);
for k=1:NumImageElem
    A(k,:)=[Element(ImageElem(k)).Node(1).PosX Element(ImageElem(k)).Node(1).PosY];
    B(k,:)=[Element(ImageElem(k)).Node(2).PosX Element(ImageElem(k)).Node(2).PosY];
    C(k,:)=[Element(ImageElem(k)).Node(3).PosX Element(ImageElem(k)).Node(3).PosY];
end

for i=1:M
    for j=1:M
        x=2*L / (2.0 * M)*(2 * i - 1)-L;
        y=2*L / (2.0 * M)*(2 * j - 1)-L;
        
        for k=1:NumImageElem
%             PA=P-A(k,:);矩阵减法耗时较下面语句多10倍
%             PB=P-B(k,:);
%             PC=P-C(k,:);
            PA(1)=x-A(k,1);
            PB(1)=x-B(k,1);
            PC(1)=x-C(k,1);
            PA(2)=y-A(k,2);
            PB(2)=y-B(k,2);
            PC(2)=y-C(k,2);
            t1=PA(1)*PB(2)-PA(2)*PB(1);
            t2=PB(1)*PC(2)-PB(2)*PC(1);
            t3=PC(1)*PA(2)-PC(2)*PA(1);
            if t1*t2>=0&&t2*t3>=0 
                tri(i,j)=k;
                break;
            end          
        end 
        
    end
end
index=zeros(NumImageElem,200,2);
for k=1:NumImageElem
    [row,col]=find(tri==k);
    len=length(row);
    index(k,1:len,1)=row;
    index(k,1:len,2)=col;
end

outputArg1 = index;
outputArg2 = NumImageElem;
%outputArg3 = Element;
end

