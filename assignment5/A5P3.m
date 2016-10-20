% Part (a) %
theta_1 = pi/4;
theta_2 = 3*pi/4;
L_1 = 0.3;
L_2 = 0.3;
% Tau = Js' * F
Js = [-L_1*sin(theta_1), -L_2*sin(theta_2); L_1*cos(theta_1), L_2*cos(theta_2)];
Jt = Js';

% Part (b) %
% Mu = T'*Tau = T'*Jt*F
T = [1,0;1,1];
Jm = T'*Jt;

% Part (c) %
CommentA5P3c = 'Through Gaussian Elimination, it is clear that no solution exists.';

% Part (d) %
CommentA5P3d = 'An infinite number of solutions exist in the form Fy-Fx = 1/0.2121.';

% Part (e) %
CommentA5P3e = 'Yes, by simply multiplying Jm * [1;1].';


