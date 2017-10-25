function [model] = get_model(varargin)
model.number = 2.1;

switch varargin{1}
    case 'body'
        model.path = sprintf('%s10.89.24.15//f//Data//Shoulder//Lib//%sd//Model_%d//Model.s2mMod',...
            '//',varargin{2}(1:end-4),round(model.number));
    case 'box'
        model.path = '//10.89.24.15/e/Projet_IRSST_LeverCaisse/ElaboratedData/MSK/box_model';
    otherwise
        error('please, choose body or box.')
end
% open model
model.ID = S2M_rbdl('new',[model.path '/Model.s2mMod']);

% DoF
model.nameDoF = S2M_rbdl('nameDof', model.ID);
model.nDoF = S2M_rbdl('nDof', model.ID);

% Markers
model.nameTags = S2M_rbdl('nameTags', model.ID);
model.nTags = S2M_rbdl('nTags', model.ID);

% Bodies
model.nameBody = S2M_rbdl('nameBody', model.ID);

