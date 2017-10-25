function [data,assign] = data_c3dfields(btk,assign,c3d_case)

c3d_case = [c3d_case{:}];

if isempty(c3d_case)
    error('please, choose one or several of the following: emg | point | force')
end

if contains(c3d_case,'point') % point
    [data.point,assign] = get_c3dfields(btk,assign,'point');
end

if contains(c3d_case,'force') % force
    [data.force,assign] = get_c3dfields(btk,assign,'force');
end

if contains(c3d_case,'emg') % force
    [data.emg,assign] = get_c3dfields(btk,assign,'emg');
end
