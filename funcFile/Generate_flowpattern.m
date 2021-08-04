function [matrix, feature] = Generate_flowpattern(flowPattern, fileName, GRID_NUM, Eempty, Efull)
% This function is used to generate a txt file of a specific flow type 
% for input to COMSOL
%
% Input parameters:
% flowPattern: int, Numbers representing each flow pattern
% fileName: char, The file name of the generated txt file
% GRID_NUM: int, Generated grid size
%
% Output parameters:
% matrix: int, Numerical matrix representing flow pattern
% feature: char, Chinese name of flow type

    addpath('func_flowPattern');

    %% Typical flow pattern
    if flowPattern ~= 10
        if flowPattern == 1                                                % Empty_pipe
            [con, name] = emptyPipe(Eempty, GRID_NUM);

        elseif flowPattern == 2                                            % Filled_pipe
            [con, name] = filledPipe(Eempty, GRID_NUM);

        elseif flowPattern == 3                                            % Laminar_flow
            [con, name] = laminarFlow(GRID_NUM, Eempty, Efull);

        elseif flowPattern == 4                                            % Full_ring
            [con, name] = fullRing(GRID_NUM, Eempty, Efull);

        elseif flowPattern == 5                                            % Center_ring
            [con, name] = centerRing(GRID_NUM, Eempty, Efull);

        elseif flowPattern == 6                                            % Eccentric_ring
            [con, name] = eccentricRing(GRID_NUM, Eempty, Efull);

        elseif flowPattern == 7                                            % Center_ring
            [con, name] = centralFlow(GRID_NUM, Eempty, Efull);

        elseif flowPattern == 8                                            % Eccentric_flow
            [con, name] = eccentricFlow(GRID_NUM, Eempty, Efull);

        elseif flowPattern == 9                                            % Any_core_stream
            [con, name] = anyCoreStream(GRID_NUM, Eempty, Efull);
        end


        showpicture(con);                                                  % Show flow pattern concentration distribution

        flowCoordinateMatrix = Interpolateddata(con);                      % Convert flow pattern concentration distribution 
                                                                           % matrix to coordinate matrix
        [FileName, FilePath] = writetxt(flowCoordinateMatrix, filename);   % Write all the information of the coordinate matrix 
                                                                           % into a txt file

        matrix = con;
        feature = [name];
        return;
    
    end
    
    %% Random_flow_pattern
    [con_origin, name] = randomFlow(GRID_NUM, Eempty, Efull);              % Random_flow_pattern
    con_complementary = zeros(GRID_NUM, GRID_NUM) + 3.4 - con_origin + 1;  % Complementary flow pattern of this random flow 
                                                                           % pattern
    showpicture(con_origin);
    showpicture(con_complementary);
        
    flowCoordinateMatrix = Interpolateddata(con_origin);                   % Write random flow pattern and its complementary 
                                                                           % flow pattern into txt file separately
    [FileName, FilePath] = writetxt(flowCoordinateMatrix, filename);
    flowCoordinateMatrix = Interpolateddata(con_complementary);
    [FileName, FilePath] = writetxt(flowCoordinateMatrix, ...
                                   strcat(num2str(...
                                   str2num(fileName(1)) + 1), '.txt'));
    matrix = {con_origin,con_complementary} ;
    feature = [name];
    



end

