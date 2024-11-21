% Normalized Chord-Length Parameterization
% The parameterization maps the input data points to a domain between 0 and 1 (inclusive).

% INPUT:
% p: A set of n points (p1, p2, ..., pn) in an N-dimensional vector space 
%       (i.e., points to be approximated by a Cubic Bezier Curve).
%       - For example, in 2D: p1 = (x1, y1); in 3D: p1 = (x1, y1, z1); in 4D: p1 = (w1, x1, y1, z1).
%       - Each row of `Data` represents a point. 
%         For example, in 2D:
%         p = [5 0;   % p1
%                 1 2;   % p2
%                 3 4;   % p3
%                 4 0];  % p4

% OUTPUT:
% t: A vector of parameterized values [t1, t2, ..., tn], normalized between 0 and 1.


function [t]=ChordLengthNormND(p)

n=size(p,1); % number of rows in p
TotalDistance(1:n-1)=0; dSum=0;
for i=1:n-1
    dSum=dSum+TwoNormDist( p(i+1,:), p(i,:) );
    TotalDistance(i)=dSum; % chord-length of ith segment (length upto ith segment)
end

% when dSum=0 (all points have same value.)
if(dSum==0) 
    t(1:n-1)=0;
    t(n)=1;
    return
end

% % Normalizing (Vectorized)

t(1)=0;
i=[2:n-1];
t(i)=TotalDistance(i-1)/dSum;           
t(n)=1;



% % % Normalizing (Not Vectorized)
% t(1)=0;
% for i=2:n-1
%     t(i)=TotalDistance(i-1)/dSum;            
% end
% t(n)=1;



% % % --------------------------------
% % % Author: Dr. Murtaza Ali Khan
% % % Email : drkhanmurtaza@gmail.com
% % % ResearchGate: http://www.researchgate.net/profile/Murtaza_Khan2/
% % % LinkedIn: https://www.linkedin.com/in/dr-murtaza-ali-khan-3b368019
% % % Google Scholar: https://scholar.google.com/citations?user=n0JDQ0sAAAAJ
% % % Scopus: https://www.scopus.com/authid/detail.uri?authorId=7410318323
% % % GitHub: https://github.com/drmurtazakhan
% % % --------------------------------