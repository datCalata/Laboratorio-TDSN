%1.1
n = -10:20;
d= double(n==0);% El == compara dos valores y si son el mismo es 1 (true) y si son distintos 
% es 0 (false). Luego double convierte los valores vector en reales.
stem(n,d)
title('Impulso unidad \delta[n]')
xlabel('n')
axis([-10 20  -0.1 1.1])

%1.2
u= double(n>=0);
stem(n,u)
title('Escalon unidad u[n]')
xlabel('n')
axis([-10 20  -0.1 1.1])

%1.3
omega0 =2*pi/11;
x = cos(omega0*n);
stem(n,x)
title('cos(\omega_0n)') %el simbolo / es para poner simbolos predeterminados
xlabel('n')

%1.4
plot(n ,x, 'Marker', 'o', 'Markerfacecolor', 'k')
title('cos(\omega_0n)')
grid
%La diferencia entre plot y stem, es que la primera dibuja en continuo y la
%segunda en discreto.


%1.5

alpha = 0.1;
omega0 = 2*pi/11;
x = exp(-alpha*n).*cos(omega0*n);
plot(n ,x, 'Marker', 'o', 'Markerfacecolor', 'r')
title('e^{-\alphan}cos(\omega_0n)')%^ es para indicar superindices mientras que _ para subíndices
grid
n = 0:9;
%n*n da error por que no puedes multiplicar matrices iguales a no ser que
%sean cuadradas
n.*n % el punto hace que multiplique elemento a elemento.
n.^2
m = n' %la traspuesta
a = [1, 2, 3] % vector fila (1x3)
b = [1; 2; 3] % vector columna (3x1)


%1.6
L = 100;
b = 2;
a = 1; 
x = a + (b-a)*rand(L, 1)
%señal aleatoria con distribución uniforme en el intervalo [?1, 2] de duración L = 100

%1.7
mu = 1;
sigma = 2;
x = mu + sigma*randn(L, 1);
%señal aleatoria con distribución gaussiana de media µ = 1 y desviación típica ? = 2 de
%duracion L = 100.

plot(x, 'Marker', 'o', 'Markerfacecolor', 'r')
title('gaussiana')
grid

%1.8 
n = -20 : 20;
omega0 = 2*pi/7;
x = sin(omega0.*n)/omega0.*n;
x(n == 0) = 1; % asignamos en n = 0 el valor 1
stem (n,x)
title('indeterminacion')
xlabel('n')

%1.9
n = -5 : 25;
h = 0.85.^n.*u; % si  no ponemos el punto despues de 0.85 piensa que es una multiplicacion de matrices 
% no se puede elvar un numero a una matriz. La u ya fue creada
stem (n,h)
title('respuesta al impulso')

%1.10 
n = 0 : 19;
L = 20;
N = 30;
m = 0 : 30;
%x = heaviside(5) - heaviside(10);
z = double(n >= 5);
c = double(n >= 10);
x = z-c; 
h = 0.85.^m.*u;
y = conv(x, h);
d=0:N+L-1;
stem(d,y)

%1.11
p = [0, 0, 0, 0];
for n = 0:3
for k = 0:3
p(n+1) = p(n+1) + exp(1j*2*pi*k*n/4);
end
p(n+1) = p(n+1)/4;
end


