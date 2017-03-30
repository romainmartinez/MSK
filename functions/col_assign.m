function assign = col_assign(localpath,varargin)

if nargin == 1
    error('please, select save or load')
elseif varargin{1} == 'load'
    try
        load(localpath.assign)
    catch
        warning('Assign mat not found. Assigning an empty assign.');
        assign = [];
    end
elseif varargin{1} == 'save'
    assign = varargin{2};
    save(localpath.assign,'assign');
end