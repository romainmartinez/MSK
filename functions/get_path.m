function [localpath] = get_path
localpath.data = '\\10.89.24.15\e\\Projet_IRSST_LeverCaisse\ElaboratedData\matrices\cinematique\';
localpath.export = '\\10.89.24.15\e\\Projet_IRSST_LeverCaisse\ElaboratedData\MSK\';
localpath.mat = dir([localpath.data '*mat']);

