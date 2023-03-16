function y = SubsAdel(A, b)
% Función que realiza la sustitución 
% de términos independientes b, y devuelve la solución del sistema de ecuaciones
% Ax = b utilizando la sustitución hacia adelante

n = size(A, 1);
y = zeros(n, 1);

y(1) = b(1) / A(1, 1);
for i = 2:n
    y(i) = (b(i) - A(i, 1:i-1)*y(1:i-1)) / A(i, i);
end