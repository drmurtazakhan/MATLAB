% % Do following
% % 1. set to 0 (zero) those spatial locations from sparse matrix that
% %     exceeds BOTH given x and y values
% % 2. delete the correspoding row from given key matrix   

% % INPUT
% % S: input sparse matrix
% % i: i(k) kth row    of non-zero element in S
% % j: j(k) kth column of non-zero element in S
% % key: M-by-N array M=length(i) then key(k,:) entry in keys
% %      corresponds to kth row of non-zeros entries of S
% % x: x-coordinate 
% % y: y-coordinate

% % OUTPUT
% % S:   modified output sparse matrix
% % keys: modified keys matrix

function [S,keys]=delsparsekeybyxANDy(S,i,j,keys,x,y)

c=0;
for k=1:length(i)
    if(i(k)>x && j(k)>y)
       S(i(k),j(k))=0;  %(k,k)th entry is also zero, would not be save in Sparse
    else
        c=c+1;
        keysN(c,:)=keys(k,:);
    end
end
keys=keysN;

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