function create_box_model(points)
% box :
%           7----------8
%           |          |
%           |          |
%           |          |
%           |          |
%        ---6          5---
% RIGHT  |                | LEFT
%        -4-3----------2-1-
tagplot = 1;

% get reference channels names
ref = ref_channels('point');

% get box points names
box_points = find(contains(ref,'boite'));

% create box's points matrix (dim*points*time)
for ipoint = length(box_points):-1:1
    Mmat(:,ipoint,:) = points(:,box_points(ipoint)*3-2:box_points(ipoint)*3)';
end

% 1) get midpoint between 4 and 3
M3M4 = (Mmat(:,3,:)+Mmat(:,4,:))/2;

% 2) create RT in the midpoint between 4 and 3
RT = defineAxis(Mmat(:,6,:) - Mmat(:,5,:), Mmat(:,7,:) - Mmat(:,6,:), 'xz', 'x',  M3M4);

% 3) local frame = translation of 78.5mm in Z direction
RT(1:3,4,:) = RT(1:3,3,:)*78.5+RT(1:3,4,:);
RT_trans = invR(RT);

% 4) get points in local frame with RT * P + Trans
Mmat_local = multiprod(RT_trans(1:3,1:3,:),Mmat(:,:,:))+RT_trans(1:3,4,:);

if tagplot == 1
    % box plot
    plot3d(Mmat_local(:,:,1)); hold on
    plot3d(Mmat_local(:,:,1), 'b.'); axis equal
    % RT plot
    plotAxes([10 0 0; 0 10 0; 0 0 10],'length', 20)
end

% Copy this into S2M model
Mmat_local(:,:,1)
