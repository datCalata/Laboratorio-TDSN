    function s2 = p24(n, s, splot, xl, t1, t2, axs)
    %P24 Función auxiliar para el ejercicio P2.4
    %   s2 = p24(n, s, splot, xl, t1, t2, axs) calcula y devuelve el cuadrado
    %   de la señal s definida en el intervalo n. Además pinta la señal y su
    %   cuadrado en subplots sucesivos desde splot con títulos t1 y t2 y ejes
    %   ajustados con axs.
    %   Entradas:
    %       n - vector de índices
    %       s - vector de señal
    %       splot - primer valor de subgráfica
    %       xl - etiqueta para el eje x
    %       t1 - título de la primera subgráfica
    %       t2 - título de la segunda subgráfica
    %       axs - vector de ajuste de ejes
    %   Salidas:
    %       s2 - cuadrado de la señal s
        s2 = s.^2;
        subplot(splot)
        stem2(n, s, xl, t1, axs)
        subplot(splot+1)
        stem2(n, s2, xl, t2, axs)
    end

