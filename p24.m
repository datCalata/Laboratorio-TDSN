    function s2 = p24(n, s, splot, xl, t1, t2, axs)
    %P24 Funci�n auxiliar para el ejercicio P2.4
    %   s2 = p24(n, s, splot, xl, t1, t2, axs) calcula y devuelve el cuadrado
    %   de la se�al s definida en el intervalo n. Adem�s pinta la se�al y su
    %   cuadrado en subplots sucesivos desde splot con t�tulos t1 y t2 y ejes
    %   ajustados con axs.
    %   Entradas:
    %       n - vector de �ndices
    %       s - vector de se�al
    %       splot - primer valor de subgr�fica
    %       xl - etiqueta para el eje x
    %       t1 - t�tulo de la primera subgr�fica
    %       t2 - t�tulo de la segunda subgr�fica
    %       axs - vector de ajuste de ejes
    %   Salidas:
    %       s2 - cuadrado de la se�al s
        s2 = s.^2;
        subplot(splot)
        stem2(n, s, xl, t1, axs)
        subplot(splot+1)
        stem2(n, s2, xl, t2, axs)
    end

