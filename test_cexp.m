% -------------------------------------------------------------------------
% TDSÑ-G33 Sesión 2
% Tests para el ejercicio P2.2
% -------------------------------------------------------------------------
%% Test 1
w0 = pi/2;
n0 = 0;
n = 0:3;
x = cexp(w0, n, n0);
assessVariableEqual('x', [1; 1j; -1; -1j])
%% Test 2
w0 = pi/2;
n0 = 0;
n = -3:0;
x = cexp(w0, n, n0);
assessVariableEqual('x', [1j; -1; -1j; 1])
%% Test 3
w0 = pi/2;
n0 = 0;
n = -3:3;
x = cexp(w0, n, n0);
assessVariableEqual('x', [1j; -1; -1j; 1; 1j; -1; -1j])
%% Test 4
w0 = pi/2;
n0 = 2;
n = -3:3;
x = cexp(w0, n, n0);
assessVariableEqual('x', [-1j; 1; 1j; -1; -1j; 1; 1j])
%% Test 5
w0 = pi/2;
n0 = -2;
n = -3:3;
x = cexp(w0, n, n0);
assessVariableEqual('x', [-1j; 1; 1j; -1; -1j; 1; 1j])
%% Test 6
w0 = pi/4;
n0 = -2;
n = -3:3;
x = cexp(w0, n, n0);
assessVariableEqual('x', (cos(w0*(n-n0))+1j*sin(w0*(n-n0))).')
%% OK
disp('Todos los tests correctos');