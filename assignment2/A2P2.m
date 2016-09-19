x_vec;
x;

% Find i* index by searching vector for values >= x
% and taking the last (highest) one.
% Note that since x_vec is ordered, the last value
% returned by find() will be the greatest

i_star = find(x_vec<=x, 1, 'last');


