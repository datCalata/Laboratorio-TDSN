function [ x ] = rexp( a, n, n0 )
%Calculo de un vector columna de una exp
%   a -> base
%   n -> eje de tiempos
%   n0 -> Desplazamiento
x = (a.^(n-n0))';


end

