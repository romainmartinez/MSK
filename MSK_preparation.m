%   Description: used to compute 
%   Output:  gives 
%   Functions: uses functions present in \\10.89.24.15\e\Project_IRSST_LeverCaisse\Codes\Functions_Matlab
%
%   Author:  Romain Martinez
%   email:   martinez.staps@gmail.com
%   Website: https://github.com/romainmartinez
%_____________________________________________________________________________
clear variables; close all; clc
%% switch
saveresult = 1;

%% load functions (local & S2M)
MSK_functions

%% path
path2=get_path;

%% load data
load_data(path2.mat);