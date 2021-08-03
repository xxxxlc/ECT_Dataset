function [matrix, feature] = Generate_flowpattern(flowPattern, fileName, GRID_NUM)
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

    global Eempty
    global Efull

    if flowPattern == 1                                                        % Empty_pipe
        [con, name] = emptyPipe(Eempty, GRID_NUM);

    elseif flowPattern == 2                                                    % Filled_pipe
        [con, name] = filledPipe(Eempty, GRID_NUM);

    elseif flowPattern == 3                                                    % Laminar_flow
        [con, name] = laminarFlow(GRID_NUM, Eempty, Efull);

    elseif flowPattern == 4                                                    % Full_ring
        [con, name] = fullRing(GRID_NUM, Eempty, Efull);

    elseif flowPattern == 5                                                    % Center_ring
        [con, name] = centerRing(GRID_NUM, Eempty, Efull);

    elseif flowPattern == 6                                                    % Eccentric_ring
        [con, name] = eccentricRing(GRID_NUM, Eempty, Efull);

    elseif flowPattern == 7                                                    % Center_ring
        [con, name] = centralFlow(GRID_NUM, Eempty, Efull);

    elseif flowPattern == 8                                                    % Eccentric_flow
        [con, name] = eccentricFlow(GRID_NUM, Eempty, Efull);

    elseif flowPattern == 9                                                    % Any_core_stream
        [con, name] = anyCoreStream(GRID_NUM, Eempty, Efull);

    elseif flowPattern == 10
        [con, name] = randomFlow(GRID_NUM, Eempty, Efull);
    end


    showpicture(con);

    flowCoordinateMatrix = Interpolateddata(con);

    [FileName, FilePath] = writetxt(flowCoordinateMatrix, filename);

    matrix = con;
    feature = [name];

    if flowPattern == 10
        con = zeros(GRID_NUM, GRID_NUM) + 3.4 - con + 1;
        showpicture(con);
        flowCoordinateMatrix = Interpolateddata(con);

        [FileName, FilePath] = writetxt(flowCoordinateMatrix, ...
                                        strcat(num2str(...
                                        str2num(fileName(1)) + 1), '.txt'));
    end



end

