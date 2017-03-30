function result = strfuzzy(str,strarray,n)
%STRFUZZY
%   Inputs
%       str         String
%       strarray    Cell array of strings
%       n           Integer, 1 <= n <= length(strarray)
%
%   Outputs
%       result      Cell array of length n containing the closest matches to str
%
%   Example
%       result      Cell array of length n containing the closest matches to str
%       strarray = {'cat', 'hey', 'hay', 'hat', 'Hey'};
%       strfuzzy('hey', strarray)
%           ans = 
%               'hey'    'hay'    'Hey'    'hat'    'cat'
%       strfuzzy('bat', strarray, 3)
%           ans = 
%               'cat'    'hat'    'hay'
%
%   Author:  Romain Martinez
%   email:   martinez.staps@gmail.com
%   Website: https://github.com/romainmartinez







if nargin < 2, error('Requires at least two arguments'), end
if nargin < 3, n = length(strarray); end

A = cellfun( @(x) strdist(str,x), strarray );
[~,idx] = sort(A);
result = strarray(idx);
result = result(1:n);