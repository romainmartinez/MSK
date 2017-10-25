function [ output_args ] = force_global(force,RT)
% get force in the global frame

% 1) reshape to get clean matrix (dim*data*time)
RT = squeeze(RT(:,:,1,:)); % because we have only one segment
force = reshape(force, [6, 1, size(force,1)]);

% 2) get same length with ratio (because freq camera != freq analog)
ratioFreq = size(force, 3) / size(RT,3);

% 3) force in global frame 
RT_trans = invR(RT);
forcein0 = multiprod(RT_trans(1:3,1:3,:), force(1:3,:,1:ratioFreq:end));

% 4) torque in global frame (/!\ at sensor center /!\)
momentin0 = multiprod(RT_trans(1:3,1:3,:), force(4:6,:,1:ratioFreq:end));

forcein0 = transpose(squeeze(forcein0));
momentin0 = transpose(squeeze(momentin0));

