L_1 = 0.3;
L_2 = 0.25;
L_3 = 0.05;

% Part (a) %
theta_1 = pi/4;
theta_2 = 3*pi/4;
theta_3 = pi/2;
Js = [
  -L_1*sin(theta_1), -L_2*sin(theta_2), -L_3*sin(theta_3);
  L_1*cos(theta_1), L_2*cos(theta_2), L_3*cos(theta_3);
];

% Part (b) %
T = [1,0,0;1,1,0;1,1,1];

% Part (c) %
Jr = Js * T;

% Part (d) %
% dp = Jr \ [1;1];
CommentA5P4d = 'A solution exists, and it is unique (dp = [.5841, -5.5400, 0]^T).';




