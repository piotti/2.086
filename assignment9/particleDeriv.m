function [vec] = particleDeriv(s, alpha)
% Computes the derivate of the state vector s=[v; r]
v = s(1:3);
r = s(4:6);

p = [2, -1, -1; -1, 2, -1; -1, -1, 2] * r / 3;
p_norm = norm(p)^2;

u_x = 5*(r(3) - r(2)) / p_norm;
u_y = 5*(r(1) - r(3)) / p_norm;
u_z = 5*(r(2) - r(1)) / p_norm;

u = [u_x; u_y; u_z];

dv_dt = alpha * (u - v) * norm(u - v);
dr_dt = v;

vec = [dv_dt; dr_dt];

end

