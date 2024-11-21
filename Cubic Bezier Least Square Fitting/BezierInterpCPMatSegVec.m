% Cubic Bezier interpolation of control points based on segmentation values 
% in `NVec` and parameter values in the vector `ti`.

% INPUT:
% p0mat, p1mat, p2mat, p3mat: Matrices representing the control points of 
%                             the cubic Bezier curve segments. 
%                             - Each row corresponds to a control point in 
%                               N-dimensional space.
%                             - For example:
%                               `p0mat(k, :)` contains `p0` for the k-th segment.
%                               For the first segment (k=1), 
%                               `p0mat(1, 1:3) = (x0, y0, z0)`.
%                             - Similarly, `p1mat(k, :)`, `p2mat(k, :)`, and 
%                               `p3mat(k, :)` contain the respective control 
%                               points (p1, p2, and p3) for the k-th segment.
% NVec: Index vector that defines the segmentation of control points.
%       Each segment corresponds to a range defined by consecutive entries 
%       in `NVec`.
% ti (optional): A vector of parametric values ranging from 0 to 1 for 
%                each segment. The number of parametric values for the k-th 
%                segment is `NVec(k+1) - NVec(k) + 1`. If not provided, 
%                default values will be generated.

% OUTPUT:
% MatGlobalInterp: A matrix containing the interpolated Bezier curve values 
%                  for all segments.

% Example:
% Call the function with all arguments as follows:
% [MatGlobalInterp] = BezierInterpCPMatSegVec(p0mat, p1mat, p2mat, p3mat, NVec, ti);


function [MatGlobalInterp]=BezierInterpCPMatSegVec(p0mat,p1mat,p2mat,p3mat,NVec,varargin)

% % % Default Values
ti=[];
defaultValues = {ti};
% % % Assign Valus
nonemptyIdx = ~cellfun('isempty',varargin);
defaultValues(nonemptyIdx) = varargin(nonemptyIdx);
[ti] = deal(defaultValues{:});
% % ---------------------------------------------------------

niarg = nargin; %number of input arguments

MatGlobalInterp=[];
to=0;
firstSegment=1;
for k=1:length(NVec)-1   
    count=NVec(k+1)-NVec(k)+1;
    if(niarg==6)            % if ti is passsed as argument
        from=to+1;
        to  = from+count-1;
        tloc=ti(from:to);   % extracting local t from ti for kth segment 
        
    else                    % ti is not passed, using uniform parameterization
        tloc=linspace(0,1,count);        
    end
    
    %% for two adjacent segments s1 & s2, paremetric value at t=1 for s1
    %% equals t=0 for s2. Therefore no need to evaluate it. Removing t=0 
    %% from tloc from the second segment onwards.
    if (~firstSegment)
        tloc=tloc(2:end);
    end  
    
    MatLocalInterp=bezierInterp( p0mat(k,:),p1mat(k,:),p2mat(k,:),p3mat(k,:),tloc);    
    MatGlobalInterp=[MatGlobalInterp; MatLocalInterp]; % row wise concatenation
    firstSegment=0;
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