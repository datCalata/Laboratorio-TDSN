function [y, Zf] = sosdfii_v3(B, A, x, Zi)
    %SSODFII_V3 Sección de segundo orden en forma directa II
    %   [y, Zf] = SSODFII_V3(B, A, x, Zi) implementa una sección de segundo 
    %   orden en forma directa II con estado inicial Zi.
    % Entradas:
    %   B   coeficientes del numerador de H(z)
    %   A   coeficientes del denominador de H(z)
    %   x   señal de entrada
    %   Zi  estado inicial del filtro
    % Salidas:
    %   y   señal de salida (filtrada) en columna
    %   Zf  estado final del filtro


    % reserva de memoria para la señal filtrada
    y = zeros(length(x), 1);
    % normalización de coeficientes
    B = B./A(1);
    A = [1, -1, -1].*A./A(1);
    % estado inicial
    W1 = Zi(1);
    W2 = Zi(2);
    % bucle de filtrado
    for k = 1:length(x)
        % cálculo de la salida
        W = x(k) + A(2)*W1 + A(3)*W2;
        y(k) = B(1)*W + B(2)*W1 + B(3)*W2;
        % actualización de la memoria interna
        W2 = W1;
        W1 = W;
    end
    % estado final
    Zf(1) = W1;
    Zf(2) = W2;
    
    % estado inicial
    % bucle de filtrado
    for k = 1:length(x)
        % cálculo de la salida
        W = x(k) + A(2)*Zi(1) + A(3)*Zi(2);
        y(k) = B(1)*W + B(2)*Zi(1) + B(3)*Zi(2);
        % actualización de la memoria interna
        Zi(2) = Zi(1);
        Zi(1) = W;
    end
    % estado final
    Zf = Zi;
end

