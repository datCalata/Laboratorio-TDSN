%%ejercicio 1 practica 5
% parámetros
    Rp = 0.2;  % rizado en la banda de paso
    Rs = 65;   % atenuación mínima en la banda rechazada
    Wp = 1/4;  % frecuencia de corte normalizada
    Ws = 3/8;  % frecuencia de rechazo normalizada
    % orden del filtro
    Nf = ellipord(Wp, Ws, Rp, Rs);
    % diseño del filtro
    [B, A] = ellip(Nf, Rp, Rs, Wp);
    % respuesta en frecuencia
    N = 2000;
    [H, w] = freqz(B, A, N);
     % módulo
    mH = abs(H);          % unidades lineales
    mHdb = 20*log10(mH);  % decibelios
    fig('Módulo');
    subplot(211)
    plot2(w, mH, '\omega', '|H(\omega)|', [0, pi, -0.05, 1.05]);
    rp = 10^(-Rp/20)
    wc = 0.7854;
    ws = 1.167;
    L = -Rs/log2(ws/wc);
    hold on
    plot([0, wc, wc], [1, 1, rp], 'r--')
    plot([0, wc, ws, pi], [rp, rp, -rs, -rs], 'r--')
    hold off
    subplot(212)
    plot2(w, mHdb, '\omega', '20*log_{10}(|H(\omega)|)', [0, pi, -Rs-5, 5]);
    ylabel('dB')
    hold on
    plot([0, wc, wc], [1, 1, -Rp], 'r--')
    plot([0, wc, ws, pi], [-Rp, -Rp, -Rs, -Rs], 'r--')
    hold off
 %% EJERCICIO 2
    % fase
    pH = angle(H);
    fig('Fase')
    subplot(211)
    plot2(w, pH, '\omega', '\angle H(\omega)', [0, pi, -10, 4]);
    ylabel('rad')
    pause 
     % representación con 'unwrap'
    plot2(w, unwrap(pH), '\omega', '\angle H(\omega)', [0, pi, -10, 4]);
    pause
    
    % representación con 'unwrap2'
    plot2(w, unwrap2(H), '\omega', '\angle H(\omega)', [0, pi, -10, 4]);
    % retardo de grupo
    subplot(212)
    [tau, w] = grpdelay(B, A, N);
    plot2(w, tau, '\omega', 'retardo de grupo \tau_g(\omega)', [0, pi, 0, 30]);
    ylabel('muestras')
    
  %% Ejercicio 3
  
    % ganancia, polos, ceros
    K = B(1)/A(1);
    P = roots(A);
    Z = roots(B);
    
    % ganancia, polos, ceros
    [Z, P, K] = tf2zp(B, A);

    % diagrama de polos y ceros
    fig('Diagrama de polos y ceros');
    zplane(B, A)
    pause
    zplane(Z, P)
    
  %% Ejercicio 4 
    
      L0 = -5;         % índice inicial
    L1 = 40;         % índice final
    n = L0:L1;       % intervalo de índices
    u = step(n, 0);  % señal u[n] en el intervalo
    d = delta(n, 0); % señal delta[n] en el intervalo
    % descomposición en fracciones simples
    [R, P, K] = residuez(B, A);
    % cálculo de la transformada inversa en el intervalo
    h1 = K*d;
    for i = 1:length(P)
        h1 = h1 + (R(i)*P(i).^n).'.*u;
    end
    
        % representación de h[n] calculada con residuez
    subplot(311)
    stem2(n, h1, 'n', 'h[n] con residuez', [n(1)-0.5, n(end)+0.5, -0.15, 0.3]);
    
        % cálculo y representación de h[n] calculada con impz
    h2 = zeros(size(h1));
    h2(-L0+1:-L0+L1+1) = impz(B, A, L1+1);
    subplot(312)
    stem2(n, h2, 'n', 'h[n] con impz', [n(1)-0.5, n(end)+0.5, -0.15, 0.3]);
    
        % diferencia
    subplot(313)
    stem2(n, h1-h2, 'n', 'diferencia', [n(1)-0.5, n(end)+0.5, -1e-13, 1e-13]);
    
        format long
    h1(11)
    h2(11)