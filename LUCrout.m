function [L, U] = LUcrout(A)
% Descomposición LU por el método de Crout
% A es la matriz de coeficientes
% L es la matriz triangular inferior
% U es la matriz triangular superior

[n, ~] = size(A);
L = zeros(n);
U = eye(n);

for j = 1:n
    % Calcular elementos de la matriz L
    for i = j:n
        L(i,j) = A(i,j) - L(i,1:j-1)*U(1:j-1,j);
    end
    
    % Calcular elementos de la matriz U
    for i = j+1:n
        U(j,i) = (A(j,i) - L(j,1:j-1)*U(1:j-1,i))/L(j,j);
    end
end
end