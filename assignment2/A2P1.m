rgeo;
Ngeo;

% Create a vector of r's thats N long
r_vec = (ones(1,Ngeo) .* rgeo);

% Create a vector N-long that goes from 0 to N-1
exp_vec = (0:Ngeo-1);

% Raise r to each value in exp_vec
terms = r_vec .^ exp_vec;

% Sum up all terms
G_Ngeo = sum(terms);

