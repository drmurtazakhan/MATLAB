% % Bezier interpolation for a given set of four control points.
% % Each control point can exist in an N-dimensional vector space.
% %
% % Input:
% % P0, P1, P2, P3: Four control points of the Bezier curve. 
% %                 Each control point can have any number of coordinates (N-dimensional).
% % t (optional): A vector specifying the parameter `t` values between 0 and 1 
% %               at which the Bezier curve will be evaluated. 
% %               Default: 101 evenly spaced values between 0 and 1.

% % Output: 
% % The array Q stores the evaluated points of the Bezier curve.
% % Each row in Q represents a single point, while the number of columns
% % corresponds to the number of coordinates in each control point.
% % For example: 
% In 2D, Q will have two columns: the first column for
% x-values and the second column for y-values.
% % In 3D, Q will have three columns: the first column for x-values, the
% second column for y-values, and the third column for zz-values.

function Q=bezierInterp(P0,P1,P2,P3,varargin)

%%% Default Values %%%
t=linspace(0,1,101); % uniform parameterization 
defaultValues = {t};
%%% Assign Valus %%%
nonemptyIdx = ~cellfun('isempty',varargin);
defaultValues(nonemptyIdx) = varargin(nonemptyIdx);
[t] = deal(defaultValues{:});
% % --------------------------------
M=[-1  3 -3 1;
    3 -6  3 0;
   -3  3  0 0;
    1  0  0 0];
for k=1:length(t)
    Q(k,:)=[t(k)^3 t(k)^2 t(k) 1]*M*[P0;P1;P2;P3];
end
% % Ref: Mathematical Elements of Computer Graphics by
% %      David F. Rogers and J. Alan Adams (pg. 296)
% % --------------------------------
% % OR
% % Equation of Bezier Curve, utilizes Horner's rule for efficient computation.
% % Q(t)=(-P0 + 3*(P1-P2) + P3)*t^3 + 3*(P0-2*P1+P2)*t^2 + 3*(P1-P0)*t + Px0
% c3 = -P0 + 3*(P1-P2) + P3;
% c2 = 3*(P0 - (2*P1)+P2); 
% c1 = 3*(P1 - P0);
% c0 = P0;
% for k=1:length(t)
%     Q(k,:)=((c3*t(k)+c2)*t(k)+c1)*t(k) + c0;    
% end

% % % --------------------------------
% % % Author: Dr. Murtaza Ali Khan
% % % Email : drkhanmurtaza@gmail.com
% % % ResearchGate: http://www.researchgate.net/profile/Murtaza_Khan2/
% % % LinkedIn: https://www.linkedin.com/in/dr-murtaza-ali-khan-3b368019
% % % Google Scholar: https://scholar.google.com/citations?user=n0JDQ0sAAAAJ
% % % Scopus: https://www.scopus.com/authid/detail.uri?authorId=7410318323
% % % GitHub: https://github.com/drmurtazakhan
% % % --------------------------------
