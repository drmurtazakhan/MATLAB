% % converte input arguent 'var' to class specified in 'type'.
% % conversion should be possible by MATLAB conversion functions.
% % Following conversion types are allowed
% % int8
% % uint8
% % int16
% % uint16
% % int32
% % uint32
% % int64
% % uint64
% % single
% % double

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
    
% % % ---------------------------------------------------------------
% % This program or any other program(s) supplied with it do(es) not
% % provide any warranty direct or implied.
% % This program is free to use/share for non-commerical purpose only. 
% % Kindly reference the author.
% % Thanking you.
% % @ Copyright: Dr. Murtaza Ali Khan
% % Email: drkhanmurtaza@gmail.com
% % LinkedIn: https://www.linkedin.com/in/dr-murtaza-ali-khan-3b368019
% % ResearchGate: https://www.researchgate.net/profile/Murtaza-Ali-Khan-2
% % Google Scholar: https://scholar.google.com/citations?user=n0JDQ0sAAAAJ
% % % --------------------------------------------------------------- 