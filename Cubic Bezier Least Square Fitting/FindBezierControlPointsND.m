% INPUT:
% p: A set of `n` points (p1, p2, ..., pn) in N-dimensional vector space.
%       (i.e., points to be approximated by a Cubic Bezier Curve).
%       - For example, in 3D:
%            p = [0   5   0;      % p1
%                 1   5   0.5;    % p2
%                 1.3 4.5 1;      % p3
%                 2   5   2];     % p4
% ptype (optional): Parameterization type. The default is chord-length 
%                   parameterization. Alternatively, the user can specify 
%                   `'u'` or `'uniform'` for uniform parameterization.

% OUTPUT:
% P0, P1, P2, P3: Four control points of the Bezier Curve, each in 
%                 N-dimensional space.
% t (optional): Parameterized values used for the curve, corresponding 
%               to the input data points.

% OBJECTIVE:
% To compute the control points of a Bezier Curve that best fits the input 
% data using the specified parameterization method.

% SOLUTION:
% - Use the Least Squares Method with the specified parameterization 
%   (default: chord-length).
% - The control points are determined as follows:
%   - P0 and P3: These are the end points of the Bezier curve segment, 
%                directly set as the first and last points of the input data.
%   - P1 and P2: These are computed by partially differentiating the sum 
%                of squared distances between the original data points and 
%                the parametric curve with respect to P1 and P2. The resulting 
%                equations are solved to determine P1 and P2.


function [P0, P1, P2, P3, tout]= FindBezierControlPointsND(p,varargin)

%%% Default Values %%%
ptype='';
defaultValues = {ptype};
%%% Assign Valus %%%
nonemptyIdx = ~cellfun('isempty',varargin);
defaultValues(nonemptyIdx) = varargin(nonemptyIdx);
[ptype] = deal(defaultValues{:});
%%%------------------------------

n=size(p,1);              % number of rows in p

if (strcmpi(ptype,'u') || strcmpi(ptype,'uniform') )
    [t]=linspace(0,1,n);      % uniform parameterized values (normalized b/w 0 to 1)
else
    [t]=ChordLengthNormND(p); % chord-length parameterized values (normalized b/w 0 to 1)
end

P0=p(1,:);       % (at t=0 => P0=p1)
P3=p(n,:);       % (at t=1 => P3=pn)

if (n==1)      % if only one value in p
   P1=P0;      % P1=P0
   P2=P0;      % P2=P0
   
elseif (n==2)  % if only two values in p
   P1=P0;      % P1=P0
   P2=P3;      % P2=P3
   
elseif (n==3)  % if only three values in p
   P1=p(2,:);    % middle point is P1
   P2=p(2,:);    % middle point is P2

else
    
   A1=0;	A2=0;	A12=0;	C1=0;	C2=0; %initialization
    for i=2:n-1 
%    for i=1:n    %it will give same CPs as   i=2:n-1   
      B0 = (1-t(i))^3            ;        % Bezeir Basis
      B1 = ( 3*t(i)*(1-t(i))^2 ) ;
      B2 = ( 3*t(i)^2*(1-t(i)) ) ;
      B3 = t(i)^3                ;
      
      A1  = A1 +  B1^2;
      A2  = A2 +  B2^2;
      A12 = A12 + B1*B2;
      C1 = C1 + B1*( p(i,:) - B0*P0 - B3*P3 );
      C2 = C2 + B2*( p(i,:) - B0*P0 - B3*P3 );
      
   end
   
   DENOM=(A1*A2-A12*A12);       % common denominator for all points
   if(DENOM==0)
       P1=P0;
       P2=P3;
   else
       P1=(A2*C1-A12*C2)/DENOM;
       P2=(A1*C2-A12*C1)/DENOM;
   end
   
end            % END of if-elseif-else conditon

if(nargout==5) % if number of output argument=1 
    tout=t;
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