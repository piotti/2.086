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
% Tau = Js' * F
Jt = Js';

% Part (b) %
% Mu = T'*Tau = T'*Jt*F
T = [1,0,0;1,1,0;1,1,1];
Jm = T'*Jt;

% Part (c) %
F = zeros(2, 128);
for i=1:1:128
    F(1,i) = cos(pi/64 * (i-1));
    F(2,i) = sin(pi/64 * (i-1));
end
Mu = Jm * F;
figure('Name', 'A5P5c');
quiver3(zeros(128,1), zeros(128,1), zeros(128,1), Mu(1,:)', Mu(2,:)', Mu(3,:)');
title('Relative Joint Torques for Hand Forces at Uniformly Spaced Angles');
xlabel('Relative Torque at Joint 1 (Nm)');
ylabel('Relative Torque at Joint 2 (Nm)');
zlabel('Relative Torque at Joint 3 (Nm)');

% Part (d) %
CommentA5P5d = 'No, the torques all lie in the same plane.';



