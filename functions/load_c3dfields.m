function [ output_args ] = load_c3dfields(subject,varargin)
sub_nb = length(subject);

for isub = sub_nb : -1 : 1
    disp_name(subject{isub},'subject',isub,sub_nb)
    
    localpath = get_path('force',subject{isub});
    
    assign = col_assign(localpath,'load'); % load col assignment
    
    trial_nb = length(localpath.c3d);
    
    model = get_model('box'); % open model
    
    for itrial = trial_nb : -1 : 1
        disp_name(localpath.c3d(itrial).name(5:end-4),'trial',itrial,trial_nb)
        
        [btk,freq] = read_c3d([localpath.c3d(itrial).folder '\' localpath.c3d(itrial).name]);
        
        [data(itrial),assign] = data_c3dfields(btk,assign,varargin);
        
        RT = box_IK(model,data(itrial).point,'IK');
        
        data(itrial).force = force_calibration(data(itrial).force);
        
        force_global(data(itrial).force,RT)
        
        data(itrial).force = force_compute(data(itrial).force,freq);
    end
    % save channel assignment
    col_assign(localpath,'save',assign);
    
    % close model
    S2M_rbdl('delete', model.ID);
end

