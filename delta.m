function x = delta(n, n0)
%DELTA Funci�n impulso unidad
    % x = delta(n, n0) calcula la se�al delta[n-n0] en el intervalo n dado.
    % Los par�metros de entrada son:
    %   n  - vector fila con los �ndices enteros en los que se calcula la se�al
    %   n0 - escalar entero que indica el retardo
    x = double(n == n0)';
end
