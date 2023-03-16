function y = SubsAdel(A, b)
% Función que realiza la sustitución hacia adelante tras descomponer una
% matriz
% Input: 
%       - A: matriz de coeficientes del sistema 
%       - b: matriz de términos independientes del sistema
% Output: 
%       - y: matriz columna que sirve como la nueva matriz de términos
%       independientes

n = size(A, 1);
y = zeros(n, 1);

y(1) = b(1) / A(1, 1);
for i = 2:n
    y(i) = (b(i) - A(i, 1:i-1)*y(1:i-1)) / A(i, i);
end
end