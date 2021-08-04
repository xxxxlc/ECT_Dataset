function [gridIndex,NumImageElemOut] = grid_meshing(nodeinf, Eout)
%   GRID_MESHING
%   This function is used to calculate the generated mesh

%   Input parameters
%   nodeinf: Generated mesh xlsx file
%   Eout: ielectric constant of shielding layer

%   Output parameters
%   gridIndex: 2D meshing parameters
%   NumImageElemOut: The number of meshes of the pipe



    coor = xlsread(nodeinf,'coor');                                        % Read the coordinate parameters of the coor 
                                                                           % in the grid file
    numNode=size(coor,1);
    coorNode = repmat(struct('PosX', 0, 'PosY', 0), numNode, 1);
    
    for i=1:numNode                                                        % Record the coordinates of each point of the coor
        coorNode(i).PosX=coor(i,2);
        coorNode(i).PosY=coor(i,3);
    end

    rela = xlsread(nodeinf,'rela');                                        % Read the coordinate parameters of the rela 
    numElement=size(rela, 1);
    
    for i=1:numElement
        Element(i).Node(1) = coorNode(rela(i,2));
        Element(i).Node(2) = coorNode(rela(i,3));
        Element(i).Node(3) = coorNode(rela(i,4));
        Element(i).NodeNum(1) = rela(i,2);
        Element(i).NodeNum(2) = rela(i,3);
        Element(i).NodeNum(3) = rela(i,4);
        Element(i).MidNode.PosX = (Element(i).Node(1).PosX + ...
                                   Element(i).Node(2).PosX + ...
                                   Element(i).Node(3).PosX) / 3;
        Element(i).MidNode.PosY = (Element(i).Node(1).PosY + ...
                                   Element(i).Node(2).PosY + ...
                                   Element(i).Node(3).PosY)/3;
        Element(i).a(1) = Element(i).Node(2).PosX * ...
                          Element(i).Node(3).PosY - ...
                          Element(i).Node(3).PosX * ...
                          Element(i).Node(2).PosY;
        Element(i).a(2) = Element(i).Node(3).PosX * ...
                          Element(i).Node(1).PosY - ...
                          Element(i).Node(1).PosX * ...
                          Element(i).Node(3).PosY;
        Element(i).a(3) = Element(i).Node(1).PosX * ...
                          Element(i).Node(2).PosY - ...
                          Element(i).Node(2).PosX * ...
                          Element(i).Node(1).PosY;
        Element(i).b(1) = Element(i).Node(2).PosY - ...
                          Element(i).Node(3).PosY;
        Element(i).b(2) = Element(i).Node(3).PosY - ...
                          Element(i).Node(1).PosY;
        Element(i).b(3) = Element(i).Node(1).PosY - ...
                          Element(i).Node(2).PosY;
        Element(i).c(1) = Element(i).Node(2).PosX - ...
                          Element(i).Node(3).PosX;
        Element(i).c(2) = Element(i).Node(3).PosX - ...
                          Element(i).Node(1).PosX;
        Element(i).c(3) = Element(i).Node(1).PosX - ...
                          Element(i).Node(2).PosX;
        Element(i).delta = (Element(i).b(1) * Element(i).c(2) - ...
                            Element(i).b(2) * Element(i).c(1))/2;    
        Element(i).e=Eout;    
    end
    
    imageElem = xlsread(nodeinf,'eimage');                                 % Imaging unit
    NumImageElem = size(imageElem, 1);

    M=200;                                                                 %行列数
    L=5 ;                                                                  %绘图半径
    tri=zeros(M,M);
    for k=1:NumImageElem
        A(k,:)=[Element(imageElem(k)).Node(1).PosX Element(imageElem(k)).Node(1).PosY];
        B(k,:)=[Element(imageElem(k)).Node(2).PosX Element(imageElem(k)).Node(2).PosY];
        C(k,:)=[Element(imageElem(k)).Node(3).PosX Element(imageElem(k)).Node(3).PosY];
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

    gridIndex = index;
    NumImageElemOut = NumImageElem;

end

