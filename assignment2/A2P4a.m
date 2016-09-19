x_vec;
f_vec;
x;



% Constant left-endpoint interpolation:
% If(x) = f(x_i) where x_i <= x < x_(i+1)

% A2P2 returns i_star, where x_vec(i_star) = x_i
% Similary, f_vec(i_star) = f(x_i)
A2P2;

% Set output as f(i_star)
Interp_f_h = f_vec(i_star);