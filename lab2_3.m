%решение краевой задачи с помощью стандартных процедур MATLAB
function second
%Начальные значения координаты t
tinit   = linspace(0.3,0.6,5);

%Вектор начальных приближений
xinit   = [0 0.3];
solinit = bvpinit(tinit,xinit);
sol     = bvp4c(@solution,@border,solinit);

%Вектор из 100 пробных точек на заданном интервале
tt = linspace(0.3,0.6);
xx = deval(sol,tt);

%Построение графиков 
h  = figure(2);
plot(tt,xx);
grid on;
title ("Решение краевой задачи с помощью стандартных процедур");
set(gca,'fontsize',16); 
x1 = xx(1,100);
x2 = xx(2,100);
end

%Вычисление правых частей
function dxdt = solution(t,x)
dxdt = [x(2); 3*exp(t)+2*x(2)];
end

%Граничные условия
function res = border(xa,xb)
res = [xa(1)-1.415 xb(2)-8.6938];
end
