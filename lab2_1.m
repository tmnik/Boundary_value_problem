% решение задачи выведения космического аппарата на круговую орбиту 
clc;clear all; close all;

%%
Vy0 = 0; %исходные данные
m0  = 46*1000;
mk  = 5*1000;
mp  = 150;
P   = 6500*1000;
g   = 9.81;

tk = (m0 - mk)/mp; %знаечние конечного времени 
x0 = [0; 0; 0; 0];
tspan   = 0:0.1:tk;
dxdt    = @(t,x)[(P/(m0-mp*t))*cos(atan((pi/2)*(1-2*t/tk)));(P/(m0-mp*t))*sin(atan((pi/2)*(1-2*t/tk)))-g;x(1);x(2)];% система уравнений
options = odeset('Events',@events1);
[t,x]   = ode45(dxdt,tspan,x0,options);


h = figure(1);
plot(t,x(:,1));
grid on;
title("Зависимость скорости по оси х от времени")

h = figure(2);
plot(t,x(:,2));
grid on;
title("Зависимость скорости по оси у от времени")


h = figure(3);
plot(t,x(:,3),'b');
grid on;
title("Зависимость координаты по оси х от времени")


h = figure(4);
plot(t,x(:,4),'b');
grid on;
title("Зависимость координаты по оси у от времени")


function [value1,value2,isterminal,direction1,direction2] = events1(t,x)
mu = 3.96802*10^(14);
value1 = x(2);
value2 = x(1)-sqrt(mu/sqrt(x(3)^2+x(4)^2));
isterminal = 1;
direction1 = -1;
direction2 = -1;
end