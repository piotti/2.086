% Part (a)
m=1;
b=1;
tau = m/b;
t_final = 6 * tau;
v_0 = 1;

% m*v'(t) = -b*v(t)
% v(t) = v_0*e^(-t/tau)

%simulation a:
dt = tau/2;
t_a = 0:dt:t_final;
v_a = v_0 * ones(size(t_a));
for k=1:size(t_a,2)-1
    v_a(k+1) = v_a(k) + dt*-b/m*v_a(k);
    
end

%simulation b:
dt = tau;
t_b = 0:dt:t_final;
v_b = v_0 * ones(size(t_b));
for k=1:size(t_b,2)-1
    v_b(k+1) = v_b(k) + dt*-b/m*v_b(k);
end

%simulation c:
dt = tau*2;
t_c = 0:dt:t_final;
v_c = v_0 * ones(size(t_c));
for k=1:size(t_c,2)-1
    v_c(k+1) = v_c(k) + dt*-b/m*v_c(k);
end

figure('Name','LinearFirstOrder', 'NumberTitle','off')
plot(t_a, v_a, '-ro', t_b, v_b, '-g*',t_c, v_c, '--bx')
title('Linear First-Order Approximations')
legend('a) dt=tau/2', 'b) dt=tau', 'c) dt=2*tau')
xlabel('t')
ylabel('v(t)')

commentA8P3a = 'As the timestep increased, the accuracy decreased until, with a timestep of 2*tau, it didn''t even converge';



% Part (b)
c = 1;
% m*v'(t) = -c*sign(v)

%simulation a:
dt = tau;
t_a2 = 0:dt:t_final;
v_a2 = v_0 * ones(size(t_a2));
for k=1:size(t_a2,2)-1
    v_a2(k+1) = v_a2(k) + dt*-b/m*c*sign(v_a2(k));
    
end

%simulation b:
dt = tau/2;
t_b2 = 0:dt:t_final;
v_b2 = v_0 * ones(size(t_b2));
for k=1:size(t_b2,2)-1
    v_b2(k+1) = v_b2(k) + dt*-b/m*c*sign(v_b2(k));
end

%simulation c:
dt = tau/10;
t_c2 = 0:dt:t_final;
v_c2 = v_0 * ones(size(t_c2));
for k=1:size(t_c2,2)-1
    v_c2(k+1) = v_c2(k) + dt*-b/m*c*sign(v_c2(k));
    disp(v_c2(k+1))
end


figure('Name','NonlinearFirstOrder', 'NumberTitle','off')
plot(t_a2, v_a2, '-ro', t_b2, v_b2, '-g*',t_c2, v_c2, '--bx')
title('Nonlinear First-Order Approximations')
legend('a) dt=tau', 'b) dt=tau/2', 'c) dt=tau/10')
xlabel('t')
ylabel('v(t)')

commentA8P3b = sprintf(strcat(...
    'The biggest role the timestep plays here is that, if the timestep*b*c/m is a factor of the initial velocity, the system will\n',...
    'converge to zero. Else, the system will overshoot and keep oscillating as seen in part C, even though in part C that theoretically\n',...
    'shoudln''t happen because 1/10 goes into 1 evenly. However, rounding errors mess it up just enough that the velocity isn''t exactly zero\n',...
    'and the sign function returns a 1 instead of a zero. The size of the timestep isn''t that important--all that matters is if it will\n',...
    'be able to line up perfectly with 0 to converge.'...
    ));










