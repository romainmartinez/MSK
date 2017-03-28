function [path2] = get_path
path2.data = '\\10.89.24.15\e\\Projet_IRSST_LeverCaisse\ElaboratedData\matrices\EMG\';
path2.export = '\\10.89.24.15\e\\Projet_IRSST_LeverCaisse\ElaboratedData\emg\SPM\';
path2.mat = dir([path2.data '*mat']);

