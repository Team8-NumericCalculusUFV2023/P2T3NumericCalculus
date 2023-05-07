function [x, itr] = Gauss_Seidel(A, b, tol)
% Esta función resuelve un sistema de ecuaciones dada una matriz cuadrada 
% A, un vector de términos independientes b y la tolerancia tol mediante el
% método iterativo Gauss-Seidel.
%
% Variables de entrada:
%   A = la matriz cuadrada de coeficientes
%   b = vector columna de términos independientes
%   tol = error relativo con la que se quiere calcular la solución
%
% Variables de salida:
%   x = vector columna que contiene las soluciones
%   itr = número de iteraciones con las que se ha calculado x

% Cuerpo de la función:
[F, C] = size(A);
if F ~= C
    error("La matriz introducida debe de ser cuadrada.")
end

dominante = true;
for i = 1:C
    suma = 0;
    for j = 1:C
        if j ~= i
            suma = suma + abs(A(i,j));
        end
    end
    if suma >= abs(A(i,i))
        dominante = false;
        break;
    end
end

if dominante ~= true 
    fprintf("La matriz debería ser diagonalmente dominante")
end 

x = zeros(F, 1);
itr = 0;
err = tol + 1;

while err >= tol
    w = x; % almacenar el vector solución anterior
    suma1 = A(1, 2:F) * w(2:F);
    x(1) = (b(1) - suma1) / A(1, 1);
    for i = 2:F-1
        suma1 = A(i,1:i-1) * x(1:i-1);
        suma2 = A(i,i+1:F) * w(i+1:F);
        x(i) = (b(i) - suma1 - suma2) / A(i,i);
    end
    suma3 = A(F, 1:F-1) * x(1:F-1);
    x(F) = (b(F) - suma3) / A(F, F);
    itr = itr + 1;
    err = norm((x - w)/ x); % calcular el error relativo
end
end