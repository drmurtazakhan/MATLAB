% % Find Cubic Bezier Control Points for Given Segments
% % INPUT:
% % Mat: Input data where each row `Mat(k, :)` represents the k-th point.
% %      The points can be in N-dimensional vector space (e.g., 1D, 2D, 3D, or ND).
% % SegIndexIn: Indices that specify how the points in `Mat` are segmented.
% % ptype: Specifies the parameterization method.
% %        - If `'u'` or `'uniform'`, uniform parameterization is used.
% %        - Otherwise, chord-length parameterization is applied.
% 
% % OUTPUT:
% % p0mat, p1mat, p2mat, p3mat: Matrices of control points for each segment.
% %                               Each row of `p*mat(k, :)` contains the control points 
% %                               for the k-th segment.
% % tout: A vector of parameter `t` values for all segments.

function [p0mat,p1mat,p2mat,p3mat,tout]=FindBzCP4AllSeg(Mat,SegIndexIn,varargin)

%%% Default Values %%%
ptype='';
defaultValues = {ptype};
%%% Assign Valus %%%
nonemptyIdx = ~cellfun('isempty',varargin);
defaultValues(nonemptyIdx) = varargin(nonemptyIdx);
[ptype] = deal(defaultValues{:});
%%%------------------------------

tout=[];
for k=1:length(SegIndexIn)-1
    fromRow=SegIndexIn(k);
    toRow=SegIndexIn(k+1);
    size(Mat(fromRow:toRow,:));
    if (strcmpi(ptype,'u') || strcmpi(ptype,'uniform') )
        [p0,p1,p2,p3,t]= FindBezierControlPointsND(Mat(fromRow:toRow,:),'u'); %uniform parameterization
    else
        [p0,p1,p2,p3,t]= FindBezierControlPointsND(Mat(fromRow:toRow,:));    %chord-length parameterization
    end   

    p0mat(k,:)=p0; 
    p1mat(k,:)=p1;
    p2mat(k,:)=p2;
    p3mat(k,:)=p3;
    tout=horzcat(tout,t);
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