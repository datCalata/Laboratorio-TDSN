n = -5:20
s2 = cexp(3*pi/8,n,8)

% Gráfica
subplot(2, 1, 1)
stem(n, real(s2), 'k', 'MarkerFaceColor', 'k')
title('Exponencial compleja, parte real \Re\{e^{j\pin/8}}\}')
xlabel('n')
axis([-5.5 20.5 -1.1 1.1])
subplot(2, 1, 2)
stem(n, imag(s2), 'k', 'MarkerFaceColor', 'k')
title('Exponencial compleja, parte imaginaria \Im\{{e^{j\pin/8}}\}')
xlabel('n')
axis([-5.5 20.5 -1.1 1.1])
subplot