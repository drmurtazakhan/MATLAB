clc, close all, clear all
threshold=0.3;
% picname='Dariusgray.png';
picname='tracersgray.bmp';
I = imread(picname);  % (M-by-N)
[ir ic d]=size(I);


if(~ispowerof2(ir) || ~ispowerof2(ic))
    Ipad=padtomakepowof2(I);
end
% % ----------------------------------
% % Quadtree Encoding of gray levle image
[S,values]=qtreeencode(Ipad,threshold);
% % ----------------------------------
% % Quadtree Decoding
Iback=qtreedecode(S,values);
IbackTrim=Iback(1:ir,1:ic);
% % ----------------------------------
psnr=ps2nr(I,IbackTrim)
figure, imagesc(I);         colormap gray, title('original image');
figure, imagesc(Ipad);      colormap gray, title('padded image, before encoding');
figure, imagesc(Iback);     colormap gray, title('padded decoded image');
figure, imagesc(IbackTrim); colormap gray, title('decoded image of original size');


% % % --------------------------------
% % % Author: Dr. Murtaza Ali Khan
% % % Email : drkhanmurtaza@gmail.com
% % % --------------------------------
% % ResearchGate: http://www.researchgate.net/profile/Murtaza_Khan2/
% % LinkedIn: https://www.linkedin.com/in/dr-murtaza-ali-khan-3b368019
% % Google Scholar: https://scholar.google.com/citations?user=n0JDQ0sAAAAJ
% % Scopus: https://www.scopus.com/authid/detail.uri?authorId=7410318323
% % GitHub: https://github.com/drmurtazakhan