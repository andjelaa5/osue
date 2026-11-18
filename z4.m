clear; clc; close all;


G1 = tf(8.5,  [1 6 14.25 16.5 8.5]);
G2 = tf(2020, [1 44 569 1816 2020]);

t = linspace(0, 10, 10001);
Ga1=dominantni_pol(G1);
Ga2=dominantni_pol(G2);


figure;
plot(t,step(G1,t),'r--','LineWidth',1.3); hold on;
plot(t,step(Ga1,t),'b','LineWidth',1.5);
xlabel('time');
ylabel('amplitude');
grid on;

figure;
plot(t,step(G2,t),'r--','LineWidth',1.3); hold on;
plot(t,step(Ga2,t),'b','LineWidth',1.5);
xlabel('time');
ylabel('amplitude');
grid on;

function Ga=dominantni_pol(G)
    p=pole(G);
    [~,idx]=sort(real(p),'descend');
    pd=p(idx(1:2));
    den=real(poly(pd));
    Ga=tf(den(3),den);
end