% % if required then add padvalue (defualt 0)
% % to make size of rgbimg power of 2.
% %  e.g. if initiall size of rgbimg is 7x5x3
% % the after padding, size of rgbimg would be
% % 8x8x3
function rgbimgnew =padrgbtomakepowof2(rgbimg,varargin)

% % % Default Values
padvalue=0;
defaultValues = {padvalue};
% % % Assign Values
nonemptyIdx = ~cellfun('isempty',varargin);
defaultValues(nonemptyIdx) = varargin(nonemptyIdx);
[padvalue] = deal(defaultValues{:});
% % % --------------

IR=padtomakepowof2(rgbimg(:,:,1),padvalue);
IG=padtomakepowof2(rgbimg(:,:,2),padvalue);
IB=padtomakepowof2(rgbimg(:,:,3),padvalue);
rgbimgnew(:,:,1)=IR;
rgbimgnew(:,:,2)=IG;
rgbimgnew(:,:,3)=IB;

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