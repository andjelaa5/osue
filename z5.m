close all; clear; clc;

s=tf('s');
W = 1e4 / ((s + 0.1)*(s + 1)*(s^2 + 200*s + 10025));

[Gm,Pm,W1,W2]=margin(W);
fprintf('Prekoracenje ampl: %.4f\n',20*log10(Gm));
fprintf('Prekoracnje faze:            %.2f %\n', Pm);


figure;
bode(W);
grid on;

figure;
margin(W);grid on;