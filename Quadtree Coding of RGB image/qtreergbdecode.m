% % Decode QuadTree date that is decomposed (encode) by qt3ddecom method

% % Input
% % S: the quadtree structure in the sparse matrix S. If S(k,m) is
% %    nonzero, then (k,m) is the upper left corner (ULC) of a block in the
% %    decomposition, and the size of the block is given by S(k,m). 
% % valRGB(n,1:3):  mean (average) of RGB compoents for nth block

% % Output
% % I: Decoded Image

function I=qtreergbdecode(S,valRGB)

I(:,:,1)=qtreedecode(S,valRGB(:,1)); 
I(:,:,2)=qtreedecode(S,valRGB(:,2));
I(:,:,3)=qtreedecode(S,valRGB(:,3));

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