function [y, Zf] = dfii(B, A, x, Zi)
    %DFII Filtro en forma directa II
    %   [y, Zf] = DFII(B, A, x, Zi) implementa un filtro en forma directa II 
    %   con estado inicial Zi.
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
    % ajuste de la longitud de coeficientes
    [B, A] = samelength(B, A);
    % normalización de coeficientes
    B = B./A(1);
    A = [1, -ones(1, length(A)-1)].*A./A(1);
    % bucle de filtrado
    for k = 1:length(x)
        % cálculo de la salida
        W = x(k) + sum(A(2:end).*Zi);
        y(k) = B(1)*W + sum(B(2:end).*Zi);
        % actualización de la memoria interna
        Zi(2:end) = Zi(1:end-1);
        Zi(1) = W;
    end
    % estado final
    Zf = Zi;


end

