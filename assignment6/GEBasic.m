function [u, U, fhat] = GEBasic(A, f)


    % Upper-triangularization:
    n = size(f, 1);
    for iPivot = 1:n-1
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