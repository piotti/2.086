z;
t;

% Part (a)
% a(t_0) = (z(t_{-1}) + 2Z(t_0) + Z(t_1))/(t_1-t_0)^2
a_FD = (z(2) - 2* z(3) + z(4)) / (t(4) - t(3))^2;

% Part (b)
[b]=LeastSquares(z,t);
% Acceleration (second derivative0 equals 2*beta_2 = 2*b(3)
a_LS = 2*b(3);
