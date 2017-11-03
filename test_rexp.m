% -------------------------------------------------------------------------
% TDSÑ-G33 Sesión 2
% Tests para el ejercicio P2.1
% -------------------------------------------------------------------------
%% Test 1
a = 0.5;
n0 = 0;
n = 0:3;
x = rexp(a, n, n0);
assessVariableEqual('x', [1, 1/2, 1/4, 1/8]')
%% Test 2
a = 0.5;
n0 = 0;
n = -3:0;
x = rexp(a, n, n0);
assessVariableEqual('x', [8, 4, 2, 1]')
%% Test 3
a = 0.5;
n0 = 0;
n = -3:3;
x = rexp(a, n, n0);
assessVariableEqual('x', [8, 4, 2, 1, 1/2, 1/4, 1/8]')
%% Test 4
a = 0.5;
n0 = 2;
n = -3:3;
x = rexp(a, n, n0);
assessVariableEqual('x', [32, 16, 8, 4, 2, 1, 1/2]')
%% Test 5
a = 0.5;
n0 = -2;
n = -3:3;
x = rexp(a, n, n0);
assessVariableEqual('x', [2, 1, 1/2, 1/4, 1/8, 1/16, 1/32]')
%% Test 6
a = -0.25;
n0 = -2;
n = -3:3;
x = rexp(a, n, n0);
assessVariableEqual('x', [-4, 1, -1/4, 1/16, -1/64, 1/256, -1/1024]')
%% OK
disp('Todos los tests correctos');