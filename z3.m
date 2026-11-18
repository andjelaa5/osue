clear; clc; close all;

num = [-1 1];
den = [1 2 0];
W = tf(num, den);

t = linspace(0, 15, 15001);
Gc1=feedback(W,1);
Ge=feedback(1,W);

y= step(Gc1, t);
e= step(Ge, t);

figure;
plot(t,y,'b','LineWidth',1.3); hold on;
xlabel('time');
ylabel('amplitude');
grid on;

figure;
plot(t,e,'r','LineWidth',1.3); 
xlabel('time');
ylabel('amplitude');
grid on;