x_vec;
f_vec;
x;

% Piecewise linear interpolation:
% If(x) = (f(x_(i+1))-f(x_i)) / (x_(i+1)-x_i) * (x-x_i) + f(x_i)

% Find x_i (called x1) and x_(i+1) (called x2) from A2P2
A2P2;
x1 = x_vec(i_star);
x2 = x_vec(i_star + 1);

% Find f(x_i) and f(x_(i+1)) from i*
f_x1 = f_vec(i_star);
f_x2 = f_vec(i_star + 1);

% Use equation to get If(x)
Interp_f_h = (f_x2-f_x1)/(x2-x1)*(x-x1)+f_x1;

