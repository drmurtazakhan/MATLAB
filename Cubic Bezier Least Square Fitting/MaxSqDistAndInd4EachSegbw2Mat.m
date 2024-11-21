% Two sets of points are stored in two matrices: mat1 and mat2.
% mat1: Original curve (multiple segments)
% mat2: Approximating curve (multiple segments)

% Both the original curve (mat1) and the approximating curve (mat2) consist 
% of an equal number of multiple segments.

% Points are segmented at indices specified in the vector segIndex.

% This function computes the maximum squared Euclidean distance between 
% corresponding segments of mat1 and mat2, and also returns the global index 
% (relative to mat1's rows, which will be the same for mat2).

% Each row of mat1/mat2 represents a point in N-dimensional space, 
% i.e., [w, x, y, z, ...], where each row corresponds to a single point P = (w, x, y, z, ...).
% The format of mat1 and mat2 is as follows:
%   [P1;
%    P2;
%    P3;
%    P4;
%    ...;
%    PN]

% The algorithm is based on calculating the Euclidean distance between corresponding points 
% in each segment of mat1 and mat2.
 

function [sqDistAry,indexAryGlobal]=MaxSqDistAndInd4EachSegbw2Mat(mat1,mat2,segIndex)

sqDistAry=[];
indexAryGlobal=[];

for k=1:length(segIndex)-1    
    mat1Seg=mat1(segIndex(k):segIndex(k+1),:);
    mat2Seg=mat2(segIndex(k):segIndex(k+1),:);
    [squaredmaxLocal,indexLocal]=MaxSqDistAndRowIndexbw2Mat(mat1Seg,mat2Seg);
    sqDistAry(k)=squaredmaxLocal;
    indexGlobal=indexLocal+segIndex(k)-1;        
    indexAryGlobal(k)=indexGlobal;
end


% So original boundary points are stored in mat1 and interpolated boundary
% points (parametric values) are in mat2. segIndex have indices w.r.t to
% mat1 where we do segmentation of boundary (i.e. where essentially two
% corresopding points of mat1 and mat2 intersect.


% % % --------------------------------
% % % Author: Dr. Murtaza Ali Khan
% % % Email : drkhanmurtaza@gmail.com
% % % ResearchGate: http://www.researchgate.net/profile/Murtaza_Khan2/
% % % LinkedIn: https://www.linkedin.com/in/dr-murtaza-ali-khan-3b368019
% % % Google Scholar: https://scholar.google.com/citations?user=n0JDQ0sAAAAJ
% % % Scopus: https://www.scopus.com/authid/detail.uri?authorId=7410318323
% % % GitHub: https://github.com/drmurtazakhan
% % % --------------------------------