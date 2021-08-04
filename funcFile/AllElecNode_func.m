function [outputArg1] = AllElecNode_func(NumOneElecNode)
%ALLELECNODE 选择实验规格？？？？
%
switch  NumOneElecNode
    case 12
        ProElecNode=[1 12];%保护电极 Protective electrode
        EleElecNode=[4:9];%带电电极
    case 16
        ProElecNode=[1 16];%保护电极 Protective electrode
        EleElecNode=[3:14];%带电电极
    case 18
        ProElecNode=[1 18];%保护电极 Protective electrode
        EleElecNode=[3:16];%带电电极
    case 24
        ProElecNode=[1 24];%保护电极 Protective electrode
        EleElecNode=[3:22];%带电电极
    case 32
        ProElecNode=[1 32];%保护电极 Protective electrode
        EleElecNode=[3:30];%带电电极
    case 48
        ProElecNode=[1 2 47 48];%保护电极 Protective electrode
        EleElecNode=[4:45];%带电电极
end
outputArg1 = [ProElecNode EleElecNode];

end

