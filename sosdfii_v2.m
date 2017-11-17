function [ y ] = sosdfii_v2( B,A,x )
    % Entradas:
    %   B   coeficientes del numerador de H(z)
    %   A   coeficientes del denominador de H(z)
    ...
    % normalización de coeficientes
    B = B./A(1);
    A = [1, -1, -1].*A./A(1);
    
    y = zeros(length(x), 1);
    % inicialización de la memoria interna
    W1 = 0;
    W2 = 0;
    % bucle de cálculo
    for k = 1:length(x)
        % cálculo de la salida
        W = x(k) + A(2)*W1 + A(3)*W2;
        y(k) = B(1)*W + B(2)*W1 + B(3)*W2;
        % actualización de la memoria interna
        W2 = W1;
        W1 = W;
    end

end

