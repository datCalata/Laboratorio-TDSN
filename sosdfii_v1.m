function [ y ] = sosdfii_v1( B,A,x )
    %SSODFII_V1 Sección de segundo orden en forma directa II
    %   [y] = SSO(B, A, x, ci) implementa una sección de segundo orden en
    %   forma directa II.
    % Entradas:
    %   B   coeficientes normalizados del numerador de H(z)
    %   A   coeficientes normalizados (y negativos) del denominador de H(z)
    %   x   señal de entrada
    % Salidas:
    %   y   señal de salida (filtrada) en columna
    % reserva de memoria para la señal filtrada
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

