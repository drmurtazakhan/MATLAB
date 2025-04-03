% % draw square quad blocks of quadtree in eight basic colors.
% % S: Sparse matrix that holds quadtree information
function drawquadblocks(S)

mycol = strvcat('r','y','g','c','b','m','k','w');
[i,j,v]=find(S); %i,j are indices, v is value (i.e. block size) at (i,j)
figure, hold on
for k=1:length(v)
    M = mod(k-1,length(mycol))+1;
    fillrect_ulwh([j(k),i(k)],v(k),v(k),mycol(M));
end
axis tight 

% % % ---------------------------------------------------------------
% % This program or any other program(s) supplied with it do(es) not
% % provide any warranty direct or implied.
% % This program is free to use/share for non-commerical purpose only. 
% % Kindly reference the author.
% % Thanking you.
% % @ Copyright: Dr. Murtaza Ali Khan
% % Email: drkhanmurtaza@gmail.com
% % LinkedIn: https://www.linkedin.com/in/dr-murtaza-ali-khan-3b368019
% % ResearchGate: https://www.researchgate.net/profile/Murtaza-Ali-Khan-2
% % Google Scholar: https://scholar.google.com/citations?user=n0JDQ0sAAAAJ
% % % --------------------------------------------------------------- 