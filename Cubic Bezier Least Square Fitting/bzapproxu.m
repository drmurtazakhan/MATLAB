% % Approximation of data using Cubic Bezier Curves.
% % The method is based on least square fitting with uniform parameterization.
% % It determines the control points of a Bezier curve that approximates 
% % the given data within a specified squared distance tolerance.
% 
% % INPUT:
% % Mat: Original data (e.g., boundary data) to be approximated. Each row 
% %      represents a data point in N-dimensional space.
% % ibi: Initial break point indices. 
% %      Each value in ibi corresponds to a row index in Mat, representing 
% %      an initial segmentation point.
% % MxAllowSqD: Maximum allowed squared distance between the original data 
% %             and the fitted Bezier curve. If the distance exceeds 
% %             MxAllowSqD, the segment is broken at the point of maximum 
% %             squared distance.
% 
% % OUTPUT:
% % p0mat, p1mat, p2mat, p3mat: Final set of control points for the Bezier curve. 
% %                             Each row corresponds to a control point in 
% %                             N-dimensional space.
% % fbi: Final break point indices (Optional). 
% % MxSqD: Maximum squared distance between the original data and the 
% %        fitted parametric curve. Guaranteed to satisfy MxSqD <= MxAllowSqD (Optional).
% 
% % Note:
% % Each row of Mat, p0mat, p1mat, p2mat, and p3mat represents a point in 
% % N-dimensional space, e.g., [w, x, y, z, ...], where each point 
% % P = (w, x, y, z, ...). The format of Mat is as follows:
% %                               [P1;
% %                                P2;
% %                                P3;
% %                                P4;
% %                                ...
% %                                PN];

function [p0mat,p1mat,p2mat,p3mat,fbi,MxSqD]=bzapproxu(Mat,varargin)


p0mat=[];    p1mat=[];    p2mat=[];    p3mat=[];
fbi=[];
MxSqD=0;

if (size(Mat,1) < 4)
    error('Atleast four points are required in Data Matrix');    
end

%%% Default Values %%%
MxAllowSqD=1;
ibi=[1; size(Mat,1)]; % first & last
defaultValues = {MxAllowSqD ibi};
%%% Assign Valus %%%
nonemptyIdx = ~cellfun('isempty',varargin);
defaultValues(nonemptyIdx) = varargin(nonemptyIdx);
[MxAllowSqD ibi] = deal(defaultValues{:});
% % %----------------------------------------
datatype=class(Mat); %original data type 
Mat=double(Mat);   %converte to double (necessary for computation)
MxAllowSqD=double(MxAllowSqD);
% % %----------------------------------------

if(MxAllowSqD<0 )
    error('Max. Allowed Square Distance should be >= 0');    
end

if( ~isvec(ibi) )
    error('arg3 must be row OR column vector');    
end
ibi=getcolvector(ibi);
ibi=[ibi; 1; size(Mat,1)]; % make sure first & last are included
ibi=unique(ibi);           % sort and remove duplicates if any 

[p0mat,p1mat,p2mat,p3mat,ti]=FindBzCP4AllSeg(Mat,ibi,'u');
[MatI]=BezierInterpCPMatSegVec(p0mat,p1mat,p2mat,p3mat,ibi,ti);

[sqDistAry,indexAryGlobal]=MaxSqDistAndInd4EachSegbw2Mat(Mat,MatI, ibi);
sqDistMat=[sqDistAry',indexAryGlobal'];
% localIndex is index of row in sqDistMat that contains MxSqD
[MxSqD, localIndex]=max(sqDistMat(:,1)); 


while(MxSqD > MxAllowSqD)        
    %% appending index of new segmentation into ibi  
    %% index w.r.t Mat where sq. dist. is max among all segments
    MaxSqDistIndex=sqDistMat(localIndex,2); 
    ibi(length(ibi)+1)=MaxSqDistIndex;     % append
    ibi=sort(ibi);                     % sort          
    
    %% Finding range of ibi that would be affected by adding a new
    %% point at max-square-distance postion.
    %% If kth row mataches then get atmost k-1 to k+1 rows of ibi.
    [EffinitialbreaksIndex]=FindGivenRangeMatchedMat([ibi],[1 ; MaxSqDistIndex], 1); 
     
    %% Finding control points of two new segments (obtained by breaking a segment)  
    %% Since we are passing EffinitialbreaksIndex, FindBzCP4AllSeg will only take
    %% relevant segments data from Mat.
    [p0matN,p1matN,p2matN,p3matN,tiN]=FindBzCP4AllSeg(...
                                      Mat,EffinitialbreaksIndex,'u');
    
    %% Combining new and old control point values (old + new + old ).
    %% if only one row in sqDistMat (case when initially there were only two
    %% breakpoints)
    if( size(sqDistMat,1)==1 ) 
        p0mat=p0matN; p1mat=p1matN; p2mat=p2matN; p3mat=p3matN;         
    else 
        p0mat=[p0mat(1:localIndex-1,:); p0matN; p0mat(localIndex+1:end,:)];
        p1mat=[p1mat(1:localIndex-1,:); p1matN; p1mat(localIndex+1:end,:)];
        p2mat=[p2mat(1:localIndex-1,:); p2matN; p2mat(localIndex+1:end,:)];
        p3mat=[p3mat(1:localIndex-1,:); p3matN; p3mat(localIndex+1:end,:)];        
    end     
    
    %% Bezier Interpolatoin to new segments  
    [MatINew]=BezierInterpCPMatSegVec(p0matN,p1matN,p2matN,p3matN,...
                                      EffinitialbreaksIndex,tiN);
    
    si=EffinitialbreaksIndex(1);  % intrp. values ibi(1:si) are already computed
    ei=EffinitialbreaksIndex(end);% intrp. values ibi(ei:end,:) are already computed   
    
    %% Combining new and old interpolation values (old + new + old ).
    %% Not taking common point b/w old-new and b/w new-old
    MatI=[MatI(1:si-1,:); MatINew; MatI(ei+1:end,:)];     
    
    %% now we would find the max-square-distance of affected segments only  
    [sqDistAryN,indexAryGlobalN]=MaxSqDistAndInd4EachSegbw2Mat(...
                                 Mat,MatI, EffinitialbreaksIndex ); % new
    sqDistMatN=[sqDistAryN',indexAryGlobalN'];      % new mat

    %% if only one row in sqDistMat (case when initially
    %% there were only two breakpoints)
    if( size(sqDistMat,1)==1 ) 
        sqDistMat=sqDistMatN;
    else 
    %% combining sqDistMat new and old values (old + new + old)
        sqDistMat=[sqDistMat(1:localIndex-1,:);...
                   sqDistMatN;...
                   sqDistMat(localIndex+1:length(sqDistMat),:)]; 
    end            
    [MxSqD, localIndex]=max(sqDistMat(:,1));     
end

fbi=ibi;    


% % % % % NOTES===============
% % Alternativley combining sqDistMat new and old values 
% % can be done as follows (slightly less efficient).
%  sqDistMat(localIndex,:)=[];        % remove previous local row
%  sqDistMat=[sqDistMat;sqDistMatN];  % appending two new rows
%  sqDistMat=sortrows(sqDistMat,2)    % sort by index (seond column)

% % % --------------------------------
% % % Author: Dr. Murtaza Ali Khan
% % % Email : drkhanmurtaza@gmail.com
% % % ResearchGate: http://www.researchgate.net/profile/Murtaza_Khan2/
% % % LinkedIn: https://www.linkedin.com/in/dr-murtaza-ali-khan-3b368019
% % % Google Scholar: https://scholar.google.com/citations?user=n0JDQ0sAAAAJ
% % % Scopus: https://www.scopus.com/authid/detail.uri?authorId=7410318323
% % % GitHub: https://github.com/drmurtazakhan
% % % --------------------------------
