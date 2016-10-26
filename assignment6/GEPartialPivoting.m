function [u, U, fhat] = GEPartialPivoting(A, f)
    
     % Upper-triangularization:
    n = size(f, 1);
    for iPivot = 1:n-1
        i = iPivot;
        [~,ind] = max(abs(A(i:n,i)));
        ind = ind + i - 1; % Because ind is offset due to only using some rows of A
        row = A(ind,:);
        A(ind,:) = A(i,:);
        A(i,:) = row;
        % Switch entries in f, too
        f_ind = f(ind);
        f(ind) = f(i);
        f(i) = f_ind;
        
        pivot = A(iPivot, iPivot);
        for jRow = iPivot+1:n
            scale = A(jRow,iPivot) / pivot;
            A(jRow,:) = A(jRow,:) - A(iPivot,:) * scale;
            f(jRow) = f(jRow) - f(iPivot) * scale;
        end
    end
    U=A;
    fhat=f;
    
    % Back Subsitution:
    u = zeros(n, 1);
    for row = n:-1:1
        row_vec = [U(row,:),fhat(row)];
        sub_vec = [u*-1;1];
        coeff = row_vec(row);
        sub_vec(row) = 0;
        u(row) = row_vec * sub_vec / coeff;
    end

end
