h_vec = [1, 0.1, 0.01, 0.001, 0.0001, 0.00001];
x = 0.55555555;

f_x = x^2*sin(pi*x);

% Keep track f errors for each h value
e_const_vec = zeros(1,length(h_vec));
e_piece_vec = zeros(1,length(h_vec));


% Keep track of iteration number
i = 1;

for h=h_vec
    x_vec = 0:h:1;
    f_vec = (x_vec).^2.*(sin(pi*x_vec));
    
    % Get If_const(x) from A2P4a
    A2P4a;
    if_const = Interp_f_h;
    
    % Get If_piece(x) from A2P4b
    A2P4b;
    if_piece = Interp_f_h;
    
    % Get e_const from |If_const(x) - f(x)|
    e_const = abs(if_const - f_x);
    
    % Get e_piece from |If_piece(x) - f(x)|
    e_piece = abs(if_piece - f_x);
    
    % Add errors to error vectors
    e_const_vec(i) = e_const;
    e_piece_vec(i) = e_piece;
    
    % Add to iteration number
    i = i+1;
  
end

% Graph e versus N=1/h
N_vec = 1 ./ h_vec;
loglog(N_vec, e_const_vec, 'k*', N_vec, e_piece_vec, 'ro');
title('A2P4c');
legend('e_{const}', 'e_{piece}');
xlabel('N (1/h)');
ylabel('error');
grid on

comment4c = 'Both errors go down as h decreases. The slope of e_const is -0.5, and the slope of e_piece is -1. This makes sense considering left-endpoint is first order and piecewise linear is second order.';

