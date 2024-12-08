function psnr = ps2nr(x,y)
x=double(x);
y=double(y);
mse=msqerr(x,y);
m1 = max( abs(x(:)) );
m2 = max( abs(y(:)) );
maxval = max(m1,m2);

% psnr = 10*log10( maxval^2/mse );

psnr = 10*log10( 255^2/mse );


