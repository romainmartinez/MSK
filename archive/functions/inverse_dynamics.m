function [data] = inverse_dynamics(data,model,varargin)
nb_trial = length(data);
nb_frame = 500;

for itrial = nb_trial : -1 : 1
    % disp trial's name
    disp_name(data(itrial).trialname,'trial',itrial,nb_trial)
    
    % inverse dynamics (return Tau)
    data(itrial).ID = S2M_rbdl('inverseDynamics', model.ID, data(itrial).Qdata.Q2, data(itrial).Qdata.Q2, data(itrial).Qdata.Q2);
    data(itrial).ID = transpose(data(itrial).ID);
    
    % interpolation
    if varargin{1} == 'interpolation'
        data(itrial).ID = ScaleTime(data(itrial).ID, 1, length(data(itrial).ID), nb_frame);
    end
end
% plot(ID')
% legend(model.nameDoF)