% (a)
x = linspace(-1,1,21);

% (b)
y = -0.5:.05:1.5;

% (c)
X = zeros(41,21);
Y = zeros(41,21);
for i=1:1:41
    X(i,1:21) = x;
end
for i=1:1:21
    Y(1:41,i) = y;
end

% (d)
A = X.^2 + Y.^2;

% (e)
F = 1 ./ A;

% (f)
inf_indices = find(isinf(F));
F1 = F;
for i=inf_indices'
    F1(i)=0;
end
ave = sum(sum(F1)) / (numel(F1) - numel(inf_indices));
for i=inf_indices'   
    F1(i) = ave;
end

% (g)
F2 = [F1,F1];

% (h)
F3 = [F2;100*ones(1,42)];

% (i)
F4 = F3;
F4(1,:) = 100 * ones(1,42);
F4(:,1) = 100 * ones(42,1);
F4(:,42) = 100 * ones(42,1);

% (j)
F5 = F4;
F5(21,21) = 200;
F5(29,12) = 200;
F5(29,31) = 200;
for k=13:1:30
    F5(30,k) = 200;
end

% (k)
bigsum = sum(sum(F5));

