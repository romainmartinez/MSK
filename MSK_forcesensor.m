%   Description: used to compute the force in the global system & trial definition
%   Output:  gives matrices of forceinglobal and forceindex
%   Functions: uses functions present in \\10.89.24.15\e\Project_IRSST_LeverCaisse\Codes\Functions_Matlab
%
%   Author:  Romain Martinez
%   email:   martinez.staps@gmail.com
%   Website: https://github.com/romainmartinez
%_____________________________________________________________________________

clear variables; close all; clc

path2 = load_functions('linux', 'MSK');

alias.subject = IRSST_participants('IRSST');

load_c3dfields(path2,alias.subject,'emg','point','force')

%% 1) force index (GUI)

%% 2) force in global coordinate