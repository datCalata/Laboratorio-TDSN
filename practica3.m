fs = 5000;    % frecuencia de muestreo (en Hz)
Ts = 1/fs;    % periodo de muestreo (en s)
t0 = -1e-3;   % tiempo inicial (en s)
t1 = 4e-4;    % tiempo final (en s)

N = (t1-t0)*fs;
n0 = t0*fs;
n = n0:n0+N-1;



axn = [n(1)-0.5, n(end)+0.5, -1.2, 1.2];
subplot(211)
f0 = 1575;
x1 = cos(2*pi*f0*n*Ts)';
stem2(n, x1, 'n', sprintf('cos(2\\pi%dn/%d)', f0, fs), axn)
subplot(212)
f1 = 3425;
x2 = cos(2*pi*3425*n*Ts)';
stem2(n, x2, 'n', sprintf('cos(2\\pi%dn/%d)', f1, fs), axn)

figure(2)
stem(n, abs(x1-x2))
max(abs(x1-x2))

%% 3.2

    t = linspace(t0-Ts, t1+Ts, 1000);
    subplot(211)
    stem2(n, x1, 'n', sprintf('cos(2\\pi%dn/%d)', f0, fs), axn)
    hold on
    plot(t/Ts, cos(2*pi*f0*t), '-.b')
    hold off
    
    subplot(212)
    stem2(n, x2, 'n', sprintf('cos(2\\pi%dn/%d)', f1, fs), axn)
    hold on
    plot(t/Ts, cos(2*pi*f1*t), '-.b')
    hold off
    
   %% 3.3
fs = 5000;    % frecuencia de muestreo (en Hz)
Ts = 1/fs;    % periodo de muestreo (en s)
t0 = -1e-3;   % tiempo inicial (en s)
t1 = 4e-4;    % tiempo final (en s)

N = (t1-t0)*fs;
n0 = t0*fs;
n = n0:n0+N-1;



axn = [n(1)-0.5, n(end)+0.5, -1.2, 1.2];
subplot(211)
f0 = 1575;
x1 = sin(2*pi*f0*n*Ts)';
stem2(n, x1, 'n', sprintf('sin(2\\pi%dn/%d)', f0, fs), axn)
subplot(212)
f1 = 3425;
x2 = sin(2*pi*f1*n*Ts)';
stem2(n, x2, 'n', sprintf('sin(2\\pi%dn/%d)', f1, fs), axn)

figure(2)
stem(n, abs(x1-x2))
max(abs(x1-x2))

t = linspace(t0-Ts, t1+Ts, 1000);
subplot(211)
stem2(n, x1, 'n', sprintf('sin(2\\pi%dn/%d)', f0, fs), axn)
hold on
plot(t/Ts, sin(2*pi*f0*t), '-.b')
hold off

subplot(212)
stem2(n, x2, 'n', sprintf('sin(2\\pi%dn/%d)', f1, fs), axn)
hold on
plot(t/Ts, sin(2*pi*f1*t), '-.b')
hold off

%% 3.4
clc
Ts = 1e-4;
fs = 1/Ts;    % frecuencia de muestreo (en Hz)
t0 = 0;   % tiempo inicial (en s)
t1 = 5e-3;    % tiempo final (en s)

N = (t1-t0)*fs;
n0 = t0*fs;
n = n0:n0+N-1;



axn = [n(1)-0.5, n(end)+0.5, -1.2, 1.2];
subplot(211)
f0 = 1575;
x1 = cos(2*pi*f0*n*Ts)';

%% 3.5
Ts = 1e-4
fs = 1/(Ts)
f0 = 1725    
t0 = 0
t1 = 5e-3
N = (t1-t0)*fs;
n0 = t0*fs;
n = n0:n0+N-1;
x = cos(2*pi*f0*n*Ts)';


t = linspace(-1e-3, 9e-3, 1000);

[tt, nn] = ndgrid(t, n);


Tr1 = 1e-4;                          % 1/fr1
subplot 311
x1 = sinc((tt - nn*Tr1)/Tr1)*x;
f1 = (f0/fs)/Tr1;                    % frecuencia de la señal reconstruida
axt = [t(1), t(end), -1.2, 1.2];
stem2(n*Tr1, x, 't', ['cos(2\pi' num2str(f1) 't)'], axt)
hold on, plot(t, x1, 'b'), hold off

%% 3.6
clear
clc

N1 = 256;
n1 = -N1:N1;
x = sinc(n1/8)'.^2;

[X, om] = dtft(x, n1(1), 512);

N2 = 15;
n2 = -N2:N2;
axn = [-N2-0.5, N2+0.5, -0.2, 1.2];   % ajuste de ejes "temporales"
axw = [-pi, pi, -0.2, 8.2];           % ajuste de ejes frecuenciales

N0 = 1 + N1;
n3 = N0 + n2;

subplot 321
stem2(n2, x(n3), 'n', ['x[n], |n|<' num2str(N2+1)], axn);
subplot 322
plot2(om, abs(X), '\omega', '|X(\omega)|', axw);

L = 3;
xe = zeros(length(x)*L, 1);

xe(1:L:end) = x;

N0e = 1 + N1*L;

n3 = N0e + n2;

[Xe, om] = dtft(xe, n1(1), 512);

subplot 323
stem2(n2, xe(n3), 'n', sprintf('x_e[n], |n|<%d', N2+1), axn);
subplot 324
plot2(om, abs(Xe), '\omega', '|X_e(\omega)|', axw);

M = 4;
xc = x(1:M:end);
Ni = 1 + mod(-N1, M);
xc = x(Ni:M:end);
N0c = ceil(1 + N0/M);
n4 = N0c + n2;
[Xc, om] = dtft(xc, n1(1), 512);
subplot 325
stem2(n2, xc(n4), 'n', ['x[n], |n|<' num2str(N2+1)], axn);
subplot 326
plot2(om, abs(Xc), '\omega', '|X_c(\omega)|', axw);