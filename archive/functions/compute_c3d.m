function compute_c3d(path2,subject,varargin)
% varargin can take one or more of the following arguments:
% 'emg'    = create 'assign.mat' for the EMG channels
% 'point'  = create 'assign.mat' for the points channels
% 'force'  = create 'assign.mat' for the force channels
% 'global' = compute the force in the global frame

sub_nb = length(subject);

for isub = sub_nb : -1 : 1
    disp_name(subject{isub},'subject', isub,sub_nb)
    
    path2 = get_path(path2, 'force', subject{isub});
    
    assign = col_assign(path2, 'load');
    
    trial_nb = length(path2.c3d);
    
    if contains(varargin, 'global')
        model = get_model('box'); % open model
    end
    
    for itrial = trial_nb : -1 : 1
        trialname = path2.c3d(itrial).name(5:end-4);
        disp_name(trialname, 'trial', itrial,trial_nb)
        
        [btk,freq] = read_c3d([path2.c3d(itrial).folder '/' path2.c3d(itrial).name]);
        
        [data(itrial),assign] = data_c3dfields(btk, assign, varargin);
        
        data(itrial).force = force_calibration(data(itrial).force);
        
        if contains(varargin, 'global')
            RT = box_IK(model, data(itrial).point, 'IK');
            force_global(data(itrial).force, RT);
        end
        
        [data(itrial).force, forceindex(itrial,:)] = force_compute(data(itrial).force, freq, 'forceindex', trialname);
    end
    
    col_assign(path2, 'save', assign);
    
    if exist('forceindex', 'var')
        save([path2.export_index subject{isub} '_forceindex.mat'],'forceindex')
    end
    close all
    clear forceindex
end

