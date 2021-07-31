function [flowPatternSequence] = generateFlow(nFlow, ratioOfRandom)
%GENERATEFLOW 
%   This function generates random flow patterns and typical flow patterns 
%   according to certain rules

%   Output parameters
%   flowPatternSequence: a vector containing the  sequence represented by 
%   the flow pattern 

%   Input parameters
%   nFlow: the number of flow patterns generated
%   ratioOfRandom: The ratio of random flow pattern to typical flow pattern
%   Its value must be greater than 1


    if ratioOfRandom <= 1
        disp(['The ratio of random flow pattern to typical flow pattern'...
             'is must more than 1']);
        return;
    end
    
    flowPatternSequence = zeros(1, nFlow);                                 % initialization
    
    proportionOfTypical = struct('Laminar_flow',   {3,1}, ...              % Proportion of typical flow patterns
                                 'Full_ring',      {4,1}, ...
                                 'Center_ring',    {5,1}, ...
                                 'Eccentric_ring', {6,1}, ...
                                 'Central_flow',   {7,1}, ...
                                 'Eccentric_flow', {8,2}, ...
                                 'Any_core_stream',{9,3});
    
%   sequenceOfTypical = [3,4,5,6,7,8,8,9,9,9];
    sequenceOfTypical = [];
    fields = fieldnames(proportionOfTypical);
    for i = 1:length(fields)
        k = fields(i);
        key = k{1};
        [typicalPatternNumber, repeatTimes] = proportionOfTypical.(key);
        for j = 1:repeatTimes
            sequenceOfTypical = [sequenceOfTypical, typicalPatternNumber];
        end
    end
    
    j = 1;
    for i = 1:1:nFlow
        if mod(i, ratioOfRandom + 1) == 0
            flowPatternSequence(i) = sequenceOfTypical(j);
            j = j + 1;
            if j > size(sequenceOfTypical)
                j = 1;
            end
        else
            flowPatternSequence(i) = 10;
        end
    end
    
end

