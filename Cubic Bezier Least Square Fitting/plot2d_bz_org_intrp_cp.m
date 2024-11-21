% Plot the original data, the interpolated data, and the control points of the Bezier curve.
% 
% Inputs:
% - Mat: Matrix containing the original data points.
% - MatI: Matrix containing the approximated (fitted) data points.
% - p0mat, p1mat, p2mat, p3mat: Matrices containing the control points of the Bezier curve.

% The plot will display:
% - Original data points from Mat.
% - Fitted/approximated data points from MatI.
% - Control points (p0, p1, p2, p3) of the Bezier curve for visualization.


function plot2d_bz_org_intrp_cp(Mat,MatI,p0mat,p1mat,p2mat,p3mat)

lw=2; %line width

plot(Mat(:,1),Mat(:,2),'b','Linewidth',lw);               % original data
plot(MatI(:,1),MatI(:,2),'g','Linewidth',lw);             % interpolated
bpx=[p0mat(:,1);p3mat(end,1)];
bpy=[p0mat(:,2);p3mat(end,2)];
plot(bpx,bpy,'ro','Linewidth',lw);                                                
legend('Original Data','Fitted Data','Break Points','Location','SouthEast');

% plot([p1mat(:,1),p2mat(:,1)],[p1mat(:,2),p2mat(:,2)],'rd','Linewidth',lw)
% ;    % middle control points

% % % --------------------------------
% % % Author: Dr. Murtaza Ali Khan
% % % Email : drkhanmurtaza@gmail.com
% % % ResearchGate: http://www.researchgate.net/profile/Murtaza_Khan2/
% % % LinkedIn: https://www.linkedin.com/in/dr-murtaza-ali-khan-3b368019
% % % Google Scholar: https://scholar.google.com/citations?user=n0JDQ0sAAAAJ
% % % Scopus: https://www.scopus.com/authid/detail.uri?authorId=7410318323
% % % GitHub: https://github.com/drmurtazakhan
% % % --------------------------------