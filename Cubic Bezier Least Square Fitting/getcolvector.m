% If vin is a row vector, convert it to a column vector and return it.
% If vin is already a column vector, return it as is.
% If vin is not a vector, display an error message.
%
% Example:
% If vin is a row vector, such as:
%   vin = [5, 8, 6];
% The output vout will be:
%   vout = [5;
%           8;
%           6];
%
% If vin is already a column vector, for example:
%   vin = [5; 8; 6];
% The output vout will remain:
%   vout = [5;
%           8;
%           6];


function vout=getcolvector(vin)

if(~isvec(vin)  )
    error('input must be a vector');    
end

vout=vin;
[r c]=size(vin);
if (r==1)      % vin is row vector, make it col. vector 
    vout=vin';
end

% % % --------------------------------
% % % Author: Dr. Murtaza Khan
% % % Email : drkhanmurtaza@gmail.com
% % % --------------------------------


