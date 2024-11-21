% This function computes the Euclidean distance between two points, p1 and p2.
% p1 and p2 can be in N-dimensional vector space.

% The Euclidean distance is calculated as the square root of the sum of squared differences 
% between corresponding coordinates of p1 and p2.

% INPUT:
% p1: A row or column vector representing the first point in N-dimensional space.
% p2: A row or column vector representing the second point in N-dimensional space.

% OUTPUT:
% Distance: The 2-norm (Euclidean) distance between p1 and p2, computed as the square root 
% of the sum of squared differences between corresponding coordinates of p1 and p2.



function Distance=TwoNormDist(p1,p2)


%% Not Vectorized
SquareDistance=0;

for i=1:length(p1)
      SquareDistance=SquareDistance + ( ( p1(i)-p2(i) ).^2 ) ;
end
Distance=sqrt(SquareDistance);


%%% Vectorized 
% i=[1:length(p1)];
% Distance= norm(p1(i)-p2(i));
% I tested vectorized is slower (strange) !!!


% Notes:
% Reference: http://en.wikipedia.org/wiki/Distance 

% % % --------------------------------
% % % Author: Dr. Murtaza Ali Khan
% % % Email : drkhanmurtaza@gmail.com
% % % ResearchGate: http://www.researchgate.net/profile/Murtaza_Khan2/
% % % LinkedIn: https://www.linkedin.com/in/dr-murtaza-ali-khan-3b368019
% % % Google Scholar: https://scholar.google.com/citations?user=n0JDQ0sAAAAJ
% % % Scopus: https://www.scopus.com/authid/detail.uri?authorId=7410318323
% % % GitHub: https://github.com/drmurtazakhan
% % % --------------------------------
