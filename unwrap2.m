% UNWRAP2 Desenrrolla la respuesta en fase.
% UNWRAP2(H) desenrrolla la fase de la respuesta en frecuencia H según el
% algoritmo descrito por Kattoush Abbas en el artículo A New Recurrent
% Approach for Phase Unwrapping publicado en el International Journal of
% Applied Science and Engineering, 2005
function phi = unwrap2(H)
H = H(:);
N = length(H);
phi = zeros(N, 1);
phi(1) = atan2(imag(H(1)), real(H(1)));
for k = 2:N
    y = imag(H(k-1))/real(H(k-1));
    x = imag(H(k))/real(H(k));
    dphi = 0;
    if x*y == -1 
        if x > y
            dphi = pi/2;
        elseif x < y
            dphi = -pi/2;
        end
    else
        dphi = atan2((x-y), (1 + x*y));
        if x*y < -1
            if x > 0
                dphi = dphi - pi;
            elseif x < 0
                dphi = dphi + pi;
            end
        end
    end
    phi(k) = phi(k-1) + dphi;
end
