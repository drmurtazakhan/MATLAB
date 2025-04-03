% % fill the rectangle region specified by upper left corner width
% % and height of recangle.

% % INPUT
% % ul=[x0,y0] i.e coordinates of upper left corner of rectangle
% % w: width of rectangle
% % h: height of rectangle
% % colorStr: color string one of eight predefined colors 
% %           'r' or 'y' or 'g' or 'c' or 'b' or 'm' or 'w' or 'b'
function fillrect_ulwh(ul,w,h,varargin)

% % % Default Values 
colorStr='g'; %default filling color green
defaultValues = {colorStr};
% % % Assign Values
nonemptyIdx = ~cellfun('isempty',varargin);
defaultValues(nonemptyIdx) = varargin(nonemptyIdx);
[colorStr] = deal(defaultValues{:});
% % %---------------------

% fill([ ul(1)+w, ul(1)+w, ul(1), ul(1) ],...
%      [ ul(2)+h, ul(2)+h, ul(2), ul(2) ],...
%        colorStr);

% figure, ,hold on
% axis ij
fill([ ul(1), ul(1),   ul(1)+w, ul(1)+w ],...
     [ ul(2), ul(2)+h, ul(2)+h, ul(2) ],...
       colorStr);
axis ij

% figure,
% axis normal

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