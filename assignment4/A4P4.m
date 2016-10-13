% (a)
K = [1000*0.5*2, 0; 0, 1000*1*2];

% (b)
X = zeros(2, 12);
for i=0:1:11
    X(1,i+1) = 0.01 * cos(2 * pi * i / 12);
    X(2,i+1) = 0.01 * sin(2 * pi * i / 12);
end
F = K*X;

% (c)
figure();
quiver(X(1,:), X(2,:), 1000*X(1,:), 1000*X(2,:));
axis equal
hold on
quiver(X(1,:), X(2,:), F(1,:), F(2,:))
xlabel('x position (m)');
ylabel('y position (m)');
legend('imposed displacements', 'evoked forces');
title('Forces and Displacements');


% (d)
Xd = zeros(2, 128);
for i=0:1:127
    Xd(1,i+1) = 0.01 * cos(2 * pi * i / 128);
    Xd(2,i+1) = 0.01 * sin(2 * pi * i / 128);
end
Fd = K * Xd;
figure();
plot(Fd(1,:), Fd(2,:));
axis equal
xlabel('Force x-component (N)');
ylabel('Force y-component (N)');
title('Eliptic Force');

% (e)
angles = zeros(1, 128);
directions = zeros(1,128);
for i=1:1:128
    x = Xd(:,i);
    f = Fd(:,i);
    dirDisp = atan2(x(1), x(2));
    angle = atan2(f(1), f(2)) - dirDisp;
    angles(i) = angle;
    directions(i) = dirDisp;
end
max_angle = max(angles);
figure();
plot(directions, angles);
xlabel('Displacement Direction (rad)');
ylabel('Angle between force and displacement (rad)');
title('Angle between Displacement Direction and Force Direction');

% (f)
eig_1 = [1;0];
eig_2 = [0;1];

% (g)
lam_1 = 1000;
lam_2 = 2000;

% (h)
comment4h = 'The eigenvalue is the amount you have to scale the input by to get the output. Here, they are simply k_x and k_y respectively for the cases where the vectors are perfectly aligned with the coordinate system. The units are N/m';







