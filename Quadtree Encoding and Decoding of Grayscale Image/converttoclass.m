% Converts the input argument 'var' to the class specified by 'type'.
% The conversion must be supported by MATLAB's built-in type conversion functions.
%
% Supported conversion types:
% - int8, uint8
% - int16, uint16
% - int32, uint32
% - int64, uint64
% - single, double

function var=converttoclass(var,type)

if (strcmp(type,'int8'))
    var=int8(var);
elseif(strcmp(type,'uint8'))
    var=uint8(var);
elseif(strcmp(type,'int16'))
    var=int16(var);
elseif(strcmp(type,'uint16'))
    var=uint16(var);
elseif(strcmp(type,'int32'))
    var=int32(var);
elseif(strcmp(type,'uint32'))
    var=uint32(var);
elseif(strcmp(type,'int64'))
    var=int64(var);
elseif(strcmp(type,'uint64'))
    var=uint64(var);
elseif(strcmp(type,'single'))
    var=single(var);
elseif(strcmp(type,'double'))
    var=double(var);
else
    disp('this type is not allowed or supported');
end
    
% % % --------------------------------
% % % Author: Dr. Murtaza Ali Khan
% % % Email : drkhanmurtaza@gmail.com
% % % --------------------------------
% % ResearchGate: http://www.researchgate.net/profile/Murtaza_Khan2/
% % LinkedIn: https://www.linkedin.com/in/dr-murtaza-ali-khan-3b368019
% % Google Scholar: https://scholar.google.com/citations?user=n0JDQ0sAAAAJ
% % Scopus: https://www.scopus.com/authid/detail.uri?authorId=7410318323
% % GitHub: https://github.com/drmurtazakhan








