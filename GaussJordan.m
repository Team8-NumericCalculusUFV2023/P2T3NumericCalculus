function x = GaussJordan(A,b)
% Función que permite calcular la solución aproximada de un sistema lineal
% mediante el método Gauss Jordan con pivote.
% El sistema Ax=b introducido tiene que ser compatible determinado.
% Inputs: 
%       - A: matriz de coeficientes
%       - b: vector columna de términos independientes
% Outputs:
%       - x: solución aproximada
    
% Se define la matriz ampliada
Ab = [A, b];
[f, c] = size(Ab);
for j = 1: f
    % Hallamos el pivote que tiene valor absoluto mayor
    [pivote, pos] = max(abs(Ab(j:f, j)));
    % Intercambiamos filas para mayor pivote
    Ab([j, pos+j-1], :) = Ab([pos+j-1, j], :);
    % Se normaliza la ecuación pivotante
    Ab(j, j:c) = Ab(j, j:c) /  pivote;
    % Se hace ceros encima del pivote
    for k = j-1:-1:1
        Ab(k, j:c) = Ab(k, j:c) -  Ab(k, j) * Ab(j, j:c);
    end
    % Se hace ceros debajo del pivote
    for i = j+1:f
        Ab(i, j:c) = Ab(i, j:c) -  Ab(i, j) * Ab(j, j:c);
    end
end

% La columna de términos independientes es la solución
x = Ab(:, c);
end