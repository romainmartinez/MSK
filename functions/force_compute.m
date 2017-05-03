function [data, forceindex] = force_compute(data, freq, varargin)
param.window = 0.5; % window (in seconde)
param.lowfilter = 100; % lowpass cutoff frequency
param.threshold = 5;

% 1) rebase
index = param.window*freq.analog;
data = data - mean(data(1:index,:));

% 2) Low Pass Butterworth (4th order)
data = lpfilter(data, param.lowfilter, freq.analog);

if nargin > 1 && sum(contains(varargin, 'forceindex'))
    Fnorm = sqrt(sum(data(:,1:3).^2,2)); % take only the first three columns because we don't need moments
    
    threshold = 5; % in Newton
    
    try
        % method 1 : image processing toolbox needed
        aboveThreshold = (Fnorm > threshold);
        spanLocs = bwlabel(aboveThreshold);           %identify contiguous ones
        spanLength = regionprops(spanLocs, 'area');   %length of each span
        spanLength = [spanLength.Area];
        goodSpans = find(spanLength>=1000);           %get only spans of 5+ points
        index = find(ismember(spanLocs, goodSpans));  %indices of these spans
    catch
        % method 2 : if you don't have image processing toolbox, use this simple one:
        warning('The most accurate detection method could not be used (image processing toolbox needed)')
        index = find(Fnorm(2:end-1000) > threshold);
    end
    
    figure('units','normalized','position',[.1 .1 .9 .7])
    plot(Fnorm, 'linewidth',2)
    vline([index(1) index(end)],{'g','r'},{'start','end'})
    button = uicontrol('style','push',...
        'units','normalized',...
        'position',[0.92 0.5 0.05 0.05],...
        'fontsize',14,...
        'string','manual');
    set(button,'Callback',@manual_index);
    
    allParam = guidata(button);
    
    % save index
    forceindex{1} = (index(1)*freq.camera)/freq.analog;
    forceindex{2} = (index(end)*freq.camera)/freq.analog;
    forceindex{3} = varargin{2}; % varargin{2} must be the trialname
    forceindex{4} = (forceindex{2} - forceindex{1})/freq.camera; % duration of the trial
    
    allParam.freq = freq;
    allParam.forceindex = forceindex;
    guidata(button,allParam);
    
    waitfor(button);
end
end

function manual_index(hObject,varargin)
allParam = guidata(hObject);
[x,~] = ginput(2);
x = x*allParam.freq.camera/allParam.freq.analog;
allParam.forceindex{1} = x(1);
allParam.forceindex{2} = x(2);
assignin('caller', 'forceindex', allParam.forceindex)
end