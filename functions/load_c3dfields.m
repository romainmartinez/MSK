function [ output_args ] = load_c3dfields(subject,varargin)
sub_nb = length(subject);

for isub = sub_nb : -1 : 1
    disp_name(subject{isub},'subject',isub,sub_nb)
    
    localpath = get_path('force',subject{isub});
    
    assign = col_assign(localpath,'load');
    
    trial_nb = length(localpath.c3d);
    
    for itrial = trial_nb : -1 : 1
        disp_name(localpath.c3d(itrial).name(5:end-4),'trial',itrial,trial_nb)
        
        [btk,freq] = read_c3d([localpath.c3d(itrial).folder '\' localpath.c3d(itrial).name]);
        
        [data(itrial),assign] = data_c3dfields(btk,assign,varargin);
        
    end
    col_assign(localpath,'save',assign);
end

