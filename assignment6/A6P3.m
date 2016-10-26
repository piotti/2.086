T_0;
T_11;

A = zeros(12, 12);
b = zeros(12, 1);
%Initial conditions:
A(1,1) = 1;
b(1) = T_0;
A(12, 12) = 1;
b(12) = T_11;
dx = 0.5;
for i=2:11
    x = i-1;
    A(i, i-1) = -1;
    A(i, i+1) = -1;
    A(i, i) = 2 + 0.1 * x * dx^2;
    b(i) = 0.1 * x * dx^2 * (x + 30);
end

u = A \ b;
u = u(2:11);
    