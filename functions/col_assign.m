function assign = col_assign(path2,varargin)

if nargin == 1
    error('please, select save or load')
elseif varargin{1} == 'load'
    try
        load(path2.assign)
    catch
        warning('Assign mat not found. Assigning an empty assign.');
        assign = [];
    end
elseif varargin{1} == 'save'
    assign = varargin{2};
    save(localpath.assign,'assign');
end