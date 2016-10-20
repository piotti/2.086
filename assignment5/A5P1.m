% Part (a) %
 N;
 Tinv = diag(ones(1,N-1)*-1, -1) + diag(ones(1,N),0);
 
 % Part (b) %
 K = diag(ones(1, N) * 100, 0);
 % K_x = T^(-T) * K * T^(-1) = Tinv' * K * Tinv
 K_x = Tinv' * K * Tinv;
 
 % Part (c) %
 C_x = inv(K_x);
 figure('Name','A1P5c','NumberTitle','off')
 subplot(1,2,1)
 spy(K_x,'bx')
 title('K_x')
 xlabel('Column')
 ylabel('Row')
 subplot(1,2,2)
 spy(C_x, 'bx')
 title('C_x')
 xlabel('Column')
 ylabel('Row')
 
 % part (d) %
 Cxmax = max(max(C_x));
 
 
 
 