clear; clc; close all;

num = [1];
den = [1 2 0];
G = tf(num, den);


t = linspace(0, 30, 30001);
u=zeros(size(t));
u(t>=5 & t<10)=1;
u(t>=15 & t<20)=-2;
u(t>=20 & t<25)=1;
y=lsim(G,u,t);

plot(t,u,'r--','LineWidth',1.3); hold on;
plot(t,y,'b','LineWidth',1.5);
xlabel('time');
ylabel('amplitude');
grid on;