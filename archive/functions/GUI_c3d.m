function [oldlabel, handles] = GUI_c3d(fields,ref)

fields{length(fields)+1,1} = '~~~~~';

index    = 1;
oldlabel = [];

% Figure
handles(1) = figure('units','pixels',...
    'position',[200 200 800 500],...
    'menubar','none',...
    'numbertitle','off',...
    'resize','off');
% List 1
handles(2) = uicontrol('style','list',...
    'unit','pix',...
    'position',[10 40 370 400],...
    'min',0,'max',1,...
    'fontsize',14,...
    'string',fields);
% Bouton
handles(3) = uicontrol('style','push',...
    'units','pix',...
    'position',[10 450 180 40],...
    'fontsize',14,...
    'string',ref{index});
% List 2
handles(4) = uicontrol('style','list',...
    'unit','pix',...
    'position',[400 40 370 400],...
    'min',0,'max',1,...
    'fontsize',14);
% bouton NaN
handles(5) = uicontrol('style','push',...
    'units','pix',...
    'position',[200 450 180 40],...
    'fontsize',14,...
    'string','NaN');
% bouton delete
handles(6) = uicontrol('style','push',...
    'units','pix',...
    'position',[400 450 180 40],...
    'fontsize',14,...
    'string','delete');

set(handles(3),'Callback',@next_callback);
set(handles(5),'Callback',@nan_callback);
set(handles(6),'Callback',@deletefromlist);
set(handles(2),'KeyPressFcn',@key_stroke);


allParam = guidata(handles(1));

allParam.index = index;
allParam.handles = handles;
allParam.field = fields;
allParam.oldlabel = oldlabel;
allParam.ref = ref;

guidata(handles(1),allParam);
end


function next_callback(hObject,varargin)

allParam = guidata(hObject);

% Get the current value
L  = get(allParam.handles(2),{'string','value'});

% Write the current value
allParam.oldlabel{1,allParam.index} = L{1}(L{2}(:));

% Hide current name for the next itiration
allParam.field(strcmp(allParam.field,L{1}(L{2}(:)))) = [];

% Next channel
allParam.index = allParam.index+1;

guidata(hObject,allParam);

if allParam.index > length(allParam.ref)
    assignin('caller', 'oldlabel', allParam.oldlabel)
else
    % Set the next fieldname to list 1
    set(allParam.handles(2),'string',allParam.field);
    
    % Set the next channel to button
    set(allParam.handles(3),'string',allParam.ref{allParam.index});
    
    % Set the next channel to list 2
    initial_name=cellstr(get(allParam.handles(4),'String'));
    set(allParam.handles(4),'string',[initial_name;allParam.oldlabel{1,allParam.index-1}]);
    
    % Sort list with the nearest string
    %method1
    %     near = contains(allParam.field,allParam.ref{allParam.index},'IgnoreCase',true);
    %     [~,idx] = sort(near,'descend');
    %     sorted = allParam.field(idx);
    %method2
    near = strfuzzy(allParam.ref{allParam.index}, allParam.field);
    %method3
    %     near = strfind(allParam.field,allParam.ref{allParam.index});
    %     near(cellfun(@isempty,near)) = {0};
    %     [~,idx] = sort([near{:}],'descend');
    %     sorted = allParam.field(idx);
    
    % put ~~~~~ at the end of the list to avoid bug
    fake = contains(near,'~~~~~');
    temp = near(fake); near(fake) = near(end); near(end) =temp;
    set(allParam.handles(2),'string',near);
end
end

function nan_callback(hObject,varargin)
allParam = guidata(hObject);

% Write the current value
allParam.oldlabel{1,allParam.index} = NaN;

% Next channel
allParam.index = allParam.index+1;

guidata(hObject,allParam);

if allParam.index > length(allParam.ref)
    assignin('caller', 'oldlabel', allParam.oldlabel)
else
    % Set the next channel to button
    set(allParam.handles(3),'string',allParam.ref{allParam.index});
    
    % Set the next channel to list 2
    initial_name=cellstr(get(allParam.handles(4),'String'));
    set(allParam.handles(4),'string',[initial_name;allParam.oldlabel{1,allParam.index-1}]);
        
    % Sort list with the nearest string
    %method1
    %     near = contains(allParam.field,allParam.ref{allParam.index},'IgnoreCase',true);
    %     [~,idx] = sort(near,'descend');
    %     sorted = allParam.field(idx);
    %method2
    near = strfuzzy(allParam.ref{allParam.index}, allParam.field);
    %method3
    %     near = strfind(allParam.field,allParam.ref{allParam.index});
    %     near(cellfun(@isempty,near)) = {0};
    %     [~,idx] = sort([near{:}],'descend');
    %     sorted = allParam.field(idx);
    
    % put ~~~~~ at the end of the list to avoid bug
    fake = contains(near,'~~~~~');
    temp = near(fake); near(fake) = near(end); near(end) =temp;
    set(allParam.handles(2),'string',near);
end
end

function deletefromlist(hObject,~)

allParam = guidata(hObject);

% Get the current value
L  = get(allParam.handles(2),{'string','value'});

% Write the current value
allParam.oldlabel{1,allParam.index} = L{1}(L{2}(:));

% Hide current name for the next itiration
allParam.field(strcmp(allParam.field,L{1}(L{2}(:)))) = [];

guidata(hObject,allParam);

set(allParam.handles(2),'string',allParam.field);
end

function key_stroke(hObject,Event)
if strcmp(Event.Character,'1')
    next_callback(hObject,Event,'key');
elseif strcmp(Event.Character,'2')
    nan_callback(hObject,Event,'key')
elseif strcmp(Event.Character,'3')
    deletefromlist(hObject,Event)
end
allParam = guidata(hObject);
assignin('caller', 'oldlabel', allParam.oldlabel)
if allParam.index > length(allParam.ref)
    close gcf
end
end
