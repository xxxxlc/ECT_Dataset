function [outputArg1] = AllElecNode_func(NumOneElecNode)
%ALLELECNODE ѡ��ʵ���񣿣�����
%
switch  NumOneElecNode
    case 12
        ProElecNode=[1 12];%�����缫 Protective electrode
        EleElecNode=[4:9];%����缫
    case 16
        ProElecNode=[1 16];%�����缫 Protective electrode
        EleElecNode=[3:14];%����缫
    case 18
        ProElecNode=[1 18];%�����缫 Protective electrode
        EleElecNode=[3:16];%����缫
    case 24
        ProElecNode=[1 24];%�����缫 Protective electrode
        EleElecNode=[3:22];%����缫
    case 32
        ProElecNode=[1 32];%�����缫 Protective electrode
        EleElecNode=[3:30];%����缫
    case 48
        ProElecNode=[1 2 47 48];%�����缫 Protective electrode
        EleElecNode=[4:45];%����缫
end
outputArg1 = [ProElecNode EleElecNode];

end

