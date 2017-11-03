%% p4.1 
Nx = 15;
    n = 0:Nx-1;
    x = cos(9*pi*n/10)' + cos(3*pi*n/4)';
    L = input('Factor de interpolación = ');
    xi = interp(x, L);
     Ni = length(xi);
    subplot 211
    stem2(n, x, 'n', 'x[n]', [-0.25, Nx, -2.3, 2.3]);
    subplot 212
    ni = 0:Ni-1;
    stem2(ni, xi, 'n', sprintf('x_i[n], L=%d', L), ...
        [-0.25*L, Nx*L, -2.3, 2.3]);
    hold on
    plot(ni(1:L:end), xi(1:L:end), 'om', 'MarkerSize', 10);
    hold off
    subplot
    
%% p4.2    
   Nx = 70;
    n = 0:Nx-1;
    x = cos(9*pi*n/100)' + cos(3*pi*n/40)';    
    M = input('Factor de diezmado = ');
      xd = decimate(x, M);
         Nd = length(xd);
    subplot 211
    stem2(n, x, 'n', 'x[n]', [-0.75, Nx-0.75, -2.3, 2.3]);
    hold on
    plot(n(1:M:end), x(1:M:end), 'om', 'MarkerSize', 10);
    hold off
    subplot 212
    stem2(0:Nd-1, xd, 'n', sprintf('x_d[n], M=%d', M), ...
        [-0.75/M, (Nx-0.75)/M, -2.3, 2.3]);
    subplot
    
    %% p4.3
     
    Xm = input('fondo de escala Xm = ');
    N = input('número de bits = ');
    x = linspace(-1.25*Xm, 1.25*Xm, 1000);
    [xq, delta] = quant(Xm, N, x);
    subplot 311
    plot2(x/delta, xq/delta, 'x/\Delta', 'x_q = Q(x)', ...
        [-1.25, 1.25, -1.25, 1.25]*Xm/delta);
    ylabel('xq/\Delta')
    
    subplot 312
    Ts = 0.25;
    Tmax = 6;
    f0 = 0.27;
    t = linspace(0, Tmax);
    n = (0:Ts:Tmax)/Ts;
    xc = cos(2*pi*f0*t - 0.025);
    xd = cos(2*pi*f0*n*Ts - 0.025);
    xq = quant(Xm, N, xd);
     Ym = Xm*(Xm >= 1) + (Xm < 1);
    plot2(t, xc, 'x', 'x(t), x[n] y x_q[n]', [-0.1, Tmax+0.1, -1.1*Ym, 1.1*Ym]);
    hold on
    stem(n*Ts, xd, 'k', 'MarkerfaceColor', 'k');
    stem(n*Ts, xq, 'm', 'MarkerfaceColor', 'm');
    hold off
    legend('x(t)', 'x[n]', 'x_q[n]')
    
    subplot 313
    e = xq - xd;
    stem2(n*Ts, e, 'n', 'e[n]', [-0.1, Tmax+0.1, 1.5*min(e), 1.5*max(e)]);
    
    
       %% p4.4
     load('tds.mat')
       L = length(tds);
    n = 0:L-1;
     N = input('Número de bits = ');
    [tdsq, delta] = quant(Xm, N, tds)
     e = tdsq - tds;
     ax1 = subplot(311)
    plot2(n, tdsq, 'n', 'tdsq[n]', [n(1), n(end), -Xm, Xm]);
    ax2 = subplot(312)
    plot2(n, e, 'n', 'e[n]', [n(1), n(end), -delta/2, delta/2]);
    
    linkaxes([ax1, ax2], 'x');
    
     subplot 313
    M = 30;
    [rtdsqe, m] = xcorr(tdsq, e, M, 'unbiased');
    stem2(m, rtdsqe, 'm', '\r_{tdsq,e}[0]',[m(1), m(end), min(rtdsqe), max(rtdsqe)]);
     linkaxes([ax1, ax2], 'off');
    
     %% p4.5
    subplot 311
    histogram(e, 'Normalization', 'pdf');
     hold on
    plot2([-delta/2, delta/2], [1/delta, 1/delta], 'e', ...
        'Histograma normalizado y p_e(e) teórica', ...
        [-delta/2, delta/2, 0, 1.1/delta]);
        hold off
      subplot 312
    M = 30;
    [ree, m] = xcorr(e, M, 'unbiased');
    stem2(m, ree, 'm', 'r_{ee}[m]', [m(1), m(end), min(ree), max(ree)]);
    subplot 313
    s2 = 10*log10(delta^2/12);
    [Pee, w] = pwelch(e, [], [], [], 'centered');
    mPee = 10*log10(2*pi*Pee);
    plot2(w, mPee, '\omega', 'Estimación de P_{ee}(\omega) y valor teórico', ...
        [-pi, pi, 0, 1.25*s2]);
    ylabel('dB')
    hold on
    plot([w(1) w(end)], [s2, s2], 'r')
    hold off