function [b] = LeastSquares(z,t)
    % h_1 = t, h_2 = t^2

    X = [ones(5, 1), t, t.^2];
    % X'X*beta = X'z
    b = (X'*X) \ (X'*z);
    
end