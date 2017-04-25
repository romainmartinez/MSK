function [path2] = get_path(path2, varargin)
ElaboratedData = [path2.E '/Projet_IRSST_LeverCaisse/ElaboratedData/'];
switch varargin{1}
    case 'MSK'
        path2.data = [ElaboratedData 'matrices/cinematique/'];
        path2.export = [ElaboratedData 'MSK/'];
        path2.mat = dir([path2.data '*mat']);
    case 'force'
        path2.data = [path2.F '/Data/Shoulder/RAW/' varargin{2} 'd/trials/'];
        path2.assign = [ElaboratedData 'matrices/col_assign/' varargin{2} '.mat'];
        path2.export_index = [ElaboratedData 'matrices/forceindex/'];
        path2.export_force = [ElaboratedData 'MSK/forceinglobal/'];
        path2.c3d = dir([path2.data '*c3d']);
end

