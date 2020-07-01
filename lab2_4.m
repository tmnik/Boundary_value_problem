% Найти минимум скалярной функции J(x) при заданных ограничениях 
clear all;


A  = [ 5 13 ; 15 7;-1 0;0 -1];
b  = [ 51; 107; 0; 0];
x0 = [ 0;0];
lb = ones(size(x0));
ub = ones(size(x0)) ;
[xt,fval] = fmincon('myfun1',x0,A,b)

function fun = myfun1(x)
fun =(x(1)).^2+(x(2)).^2-20*x(1)-30*x(2);
end
