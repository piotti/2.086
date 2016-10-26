%{
size = 100;
A = zeros(11*size+1, 11*size+1);
b = zeros(11*size+1, 1);
A(1,1) = 1;
b(1) = T_0;
A(11*size+1, 11*size+1) = 1;
b(11*size+1) = T_11;
dx = 1/size;
for ind=2:11*size
    i = ind-1;
    x = i*dx;
    A(ind, ind-1) = -1;
    A(ind, ind+1) = -1;
    A(ind, ind) = 2 + 0.1 * x * dx^2;
    b(ind) = 0.1 * x * dx^2 * (x + 30);
end

% i) inv
tic
u_inv = inv(A)*b;
t_inv = toc;

% ii) GEBasic
tic
u_basic = GEBasic(A, b);
t_basic = toc;

% iii) Full backlash
tic
u_backlash = A \ b;
t_backlash = toc;

% iv) Sparse
S = sparse(A);
tic
u_sparse = A \ b;
t_sparse = toc;
%}
comment4a = sprintf(strcat('i. 200x faster than ii\n',...
    'ii. Longest runtime\n',...
    'iii. 1000x faster than ii\n',...
    'iv. 1000x faster than ii'));
comment4b = sprintf(strcat('ii. is the slowest because the upper-triangularization takes N^3 time.\n',...
    'inv is faster because it only has to inverse the matrix and then multiply an nxn matrix by an nx1 vector which seems like it would have at most N^2 time.\n',...
    'backslash is faster because it uses multiple optimizations to decrease complexity of the matrix so it doesnt need to do every step explicitly.\n',...
    'sparse is just a little faster than backslash because the matrix is mostly zeros and a sparse matrix just forgets about these zeros and doesnt have to compute them.'));