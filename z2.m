clear; clc; close all;

% Funkcija prenosa
num = [1 2];
den = [1 2 2];
G = tf(num, den);

% Odskočni odziv
t = linspace(0, 10, 10001);
[y, t] = step(G, t);
yss = dcgain(G);          % ustaljena vrednost

% Preskok
[ymax, idx] = max(y);
Mp = (ymax - yss) / yss * 100;        
                  

i10 = find(y >= 0.1*yss, 1, 'first');
i90 = find(y >= 0.9*yss, 1, 'first');
Tr = t(i90) - t(i10);


tol = 0.02 * yss;
idx_out = find(abs(y - yss) > tol, 1, 'last');
Ts = t(idx_out + 1);


fprintf('Ustaljena vrednost: %.4f\n', yss);
fprintf('Preskok:            %.2f %%\n', Mp);
fprintf('Vreme uspona:       %.4f s\n', Tr);
fprintf('Vreme smirenja:    %.4f s (2%%)\n', Ts);

