% решение краевой задачи методом стрельбы
function boundary
% Задание начальных условий
x     = zeros(4,1);
n     = 0;
ips   = 10^-1;
alpha = 2;
alpha_old = 1.8;
%Условие окончания процесса интегрирования
while abs(alpha-alpha_old)>ips
    x0    = [0 alpha];
    t0    = 0;
    tk    = 2.2;
    x1end = 1;

    % Интегрирование
    [t,x] = ode45(@task,[t0 tk],x0);
    x1 = x(length(x),1)
    x2 = x(length(x),2)
    x1endCalc = x1;
    x2endCalc = x2;
    alpha_old = alpha;
    alpha = alpha_old-(x1endCalc-x1end)/x2endCalc;
    n = n+1;
end

% Печать

h = figure(1);
hold on;
plot(t,x(:,1),'b',t,x(:,2),'g');
grid on;
title("Решение краевой задачи методом стрельбы")
set(gca,'fontsize',16); 

print(n)
print(alpha)

% Вычисление правых частей
end
function dx=task(t,x)

dx = [x(2); -x(1)*((exp(t)+exp(-t))/2)];
end

