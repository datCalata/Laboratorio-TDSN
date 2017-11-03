 %% Ejercicio P2.7
    % Comentario 1
    N = 257;
    n = -2:12;
    % Comentario 2
    x1 = step(n, 2) - step(n, 11);
    [X1, omega] = dtft(x1, -2, N);
    subplot(311)
    plot2(omega, abs(X1), '\omega', '|X_1(\omega)|', [-pi, pi, -0.5, 9.5]);
    % Comentario 3
    x2 = 0.25*delta(n, 0) + 0.5*delta(n, 1) + delta(n, 2);
    [X2, omega] = dtft(x2, -2, N);
    subplot(312)
    plot2(omega, abs(X2), '\omega', '|X_2(\omega)|', [-pi, pi, -0.5, 2]);
    % Comentario 4
    n0 = -4;
    Y = X1.*X2;
    [y, n2] = idtft(Y, n0, length(x1)+length(x2)-1);
    subplot(313)
    stem2(n2, y, 'n', 'y[n]=x_1[n]*x_2[n]',[n2(1)-.5 n2(end)+0.5 -.5 max(y)+.5])