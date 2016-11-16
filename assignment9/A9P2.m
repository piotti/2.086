% Part (a)
s0 = [0;0];
options = odeset('RelTol', 1e-12, 'AbsTol', 1e-12);
tic
[~, s] = ode45(@(t,s) g(t, s), [0 20], s0, options);
ode45_time = toc;
ode45_theta20 = s(size(s,1), 1);
s1=s;
clear s0 s options

% Part (b)
tFinal = 20;
dt = .0005;
s = zeros(2, size(1:tFinal/dt, 2));
tic
for k = 1:tFinal/dt, % (time step counter)
    sGuess = s(:,k); % initial guess for state s at a new
    % time index k+1 is simply the old s from time k
    sizeOfDelta = 1;
    while sizeOfDelta > 1e-6,
        f = sGuess - s(:,k) - dt/2*( g(dt*(k-1),s(:,k)) + g(dt*k,sGuess) );
        dgds = [0,1;-cos(sGuess(1)),0]; % derivative of g wrt current guess
        dfds = eye(2)-dt/2*dgds; % derivative of f wrt current guess
        delta = -inv(dfds)*f; % here�s the Newton-Raphson increment
        sGuess = sGuess + delta; % update the guess
        sizeOfDelta = sum(abs(delta)); % measure the size of the update
    end
    s(:,k+1) = sGuess; % pocket the final guess!
end ;
time0005 = toc;

diff = abs(ode45_theta20 - sGuess(1));
CN_Deltat = 0.05;
CN_theta20 = sGuess(1);

% Part (c)
CN_precision_Deltat = 0.0005;

% Part (d)
commentA9P2d = sprintf(strcat(...
    'The times clocked were as follows:\n',...
    'ode45: 0.0612 s\n',...
    'CN with dt=0.05: 0.0206 s\n',...
    'CN with dt=0.0005: 0.9750 s\n',...
    'CN with dt=0.05 was faster that ode45 while CN with dt=0.005 was slower.'...
    ));





