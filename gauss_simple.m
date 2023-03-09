function x = gauss_simple(A, b)
% Función que permite calcular la solución aproximada de un sistema lineal.
% El algoritmo utilizado es el Método de Gauss simple.
% Inputs: 
% A = matriz de coeficientes
% b = vector columna de términos independientes
% Outputs:
% x = solución aproximada
% Se dan problemas si: 
% - Algún pivote es 0
% - El pivote tiene un valor pequeño en relación al resto de la fila
% - El sistema está mal condicionado
    % Se define la matriz ampliada
    Ab = [A, b];
    [f, c] = size(Ab);
    for j = 1: f-1
        for i = j + 1: f
            % Se hace ceros debajo del pivote, para ello a las filas de la
            % j+1 a la f se les resta la fila pivote dividida por el pivote
            % y multiplicada por el primer coeficiente no nulo de estas
            Ab(i, j:c) = Ab(i, j:c) -  Ab(i, j) / Ab(j, j) * Ab(j, j:c);
        end
    end
    x = zeros(f, 1);
    % Despejamos la última componente de la solución
    x(f) = Ab(f, c) / Ab(f, f);
    for i = f-1:-1:1
        % Se realiza sustitución hacia atrás
        x(i)= (Ab(i, c) - Ab(i, i+1:f)*x(i+1:f)) / Ab(i, i);
    end
end