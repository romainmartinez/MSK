function [data,assign] = get_c3dfields(btk,assign,varargin)
    var = varargin{1};
    if contains(var,["emg","force"])
        type = 'analog';
        ecart = [1,0];
    else
        type = 'point';
        ecart = [3,2];
    end
    ref = ref_channels(var);
    data = [];
    
    fields = fieldnames(btk.(type));
    nb_frame = length(btk.(type).(fields{1}));
    nb_col = length(ref);
    if isfield(assign,var)
        nb_assign = size(assign.(var),1);
    else
        assign.(var) = [];
        nb_assign = 0;
    end
 
for icol = nb_col:-1:1 %nb muscles
    for iassign = 1:1:nb_assign
        if char(assign.(var){iassign,icol}) == char(NaN) % si NaN -> NaN
            data(1:nb_frame,icol*ecart(1)-ecart(2):icol*ecart(1)) = nan;
        elseif isfield(btk.(type), char(assign.(var){iassign,icol})) % si exist -> emg
            data(:,icol*ecart(1)-ecart(2):icol*ecart(1)) = btk.(type).(char(assign.(var){iassign,icol}));
        end
    end
    if isempty(data) % si exist pas -> gui
        [oldlabel, handles] = GUI_c3d(fields,ref);
        waitfor(handles(1));
        assign.(var) = [assign.(var);oldlabel];
        nb_assign = nb_assign + 1;
        if char(assign.(var){nb_assign,icol}) == char(NaN) % si NaN -> NaN
            data(1:nb_frame,icol*ecart(1)-ecart(2):icol*ecart(1)) = nan;
        else % si exist -> emg
            data(:,icol*ecart(1)-ecart(2):icol*ecart(1)) = btk.(type).(char(assign.(var){nb_assign,icol})); % POINT
        end
    end
end
