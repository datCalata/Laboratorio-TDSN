% -------------------------------------------------------------------------
% TDSÑ-G33 Sesión 1
% Tests para el ejercicio P1.3
% -------------------------------------------------------------------------
%% Test 1
n0 = 0;
n = 0:3;
x = delta(n, n0);
assessVariableEqual('x', [1, 0, 0, 0]')
%% Test 2
n0 = 0;
n = -3:0;
x = delta(n, n0);
assessVariableEqual('x', [0, 0, 0, 1]')
%% Test 3
n0 = 0;
n = -3:3;
x = delta(n, n0);
assessVariableEqual('x', [0, 0, 0, 1, 0, 0, 0]')
%% Test 4
n0 = 2;
n = -3:3;
x = delta(n, n0);
assessVariableEqual('x', [0, 0, 0, 0, 0, 1, 0]')
%% Test 5
n0 = -2;
n = -3:3;
x = delta(n, n0);
assessVariableEqual('x', [0, 1, 0, 0, 0, 0, 0]')
%% OK
disp('Todos los tests correctos');