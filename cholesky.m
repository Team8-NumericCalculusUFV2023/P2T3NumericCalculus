function G = Cholesky(A)
% Función que realiza la descomposición por el método de Cholesky la matriz de
% coeficientes de un sistema de ecuaciones
% Input: 
%       - A: matriz de coeficientes del sistema 
% Output: 
%       - G: matriz descompuesta por Cholesky

% Verificar que A es una matriz cuadrada y simétrica
[n,m] = size(A);
if n ~= m || ~isequal(A,A')
    error('No es cuadrada y/o simétrica');
end

% Verificar que A es definida positiva
if any(eig(A) <= 0)
    error('No es definida positiva');
end

G = triu(n);

for j=1:n
    for k=1:j-1
        A(j,j) = A(j,j) - G(k,j)^2;
    end
    G(j,j) = sqrt(A(j,j));
    for i=j+1:n
        for k=1:j-1
            A(i,j) = A(i,j) - G(k,i)*G(k,j);
        end
        G(j,i) = A(i,j)/G(j,j);
    end
end