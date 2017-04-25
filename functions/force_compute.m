function force = force_compute(data,freq)
param.window = 0.5; % window (in seconde)
param.lowfilter = 100; % lowpass cutoff frequency
param.threshold = 5;

% 1) rebase
index = param.window*freq.analog;
force = data - mean(data(1:index,:));

% 2) Low Pass Butterworth (4th order)
force = lpfilter(force, param.lowfilter, freq.analog);