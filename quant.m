function [xq, delta] = quant(Xm, N, x)
    %QUANT Cuantifica la se�al x[n]
    %   xq = QUANT(Xm, N, x) cuantifica los valores del vector x con un
    %   cuantificador uniforme de amplitud m�xima Xm y N bits.
    %   Entradas: 
    %       Xm - Valor a fondo de escala
    %       N  - N�mero de bits
    %       x  - se�al a cuantificar
    %   [xq, delta] = QUANT(...) devuelve adem�s el paso de cuantificaci�n.
    % Paso de cuantificaci�n
    delta = 2*Xm/2^N;
    % Cuantificaci�n
    xq = delta*round(x/delta);
    % Saturaci�n
    xqmax = Xm*(1-2^(-N+1)); 
    xq(x >= xqmax) = xqmax;
    xqmin = -Xm;
    xq(x <= xqmin) = xqmin;
    