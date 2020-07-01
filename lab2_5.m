% Для заданного объекта управления решить задачу оптимизации, используя любую из стандартных процедур оптимизации из Optimization Toolbox
clc;clear all;close all;

k   = 70;
psi = 0.15;
T   = 0.3;

s   = tf('s');
num = k;
det = [T^2 2*psi*T 1];
W   = tf(num,det);

Pss = ss(W);

[A,B,C,D] = ssdata(Pss);

echo off


K0     = -1; % Задание начальных условий

goal   = [-0.52; -0.52]; % Задание вектора целей

weight = abs(goal); % Задание вектора весовых коэффициентов

lb     = -0.5*ones(size(K0)); % Нижние границы элементов матрицы К

ub     = 0.5*ones(size(K0)); % Верхние границы элементов матрицы К

% Установка опции вывода информации

options = optimset('Display', 'iter','GoalsExactAchieve',2);

eigfun  = @(K) sort(eig(A+B*K*C));

[K,fval,attainfactor,exitflag,output,lambda] = fgoalattain(eigfun,K0,goal,weight,[ ],[ ],[ ],[ ],lb,ub,[ ],options);

options = optimset('Display', 'iter','GoalsExactAchieve',2);

eigfun(K);
attainfactor

x0 = [1;1];

[Times,xvals] = ode45(@(u,x)((A+B*K*C)*x),[0,20],x0);
xvals

h = figure(1);
plot(Times,xvals);
legend('x_1(t)','x_2(t)','Location','best');
xlabel('t');
ylabel('x(t)');
grid on;
K2 = [K 0]
h = figure(2);
Wpr = reg(Pss,K2,[0;1])
step(Wpr);
grid on;