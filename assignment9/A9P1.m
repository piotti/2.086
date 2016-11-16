s0 = [v0; r0];

% Part (a1)
alpha = 0.1;
[~, s1] = ode45(@(t,s) particleDeriv(s, alpha), [0 1000], s0);
r1 = s1(size(s1, 1), 4:6);

% Part (a2)
alpha = 0.2;
[~, s2] = ode45(@(t,s) particleDeriv(s, alpha), [0 1000], s0);
r2 = s2(size(s2, 1), 4:6);

% Part (a3)
alpha = 0.3;
[~, s3] = ode45(@(t,s) particleDeriv(s, alpha), [0 1000], s0);
r3 = s3(size(s3, 1), 4:6);

rFinal = [r1', r2', r3'];

plot3(s1(:,4),s1(:,5), s1(:,6), 'r-',...
    s2(:,4),s2(:,5), s2(:,6), 'b-',...
    s3(:,4),s3(:,5), s3(:,6), 'k-',...
    r0(1), r0(2), r0(3), 'k*');

xlabel('x position')
ylabel('y position')
zlabel('z position')
title('A9P1a')
legend('\alpha=0.1', '\alpha=0.2', '\alpha=0.3', 'initial position')

% Part (b)
%{
alpha = 0.1;
options = odeset('RelTol', 1e-6, 'AbsTol', 1e-6);
[~, s_b1] = ode45(@(t,s) particleDeriv(s, alpha), [0 1000], s0, options);
r_b1 = s_b1(size(s_b1, 1), 4:6);
err_1 = norm((r1-r_b1)./r1)*100;

options = odeset('RelTol', 1e-5, 'AbsTol', 1e-5);
[~, s_b2] = ode45(@(t,s) particleDeriv(s, alpha), [0 1000], s0, options);
r_b2 = s_b2(size(s_b2, 1), 4:6);
err_2 = norm((r1-r_b2)./r1)*100;

options = odeset('RelTol', 1e-4, 'AbsTol', 1e-4);
[~, s_b3] = ode45(@(t,s) particleDeriv(s, alpha), [0 1000], s0, options);
r_b3 = s_b3(size(s_b3, 1), 4:6);
err_3 = norm((r1-r_b3)./r1)*100;

options = odeset('RelTol', 1e-3, 'AbsTol', 1e-3);
[~, s_b4] = ode45(@(t,s) particleDeriv(s, alpha), [0 1000], s0, options);
r_b4 = s_b4(size(s_b4, 1), 4:6);
err_4 = norm((r1-r_b4)./r1)*100;
%}
A9P1b = 4;