function [x, n] = idtft(X, n0, M)
%DTFT Calcula M puntos de la señal x con transformada de Fourier X
%   idtft(x) calcula numéricamente M puntos de la señal x con transformada
%   de Fourier X en el intervalo [n0 n0+M-1].
%   Entradas:
%       X  - vector columna de la transformada de Fourier de la señal
%       n0 - índice inicial de la señal
%       M  - número de puntos de la señal
%   Salida:
%       x - vector columna con la señal x
%       n - vector fila de índices de la señal x
    omega = linspace(-pi, pi, length(X))';
    n = n0:n0+M-1;
    XX = repmat(X, 1, length(n)).*exp(1j*omega*n);
    x = real(trapz(omega, XX))'/(2*pi);    
end
