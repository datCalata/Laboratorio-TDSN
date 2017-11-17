    B = [1, 0, -0.25];
    A = [2, -0.9*sqrt(2), 0.81];
    
    N = 50;
    n = 0:N-1;
    d = delta(n, 0);
    hf = filter(B, A, d);
    ht1 = sosdfii_v1(B, A, d);
    ht2 = sosdfii_v2(B, A, d);
    err1 = max(abs(hf-ht1));
    err2 = max(abs(hf-ht2));
    
    fprintf('Error en caso sosdfii_v1 = %3.5f\nError en caso sosdfii_v2 = %3.5f\n',err1,err2);
    
     Zi = [0, 0];
    [y, Zf] = ssodfii_v3(B, A, x, Zi);
%% Forma Discreta II

    N = 50;
    n = 0:N-1;
    d = delta(n, 0);
    [B, A] = ellip(8, 0.5, 60, 1/3)
    Zi = [0, 0, 0, 0, 0, 0, 0, 0];
    [hf, Zff] = filter(B, A, d, Zi);
    [ht, Zft] = dfii(B, A, d, Zi);
    fprintf('El error entre filter y dfii es %0.18f\n',max(abs(hf-ht)))
    
%% P6.6

    [B, A] = ellip(6, 0.5, 60, 1/4);

    load tds
    Tv = 12.5e-3;
    Lv = Tv*fs;
    
    nsegs = fix(length(tds)/Lv);
    tdsf = zeros(Lv*nsegs, 1);
    
    Z = zeros(1, 6);

    
    for k = 1:nsegs
        istart = 1+(k-1)*Lv;
        x = tds(istart+(0:Lv-1));
        [y, Z] = dfii(B, A, x, Z);
        tdsf(istart+(0:Lv-1)) = y;
    end
    
     n = 7250:7350;
     ax = [n(1), n(end), -2e4, 3e4];
     subplot(211)
     stem2(n, tds(n), 'n', 'Segmento de señal de entrada', ax);
     subplot(212)
     stem2(n, tdsf(n), 'n', 'Segmento de señal filtrada', ax);


     figure(2)
     plot2(0:length(tds)-1, tds, 'n', 'Señal vocal', [0, length(tds)-1, -30e3, 30e3])

     tdsb = buffer(tds, Lv, 0, 'nodelay');
     xm = buffer(x, 10, 4, 'nodelay');
%% P6.8

        % datos del ejercicio
    load tds;
    Lv = fix(60e-3*fs);
    Lsol = fix(0.75*Lv);
    % potencia total
    Px = (1/length(tds)) * sum(tds.^2);
    % segmentación de la señal
    xm = buffer(tds, Lv, Lsol, 'nodelay');
    % potencia localizada
    Ploc = (1/Lv) * sum(xm.^2);
    
        % representación
    subplot(211)
    n = 0:length(tds)-1;
    plot2(n, tds, 'n', 'Señal tds[n]', [n(1), n(end), -2e4, 3e4]);
    subplot(212)
    m = 0:length(Ploc)-1;
    stem2(m, Ploc, 'm', 'Señal potencia localizada', [0, size(xm, 2), 0, 7e7]);
    hold on
    plot([m(1), m(end)], [Px, Px], 'r')
    hold off
    