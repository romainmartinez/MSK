function [ sujets_export ] = sujets_valides(varargin)
if nargin > 0
    localpath = '\\10.89.24.15\e\Projet_IRSST_LeverCaisse\ElaboratedData\matrices\cinematique\';
    files = dir([localpath '*.mat']);
    sujets_export = arrayfun(@(x) ( x.name(1:end-4) ), files, 'UniformOutput', false);
else
    [~, ~, sujets] = xlsread('\\10.89.24.15\e\Projet_IRSST_LeverCaisse\ElaboratedData\contribution_articulation\IRSST_infos_sujets.xlsx',...
        'Global','A2:K61');
    
    for iline = length(sujets) : -1 : 1
        if sujets{iline,11} == 'x'
            sujets_export{iline} = sujets{iline, 1};
            sujets_export{iline} = ['IRSST_' upper(sujets_export{iline}(2)) sujets_export{iline}(3:end-2) upper(sujets_export{iline}(end-1))];
        end
    end
    
    sujets_export = sujets_export(~cellfun('isempty',sujets_export));
end
