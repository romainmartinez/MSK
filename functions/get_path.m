function [localpath] = get_path(varargin)
serveur = '\\10.89.24.15\';
ElaboratedData = 'e\\Projet_IRSST_LeverCaisse\ElaboratedData\';
switch varargin{1}
    case 'MSK'
        localpath.data = [serveur ElaboratedData 'matrices\cinematique\'];
        localpath.export = [serveur ElaboratedData 'MSK\'];
        localpath.mat = dir([localpath.data '*mat']);
    case 'force'
        localpath.data = [serveur 'f\Data\Shoulder\RAW\' varargin{2} 'd\trials\'];
        localpath.assign = [serveur ElaboratedData 'matrices\col_assign\' varargin{2} '.mat'];
        localpath.export_index = [serveur ElaboratedData 'matrices\forceindex\'];
        localpath.export_force = [serveur ElaboratedData 'MSK\forceinglobal\'];
        localpath.c3d = dir([localpath.data '*c3d']);
end

