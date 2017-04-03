%   Description: used to compute the force in the global system & trial definition
%   Output:  gives matrices of forceinglobal and forceindex
%   Functions: uses functions present in \\10.89.24.15\e\Project_IRSST_LeverCaisse\Codes\Functions_Matlab
%
%   Author:  Romain Martinez
%   email:   martinez.staps@gmail.com
%   Website: https://github.com/romainmartinez
%_____________________________________________________________________________

clear variables; close all; clc

% add locals & S2M functions
MSK_functions

% get subjects names
alias.subject = sujets_valides('mat');

% load data from c3d
load_c3dfields(alias.subject,'emg','point','force')

%% 1) force index (GUI)

%% 2) force in global coordinate