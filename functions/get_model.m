function [model] = get_model(path2, imat)
model.number = 2.1;

% path
model.path = [path2.F '/Data/Shoulder/Lib/' path2.mat(imat).name(1:end-4) 'd/Model_' num2str(round(model.number)) '/Model.s2mMod'];

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

