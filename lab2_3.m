%������� ������� ������ � ������� ����������� �������� MATLAB
function second
%��������� �������� ���������� t
tinit   = linspace(0.3,0.6,5);

%������ ��������� �����������
xinit   = [0 0.3];
solinit = bvpinit(tinit,xinit);
sol     = bvp4c(@solution,@border,solinit);

%������ �� 100 ������� ����� �� �������� ���������
tt = linspace(0.3,0.6);
xx = deval(sol,tt);

%���������� �������� 
h  = figure(2);
plot(tt,xx);
grid on;
title ("������� ������� ������ � ������� ����������� ��������");
set(gca,'fontsize',16); 
x1 = xx(1,100);
x2 = xx(2,100);
end

%���������� ������ ������
function dxdt = solution(t,x)
dxdt = [x(2); 3*exp(t)+2*x(2)];
end

%��������� �������
function res = border(xa,xb)
res = [xa(1)-1.415 xb(2)-8.6938];
end
