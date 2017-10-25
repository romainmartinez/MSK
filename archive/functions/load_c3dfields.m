function [ output_args ] = load_c3dfields(path2,subject,varargin)
sub_nb = length(subject);

for isub = sub_nb : -1 : 1
    disp_name(subject{isub},'subject',isub,sub_nb)
    
    path2 = get_path(path2, 'force',subject{isub});
    
    assign = col_assign(path2,'load');
    
    trial_nb = length(path2.c3d);
    
    model = get_model('box'); % open model
    
    for itrial = trial_nb : -1 : 1
        disp_name(path2.c3d(itrial).name(5:end-4),'trial',itrial,trial_nb)
        
        [btk,freq] = read_c3d([path2.c3d(itrial).folder '/' path2.c3d(itrial).name]);
        
        [data(itrial),assign] = data_c3dfields(btk,assign,varargin);
        
        RT = box_IK(model,data(itrial).point,'IK');
        
        data(itrial).force = force_calibration(data(itrial).force);
        
        force_global(data(itrial).force,RT)
        
        data(itrial).force = force_compute(data(itrial).force,freq);
    end
    col_assign(path2,'save',assign);
end

