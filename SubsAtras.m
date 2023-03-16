function y = SubsAtras(A,b)
% Función que realiza la sustitución hacia atrás tras descomponer una
% matriz de coeficientes
% Input: 
%       - A: matriz de coeficientes del sistema 
%       - b: matriz de términos independientes del sistema
% Output: 
%       - y: matriz columna que sirve como la nueva matriz de términos
%       independientes

n = size(A, 1);
y = zeros(n, 1);

y(n) = b(n) / A(n, n);
for i = n-1:-1:1
    y(i) = (b(i) - A(i, i+1:n)*y(i+1:n)) / A(i, i);
end
end