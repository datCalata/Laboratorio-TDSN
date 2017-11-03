function [ x ] = cexp( w0, n, n0 )
%Calculo de un vector columna de una exponencial compleja
%  wo-> frecuencia de la señal
%  n-> vector de tiempos
% n0-> desplazamiento
x= transpose(exp(1j*w0*(n-n0)));

end

