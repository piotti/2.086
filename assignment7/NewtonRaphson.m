function [dx,dy] = NewtonRaphson(F,x_0,maxit)
    E = 6900000;
    A_1 = 2; % cm^2
    A_2 = 2;
    A_3 = 1;
    L_1 = 4; % meters
    L_2 = 4;
    L_3 = 1.5;
    
    for i=1:maxit
        t_1 = E*A_1*x_0(1)/L_1;
        t_2 = E*A_2*-x_0(1)/L_2;
        t_3 = E*A_3*x_0(2)/L_3;
        
        t_1_dx = E*A_1/L_1;
        t_2_dx = -E*A_2/L_2;
        t_3_dy = E*A_3/L_3;
        
        f_1 = F*cos(pi/4) + t_2 - t_1 - t_3*x_0(1)/L_3; % =0
        f_2 = F*sin(pi/4) - t_3 - t_1*x_0(2)/L_1 - t_2*x_0(2)/L_2; % =0
        
        f_1_dx = t_2_dx-t_1_dx-t_3/L_3;
        f_1_dy = -x_0(1)/L_3*t_3_dy;
        
        f_2_dx = -x_0(2)*(t_1_dx/L_1+t_2_dx/L_2);
        f_2_dy = -t_3_dy-t_1/L_1-t_2/L_3;
        
        J = [f_1_dx, f_1_dy; f_2_dx, f_2_dy];
        
        x_star = x_0 - (J \ [f_1; f_2]);
        x_0 = x_star;
    end
    
    dx = x_0(1);
    dy = x_0(2);
    
end
