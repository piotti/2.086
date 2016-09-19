x = -1:0.1:1;

f1 = sin(pi*x);
f2 = sin(pi*(x.^2));
f3 = sin(pi*x).^2;


plot(x,f1,'r-',x,f2,'bo-',x,f3,'kx-');
legend('f1', 'f2', 'f3');
xlabel('x');
ylabel('y');
title('A2P3');