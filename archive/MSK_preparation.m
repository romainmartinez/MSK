%   Description: used to compute 
%   Output:  gives 
%   Functions: uses functions present in \\10.89.24.15\e\Project_IRSST_LeverCaisse\Codes\Functions_Matlab
%
%   Author:  Romain Martinez
%   email:   martinez.staps@gmail.com
%   Website: https://github.com/romainmartinez
%_____________________________________________________________________________

clear variables; close all; clc

path2 = load_functions('windo', 'MSK');

% switch
saveresult = 1;

% path
path2=get_path(path2, 'MSK');

% load data
load_data(path2);