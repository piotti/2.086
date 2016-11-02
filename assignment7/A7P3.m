load('A7P3.mat')
n=99;
%Load data into corresponding column vectors
x = A7P3_data(:,1);
y = A7P3_data(:,2);
xm = A7P3_data(:,3);
ym = A7P3_data(:,4);
u = A7P3_data(1:n-1,5);
v = A7P3_data(1:n-1,6);

% Part (a) %
pos_err = mean(((x-xm).^2+(y-ym).^2).^0.5);

% Part (b) %
Integrator = tril(ones(98));
xdr = [0; Integrator * u] + x(1);
ydr = [0; Integrator * v] + y(1);
dr_err = mean(((x-xdr).^2+(y-ydr).^2).^0.5);

% Part (c) %
sig_vel = 0.35;
% x_i = x_0 + u_1 + u_2 + ... = u_{i-1}:
integration_rows = tril(ones(n));
% um_i /sig_vel = u_i/sig_vel:
vel_rows = [zeros(n-1,1), diag(ones(1,n-1)/sig_vel)];

X = [integration_rows, zeros(n);
    vel_rows, zeros(n-1, n);
    zeros(n), integration_rows;
    zeros(n-1,n), vel_rows];

f = [xm; u/sig_vel; ym; v/sig_vel];
beta = (X'*X) \ (X'*f);

uf = beta(2:n);
vf = beta(n+2:2*n);
xf = [0; Integrator * uf] + beta(1); %beta(1) = x_1
yf = [0; Integrator * vf] + beta(n+1); %beta(n+1) = y_1
fusion_err = mean(((x-xf).^2+(y-yf).^2).^0.5);





