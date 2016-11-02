% A7P3 plotting script

% x,y = the actual position 
% xm,ym = the measured positions
% xdr,ydr = the dead-reckoned positions
% xf,yf = the fusion positions

% To help you check your answer the first and last values of the correct
% fusion vector are here
%{
xf(1)  = 0.648071637821332
xf(99) = 20.084732375723959
yf(1)  = 0.325474599351056
yf(99) = 16.818616736421603
%}

n = size(x,1);% length of any of the position elements
a = 2*[-2 12 -2 10]; 
figure(1);clf;hold off;

subplot(221) ; plot(x,y,'k.-',x(1),y(1),'ko',x(n),y(n),'k*'); 
axis(a); title('True x,y [ o:start, *:end) ]'); ylabel('North, m');

subplot(222) ; plot(xm,ym,'r.-',x(1),y(1),'ko',x(n),y(n),'k*'); 
axis(a);title('Measured x,y');

subplot(223) ; plot(xdr,ydr,'r.-',x(1),y(1),'ko',x(n),y(n),'k*');
axis(a);title('Dead-reckoned x,y');xlabel('East, m');ylabel('North, m');

subplot(224) ; plot(xf,yf,'.-',x(1),y(1),'ko',x(n),y(n),'k*');
axis(a);title('Fusion x,y'); xlabel('East, m');

disp(sprintf('True x,y start and end positions:  [%g,%g], [%g,%g]',...
    x(1),y(1),x(end),y(end)));

disp(sprintf('Measured x,y: mean of 2-norm errors:  %g.', pos_err)) ;
 
disp(sprintf('Dead-reckoned x,y:  mean of 2-norm errors:  %g.',...
     dr_err ));
 
disp(sprintf('Fusion x,y: mean of 2-norm errors: %g.', fusion_err ));
