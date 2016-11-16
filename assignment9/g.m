function [g_s] = g(t, s)
    theta = s(1);
    theta_dot = s(2);
    g_s = [theta_dot; 0.5*cos(t/2) - sin(theta)];
end

