% % Function to compute the average of different blocks within an input matrix.
% % INPUT
% % i,j,w,h are vectors
% % mat : input matrix
% % i(k): beginning row index of kth block
% % j(k): beginning column index of kth block
% % w(k): width of kth block   (e.g. column 1 to colum 5 of mat)
% % h(k): height of kth block  (e.g. row 1 to row 3 of mat)
% % OUTPUT
% % avg(k): average of kth block (avg is a vector)
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