% Finds the average of different blocks of an input matrix.
% 
% INPUT:
% - i, j, w, h: Vectors specifying block dimensions and positions.
%   * i(k): Starting row index of the k-th block.
%   * j(k): Starting column index of the k-th block.
%   * w(k): Width of the k-th block (e.g., columns 1 to 5 of the matrix).
%   * h(k): Height of the k-th block (e.g., rows 1 to 3 of the matrix).
% - mat: Input matrix.
%
% OUTPUT:
% - avg(k): Average value of the k-th block (returned as a vector).
function avg=avgofmatblks(mat,i,j,w,h)

blkcount=length(i);
for k=1:blkcount        
    fromRow=i(k);
    toRow=i(k)+h(k)-1;
    fromCol=j(k);
    toCol=j(k)+w(k)-1;
    count=(toRow-fromRow+1).*(toCol-fromCol+1);
    avg(k)=sum(sum(mat(fromRow:toRow,fromCol:toCol)))/count; %avg/mean of block values
end

% % % --------------------------------
% % % Author: Dr. Murtaza Ali Khan
% % % Email : drkhanmurtaza@gmail.com
% % % --------------------------------
% % ResearchGate: http://www.researchgate.net/profile/Murtaza_Khan2/
% % LinkedIn: https://www.linkedin.com/in/dr-murtaza-ali-khan-3b368019
% % Google Scholar: https://scholar.google.com/citations?user=n0JDQ0sAAAAJ
% % Scopus: https://www.scopus.com/authid/detail.uri?authorId=7410318323
% % GitHub: https://github.com/drmurtazakhan