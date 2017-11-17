function [y, Zf] = sosdfii_v3(B, A, x, Zi)
    %SSODFII_V3 Secci�n de segundo orden en forma directa II
    %   [y, Zf] = SSODFII_V3(B, A, x, Zi) implementa una secci�n de segundo 
    %   orden en forma directa II con estado inicial Zi.
    % Entradas:
    %   B   coeficientes del numerador de H(z)
    %   A   coeficientes del denominador de H(z)
    %   x   se�al de entrada
    %   Zi  estado inicial del filtro
    % Salidas:
    %   y   se�al de salida (filtrada) en columna
    %   Zf  estado final del filtro


    % reserva de memoria para la se�al filtrada
    y = zeros(length(x), 1);
    % normalizaci�n de coeficientes
    B = B./A(1);
    A = [1, -1, -1].*A./A(1);
    % estado inicial
    W1 = Zi(1);
    W2 = Zi(2);
    % bucle de filtrado
    for k = 1:length(x)
        % c�lculo de la salida
        W = x(k) + A(2)*W1 + A(3)*W2;
        y(k) = B(1)*W + B(2)*W1 + B(3)*W2;
        % actualizaci�n de la memoria interna
        W2 = W1;
        W1 = W;
    end
    % estado final
    Zf(1) = W1;
    Zf(2) = W2;
    
    % estado inicial
    % bucle de filtrado
    for k = 1:length(x)
        % c�lculo de la salida
        W = x(k) + A(2)*Zi(1) + A(3)*Zi(2);
        y(k) = B(1)*W + B(2)*Zi(1) + B(3)*Zi(2);
        % actualizaci�n de la memoria interna
        Zi(2) = Zi(1);
        Zi(1) = W;
    end
    % estado final
    Zf = Zi;
end

