% Two sets of points are stored in two matrices: mat1 and mat2.
% mat1: Original curve (single segment)
% mat2: Approximating curve (single segment)

% This function computes the maximum squared Euclidean distance between 
% the corresponding points in mat1 and mat2, and also returns the local 
% row index (rowIndex) relative to the rows of mat1 (which will be the same 
% for mat2 since both curves consist of the same number of points).


function [squaredmax,rowIndex]=MaxSqDistAndRowIndexbw2Mat(mat1,mat2)
% mat1=[x11,x12,...x1n;
%       x11,x12,...x1n; 
%       ...
%       xn1,xn2,...xnn; 

% mat2=[y11,y12,...y1n;
%       y11,y12,...y1n; 
%       ...
%       yn1,yn2,...ynn; 
% OR in brief mat1 and mat2 format is like following
%                               [P1;
%                                P2;
%                                P3;
%                                P4;
%                                ...
%                                PN];


if ~isequal(size(mat1),size(mat2))
    error('Two matrices must of of equal size');
end

% %Casting for accurate computation
mat1=double(mat1); 
mat2=double(mat2);

rowIndex=1;
squaredmax=sum( (mat1(1,:)-mat2(1,:)).^2,2 );

for k=1:size(mat1,1)
    % computing square distance b/w kth row
    SqDist=sum( (mat1(k,:)-mat2(k,:)).^2,2 )  ;
    % %  SqDist=TwoNormSqDist(mat1(k,:),mat2(k,:)); %No longer in use
    if(SqDist > squaredmax )
        squaredmax=SqDist;
        rowIndex=k;
    end
end


% % % --------------------------------
% % % Author: Dr. Murtaza Ali Khan
% % % Email : drkhanmurtaza@gmail.com
% % % ResearchGate: http://www.researchgate.net/profile/Murtaza_Khan2/
% % % LinkedIn: https://www.linkedin.com/in/dr-murtaza-ali-khan-3b368019
% % % Google Scholar: https://scholar.google.com/citations?user=n0JDQ0sAAAAJ
% % % Scopus: https://www.scopus.com/authid/detail.uri?authorId=7410318323
% % % GitHub: https://github.com/drmurtazakhan
% % % --------------------------------