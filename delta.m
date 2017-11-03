function x = delta(n, n0)
%DELTA Función impulso unidad
    % x = delta(n, n0) calcula la señal delta[n-n0] en el intervalo n dado.
    % Los parámetros de entrada son:
    %   n  - vector fila con los índices enteros en los que se calcula la señal
    %   n0 - escalar entero que indica el retardo
    x = double(n == n0)';
end
