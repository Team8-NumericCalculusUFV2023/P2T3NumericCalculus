function x = GaussJordan(A, b)
% Resuelve un sistema de ecuaciones lineales Ax = b mediante el método de
% Gauss-Jordan con pivoteo parcial.
%
% Variables de entrada:
%   A = matriz de tamaño n x n
%   b = vector columna de tamaño n
%
% Variables de salida:
%   x = vector columna solución de tamaño n

% Cuerpo de la función:
Ab = [A, b];
[F, C] = size(Ab);

for j = 1:C-1 % Contador de las columnas
    % Elegimos fila con mayor pivote:
    p = abs(Ab(j,j));    % p = pivote de la columna
    fp = j;              % fp = indice de la fila del pivote

    % Se encuentra el pivote:
    for i = j+1:F
        if abs(Ab(i, j)) > p
            p = abs(Ab(i, j));
            fp = i;
        end
    end

    % Se intercambian filas "j" y "p":
    v = Ab(j,:);
    Ab(j,:) = Ab(fp,:);
    Ab(fp,:) = v;

    % Se reducen las filas utilizando el pivote:
    Ab(j,:) = Ab(j,:)/Ab(j,j);
    for i = 1:F % contador de filas por pivote
        if Ab(i,j) ~= 0 && i ~= j % Compruebo si el elemento ya es nulo    
            Ab(i,:) = Ab(i,:) - Ab(i,j) * Ab(j,:);
        end
    end
end

% Se encuentra la solución:
x = Ab(:,C);

end