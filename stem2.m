function stem2( n, s, xl, t, axs )
    %STEM2 Dibuja la se�al s con marcadores negros y otros detalles.
    %   stem2(n, s, xl, t, axs) dibuja la se�al s definida en el intervalo n, titula
    %   la gr�fica con t y ajusta los ejes con a.
    %   Entradas:
    %       n - vector de �ndices temporales
    %       s - vector de se�al
    %       xl - etiqueta para el eje x
    %       t - t�tulo
    %       axs - vector de ajuste de ejes
        stem(n, s, 'k', 'MarkerfaceColor', 'k')
        xlabel(xl, 'Units', 'normalized', 'Position', [1.025, 0.15])
        title(t, 'FontSize', 10);
        axis(axs);
        grid;

end

