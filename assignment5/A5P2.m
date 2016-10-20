% Part (a) %
theta_1 = pi/4;
theta_2 = 3*pi / 4;
L_1 = 0.3;
L_2 = 0.3;
Js = [-L_1*sin(theta_1), -L_2*sin(theta_2); L_1*cos(theta_1), L_2*cos(theta_2)];

% Part (b) %
T = [1,0;1,1];

% Part (c) %
% Theta = T*Rho -> Rho = Tinv*Theta
% v = Js * Theta_dot = Jr*Rho_dot = Jr*Tinv*Theta_dot
% Js = Jr * Tinv -> Jr = Js * T
Jr = Js * T;

% Part (d) %
CommentA5P2d = 'No solution exists';

% Part (e) %
CommentA5P2e = 'Inifinitely many solutions exist in the form -.4243*rho_1_dot - .2121*rho_2_dot = -1';

