% Rectangular-Left %
h = .01;
sm=0;
for x=0:h:3.5 - h
    sm = sm + x^2*sin(pi*x) * h;
end
Int_3a = sm;

% Trapezoidal %
h = .01;
sm=0;
for x=0:h:3.5 - h
    sm = sm + 0.5 * h * (x^2*sin(pi*x) + (x+h)^2*sin(pi*(x+h)));
end
Int_3b = sm;


% PART C %
Int_exact = -0.773751354362928;
h_vec = [.1, .01, .001, .0001, .00001, .000001];
errors_left = zeros(1,6);
errors_trap = zeros(1,6);

count = 1;
for h=h_vec
    
    % Calculate rect-left with current h val
    sm=0;
    for x=0:h:3.5 - h
        sm = sm + x^2*sin(pi*x) * h;
    end
    % Find error
    error = abs(sm - Int_exact);
    % Add error to vector
    errors_left(count) = error;
    
    
    % Calculate trapezoidal with current h val
    sm=0;
    for x=0:h:3.5 - h
        sm = sm + 0.5 * h * (x^2*sin(pi*x) + (x+h)^2*sin(pi*(x+h)));
    end
    % Find error
    error = abs(sm - Int_exact);
    % Add error to vector
    errors_trap(count) = error;
    
    count = count + 1;
end

% Plot errors
N_vec  = 1 ./ h_vec;
loglog(N_vec, errors_left, '-b.', N_vec, errors_trap, '-r.');
grid on
legend('Rectangular-Left', 'Trapezoidal');
title('A3P3c');
xlabel('N (1/h)');
ylabel('Error');




