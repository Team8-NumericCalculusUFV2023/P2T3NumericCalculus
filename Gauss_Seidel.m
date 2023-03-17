function [x, itr] = Gauss_Seidel(A,b,tol)
% INPUTS:
%   A   =  matriz (cuadrada) de coeficientes
%   b   =  vector columna de términos independientes
%   tol = la tolerancia o error relativo de la solución encontrada
% OUTPUTS:
%   x   = vector columna solución
%   itr = indica el número de iteraciones realizadas

    [F, Z] = size(A);
    % Paso 1: comprobamos si la matriz es cuadrada
    if F ~= Z
        disp("ERROR: la matriz no es cuadrada")
        return
    end
    % Paso 2: comprobamos si la matriz es diagonalmente dominante.
    % Si los valores absolutos de la diag son mayores que el valor absoluto de la suma de cada
    % columna, entonces es diagonalmente dominante.
    sum = 0;
    for i = 1:F
        for j=1:F
            if i ~= j
                sum = sum + A(i,j);
            end
        end
        % Se calcula el error relativo como el valor absoluto de la
        % diferencia de la sol2 - sol1 entre la sol1
        if abs(sum) > abs(A(i,i))     
            disp("ERROR: la matriz no es diagonalmente dominante");
            return
        end
        sum = 0;
    end
    
    % Paso 3: tomo cero como valor de las variables en la primera iteración. 
    x = zeros(F,1);
    y = x + 1;
    itr = 1;
    
    % Paso 4: itero hasta que el error relativo sea menor que la tolerancia
    while abs((y-x)./y) > tol
        y = x;
        for i=1:F
            x(i) = (1/A(i,i))*(b(i) - A(i,[1:i-1,i+1:F])*x([1:i-1,i+1:F]));
        end
        % Se suma 1 a itr por cada iteración
        itr = itr + 1;
    end

end
