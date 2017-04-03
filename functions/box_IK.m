function GL = box_IK(model,points,varargin)
% box :
%           7----------8
%           |          |
%           |          |
%           |          |
%           |          |
%        ---6          5---
% RIGHT  |                | LEFT
%        -4-3----------2-1-

% get reference channels names
ref = ref_channels('point');

% get box points names
box_points = find(contains(ref,'boite'));

% create box's points matrix (dim*points*time)
for ipoint = length(box_points):-1:1
    Mmat(:,ipoint,:) = points(:,box_points(ipoint)*3-2:box_points(ipoint)*3)';
end

% 1) reconstruct Q
Q = S2M_rbdl('ik_ekf', model.ID, Mmat, zeros(6,1));

% 2) get cleaner points
% T = S2M_rbdl('Tags', model.ID, Q);

% 3) get global jcs = RT for each segment and for each frame (4*4*segment*n)
GL = S2M_rbdl('globalJCS', model.ID, Q);

