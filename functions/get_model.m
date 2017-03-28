function [model] = get_model(name)
model.number = 2.1;

% path
model.path = sprintf('%s10.89.24.15\\f\\Data\\Shoulder\\Lib\\%sd\\Model_%d\\Model.s2mMod',...
    '\\',name(1:end-4),round(model.number));

% open model
model.ID = S2M_rbdl('new',model.path);

% DoF
model.nameDoF = S2M_rbdl('nameDof', model.ID);
model.nDoF = S2M_rbdl('nDof', model.ID);

% Markers
model.nameTags = S2M_rbdl('nameTags', model.ID);
model.nTags = S2M_rbdl('nTags', model.ID);

% Bodies
model.nameBody = S2M_rbdl('nameBody', model.ID);

