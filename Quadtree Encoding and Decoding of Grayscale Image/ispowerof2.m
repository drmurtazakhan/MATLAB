% Checks if the given number 'n' is a power of 2.
% Returns 1 if 'n' is a power of 2, otherwise returns 0.

function flag=ispowerof2(n)

flag=0;

table=[1,2,4,8,16,32,64,128,256,512,1024,2048,4096,8192,16384,32768,65536,131072,262144,524288,...
    1048576,2097152,4194304,8388608,16777216,33554432,67108864,134217728,268435456,536870912];

if(n>table(end) || n<1)
    error('Out out range, can not check either this value is power of 2 or not')
end

if( length(find(table == n)>0) )
    flag=1;
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
    