% % Quadtree Encoding and Decoding of Grayscale Image
% % 
% % Quadtree encoding divides a grayscale image into blocks, recursively
% splitting it into four smaller blocks when pixel values differ
% significantly, based on a threshold. The decomposition consists of:
% % S: A sparse matrix representing the upper-left corner and size of each block.
% % values: A vector storing the average values of the corresponding blocks.

% The dimensions of the input image 'I' must be a power of 2 (e.g., 128x128 or 512x512).
% If not, the QuadTree decomposition may not work correctly.

% % INPUT PARAMETERS:
% % I: Input image to be processed.
% % threshold: A value between 0 and 1; set to 0 for lossless encoding.
% % mindim: Minimum allowable size of any image block.
% % maxdim: Maximum allowable size of any image block.
% % xlimit: Restriction such that if S(x,y) exists, then x < xlimit.
% % ylimit: Restriction such that if S(x,y) exists, then y < ylimit.

% % OUTPUT PARAMETERS:
% % S: Sparse matrix containing the coordinates of the upper-left corners of the blocks.
% % values: Values of the blocks; if a threshold is applied, this represents 
% %         the average pixel value of each block.
% % ----------------------------------------
% % Notes about parameters:
% % The parameters 'threshold', 'mindim', 'maxdim', 'xlimit', and 'ylimit' 
% % are optional input arguments.
% 
% % Blocks will not be smaller than 'mindim' or larger than 'maxdim'. 
% % Blocks exceeding 'maxdim' are always split, regardless of the threshold condition.
% % Both 'mindim' and 'maxdim' must be powers of 2.
% 
% % If the optional 'threshold' parameter is provided, the average value of 
% % each block is calculated and returned in 'values'.
% 
% % The parameters 'mindim' and 'maxdim' correspond to their usual definitions 
% % as explained in MATLAB's 'qtdecomp' function documentation.
% 
% % The optional parameters 'xlimit' and 'ylimit' restrict the entries in 'S' 
% % and 'values', excluding pixels beyond (xlimit, ylimit). This is useful 
% % when padding is added to make the image dimensions a power of 2, 
% % avoiding unnecessary sparse matrix entries for padded pixels.
% % ----------------------------------------------------------------

function [S,values]=qtreeencode(I,varargin)

classI=class(I);
% if( ~strcmp(classI,'uint8') && ~strcmp(classI,'uint16') )
%     error('performs quadtree decomposition for only images of type uint8 or uint16 only');
% end
% % ----------------------------------------------------------------
% % % Default Values 
threshold=0; %lossless encoding
mindim=1;
[ri,ci]=size(I);
if(ri>ci)
    maxdim=ri;
else
    maxdim=ci;
end
xlimit=ri;
ylimit=ci;
defaultValues = {threshold,mindim,maxdim,xlimit,ylimit};
% % % Assign Values
nonemptyIdx = ~cellfun('isempty',varargin);
defaultValues(nonemptyIdx) = varargin(nonemptyIdx);
[threshold,mindim,maxdim,xlimit,ylimit] = deal(defaultValues{:});
% threshold,mindim,maxdim,xlimit,ylimit
% % ----------------------------------------------------------------
S = qtdecomp(I,threshold,[mindim,maxdim]);
% % [i,j,v] = find(X) returns a column vector v of the nonzero
% % entries in  X, as well as row and column indices 
[i,j,blkSz] = find(S);
% % at locations (i,j) S has values blkSz (i.e. block size)
if(threshold==0) %lossless encoding
    for k=1:length(i)        
        values(k)=I(i(k),j(k)); % values of corresponding indices of S
    end
else             %lossy encoding
    blkcount=length(i);
    values=avgofmatblks(I,i,j,blkSz,blkSz);
end
values=values'; %converting to column vector
% % ----------------------------------------------------------------
% % % Now Removing those rows from S and values that exceed (xlimit,ylimit)
if (xlimit<ri && ylimit<ci)
    [S,values]=delsparsekeybyxANDy(S,i,j,values,xlimit,ylimit);
end
% % ----------------------------------------------------------------
% % Trim S
% S=S(1:max(i),1:max(j)); %use previously computed [i,j,v]=find(S)
S=trimsparse(S);      %computes again [i,j,v]=find(S)
% % ----------------------------------------------------------------


% % Notes about function:
% % S = qtdecomp(I) performs a quadtree decomposition on the intensity image I 
% % and returns the structure in the sparse matrix S. If S(k,m) is nonzero, 
% % (k,m) is the upper-left corner of a block, and its size is given by S(k,m). 
% % By default, blocks are split unless all their elements are equal.
% 
% % S = qtdecomp(I, threshold) splits a block if the range (max - min) of its 
% % elements exceeds 'threshold'. Threshold is scaled based on the data type 
% % of I (e.g., multiplied by 255 for uint8).
% 
% % S = qtdecomp(I, threshold, mindim) prevents producing blocks smaller 
% % than 'mindim', even if they do not meet the threshold condition.

% % % --------------------------------
% % % Author: Dr. Murtaza Ali Khan
% % % Email : drkhanmurtaza@gmail.com
% % % --------------------------------
% % ResearchGate: http://www.researchgate.net/profile/Murtaza_Khan2/
% % LinkedIn: https://www.linkedin.com/in/dr-murtaza-ali-khan-3b368019
% % Google Scholar: https://scholar.google.com/citations?user=n0JDQ0sAAAAJ
% % Scopus: https://www.scopus.com/authid/detail.uri?authorId=7410318323
% % GitHub: https://github.com/drmurtazakhan


