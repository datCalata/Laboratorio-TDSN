%% Apartado 1.1
n = -10:1:20;
d = double(n == 0);  
%Codigo para crear un escalón finito
%for k = 1:10
%    d = d + delta(n,k)
%end
stem(n,d)
title('tren de deltas')
xlabel('n')
axis([-10.5 20.5 -0.02 1.02])

%% Apartado 1.2
step = double(n >= 0);
figure(2)
stem(n,step,'MarkerFaceColor','r','MarkerEdgeColor','r')
title('Escalón unidad u[n]')
