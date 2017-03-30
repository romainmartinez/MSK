function [data] = load_data(mat)

nb_mat = length(mat);

for imat = nb_mat : -1 : 1
    % disp participant's name
    disp_name(mat(imat).name,'subject',imat,nb_mat)
    
    % load data
    load([mat(imat).folder '\' mat(imat).name])
    
    % open S2M model
    model = get_model(mat(imat).name);
    
    % inverse dynamics (return Tau)
    data = inverse_dynamics(temp,model,'interpolation');
    
    % close model
    S2M_rbdl('delete', model.ID);
end

% plot([data.ID])
% legend(model.nameDoF)