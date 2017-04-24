function [data] = load_data(path2)

nb_mat = length(path2.mat);

for imat = nb_mat : -1 : 1
    % disp participant's name
    disp_name(path2.mat(imat).name,'subject',imat,nb_mat)
    
    % load data
    load([path2.mat(imat).folder '/' path2.mat(imat).name])
    
    % open S2M model
    model = get_model(path2, imat);
    
    % inverse dynamics (return Tau)
    data = inverse_dynamics(temp,model,'interpolation');
    
    % close model
    S2M_rbdl('delete', model.ID);
end

% plot([data.ID])
% legend(model.nameDoF)