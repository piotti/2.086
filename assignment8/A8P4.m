% Part (a)
m=1;
g=10;
l=1;
I=m*l^2;
Omega = (m*g*l/I^2)^(0.5);
T_period = 2*pi/Omega;
T_final = 3*T_period;
dt = T_period/1000;
t=0:dt:T_final;

%simulation a
omega = zeros(size(t));
theta = zeros(size(t));
theta(1) = 0.1;
for k=1:size(t,2)-1
    theta(k+1) = theta(k) + dt*omega(k);
    omega(k+1) = omega(k) - dt*sin(theta(k))*m*g*l/I;
end
theta_a = theta;
omega_a = omega;

%simulation b
omega = zeros(size(t));
theta = zeros(size(t));
theta(1) = 1;
for k=1:size(t,2)-1
    theta(k+1) = theta(k) + dt*omega(k);
    omega(k+1) = omega(k) - dt*sin(theta(k))*m*g*l/I;
end
theta_b = theta;
omega_b = omega;

%simulation c
omega = zeros(size(t));
theta = zeros(size(t));
theta(1) = 2.9;
for k=1:size(t,2)-1
    theta(k+1) = theta(k) + dt*omega(k);
    omega(k+1) = omega(k) - dt*sin(theta(k))*m*g*l/I;
end
theta_c = theta;
omega_c = omega;

figure('Name','PendulumTime', 'NumberTitle','off')
plot(t, theta_a, '-r', t, theta_b, '-g',t, theta_c, '-b')
title('Angle vs. Time')
legend('a) \theta_0=0.1', 'b) \theta_0=1', 'c) \theta_0=2.9')
xlabel('t')
ylabel('\theta(t)')

% Part (b)

figure('Name','PendulumPhase', 'NumberTitle','off')
plot(theta_a, omega_a, '-r', theta_b, omega_b, '-g', theta_c, omega_c, '-b')
title('Velocity vs. Angle')
legend('a) \theta_0=0.1', 'b) \theta_0=1', 'c) \theta_0=2.9')
xlabel('\theta(t)')
ylabel('\omega(t)')

% Part (c)

commentA8P4c = sprintf(strcat(...
    'I plotted 1*cos(Omega*t) alongside the simulation result starting with theta=1. If the small angle approx. was accurate, these\n',...
    'graphs would look the same. However, the SMA curve has a slightly lower period, and soon gets out of phase. When comparing the SMA\n',...
    'to the results from starting at theta=.1, however, the SMA does very well. It is clear that the SMA becomes innacurate at angles as\n',...
    'high as 1 rad.'...
    ));

% Part (d)

commentA8P4d = sprintf(strcat(...
    'The simulations don''t obey energy conservation. This is apparent in simulation C where the pendulum actually swings all the way to\n',...
    'the top and over after two swings. If energy were conserved, each swing would reach the same height as the previous.\n',...
    'Besides this, the simulations produce pretty accurate results--elipctical phase diagrams and sinusoidal angle functions\n',...
    'with (more or less) constant amplitudes.'...
    ));






