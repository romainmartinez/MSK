function disp_name(matname, varargin)
% args:
%       matname: name of trial
%       varargin{1}: subject or trial
%       varargin{2}: current trial
%       varargin{3}: length

switch varargin{1}
    case 'subject'
        fprintf('Participant: %s (%d sur %d)\n',matname,varargin{3}-varargin{2}+1,varargin{3})
    case 'trial'
        fprintf('\ttrial: %s (%d sur %d)\n',matname,varargin{3}-varargin{2}+1,varargin{3})
end