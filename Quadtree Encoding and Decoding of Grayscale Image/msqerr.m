% % % mse:    Mean Squared Error (MSE) between two datasets. % sqdRow:

% % Row-wise squared distance between 'x' and 'y' for 1-D or 2-D data only.

function [mse,sqdRow]=msqerr(x,y)

dim=ndims(x);
[r, c]=size(x);
x=double(x);
y=double(y);
if dim<=2
    sqdColRow=(x-y).^2;        % sq. distance for each column of each row
    sqdRow=sum(sqdColRow,2);   % sq. distance for each row
    mse=sum(sqdRow)/(r*c);
else
    error = (x - y).^2;
    mse = sum(error(:))/prod(size(x));
end

% % Ref:
% % http://en.wikipedia.org/wiki/PSNR
% % http://www.mathworks.com/support/solutions/data/1-ON190.html?product=IP&solution=1-ON190