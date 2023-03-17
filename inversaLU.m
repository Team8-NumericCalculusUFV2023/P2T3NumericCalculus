function invA = inversaLU(A)
    % Calculo de la inversa de la matriz A mediante la descomposición LU.
    % Esta función llama a su vez a las funciones 
    % LUcrout, sustitución adelante (SubsAdel) y atrás (SubsAtras)
    % INPUTS:
    %   A = matriz cuadrada
    % OUTPUTS:
    %   invA = matriz inversa de A
        [F, ~] = size(A);
        [L, U] = LUcrout(A);
        % Inicialización de variables
        B = eye(F);             % LUx = I 
        
        y = zeros(F);       % Ly = I (tomando y = Ux)
        invA = zeros(F);        
        for i = 1:F
            % Sustitución hacia adelante en la L
            y(:,i) = SubsAdel(L, B(:,i));
            % Sustitución hacia atras en la U
            invA(:,i) = SubsAtras(U,y(:,i));
        end
end
