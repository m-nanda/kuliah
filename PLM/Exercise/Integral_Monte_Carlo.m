%Program for calculating integrals with the Monte Carlo Method

%---------------------------------------------------------------------------
%Description:
%The Stochastic method is used to solve a purely deterministic problem.
%This procedure is often called the Monte Carlo Method. This requires 
%nothing more than generating random numbers that are uniformly distributed.
%This method is only precise enough if the value of N is large enough.

%Detail:
%The input is the integral limit for a, b> = 0. If b> a, then the values of 
%a and b are exchanged. The function that can be used as input is function 
%of one variable (x). The output is a 2D graphic visualization.
%---------------------------------------------------------------------------

%Initial Input
clear all; clc; close all;
a = input('Enter lower bound (a): ');
b = input('Enter upper bound (b): ');
if a>b
    temp=a;
    a=b;
    b=temp;
end
a;
interval = b-a;
x = a;
N = input('Enter N:');
f_i = input('Enter your one variable function of x:', 's');

%Find f_max and f_min
f_max = subs(str2sym(f_i));
f_min = f_max;
x_min = a;
x_max = a;
for n=a:0.01:b
    x=n;
    temp = subs(str2sym(f_i));
    if temp > f_max
        f_max = temp;
        x_max = n;
    end
    if temp < f_min
        f_min = temp;
        x_min = n;
    end
end

%Monte Carlo Process
U_x = [];
U_y = [];
K = 0;
for j=1:N    
    Ux = a+(b-a)*rand();
    Uy = (f_max-0)*rand();    
    x = Ux;
    f_Ux = subs(str2sym(f_i));
    if Uy <= f_Ux
        K = K+1;
        U_x(end+1) = Ux;
        U_y(end+1) = Uy;
    end    
end
FRACT = K/N;
I = FRACT * (b-a)*f_max;

%Plot the result
f_u = [];
t=1;
for u=a:0.01:b
    x=u;
    f_u(t) = subs(str2sym(f_i));
    t=t+1;
end
u=a:0.01:b;
figure('position', [0, 0, 750, 500]);
plot(u, f_u, 'r');
area(u, f_u);
title(['Plot of f(x)=', f_i], fontsize=15)
if a<=1
    xticks([a (a+b)/2 b])
    xticklabels({strcat('a=',num2str(a)) num2str((a+b)/2) strcat('b=',num2str(b))})
else
    xticks([0 a (a+b)/2 b])
    xticklabels({'0', strcat('a=',num2str(a)) num2str((a+b)/2) strcat('b=',num2str(b))})
end
y_text = double(f_max*1.1);
xlim([0, double(b+0.2*interval)]);
ylim([0, double((1.25*f_max))]);
text(a, y_text, ['For N=', num2str(N), ', I≈', num2str(double(I), '%.2f')], color='r', fontweight='bold', fontsize=12);
text(x_min, f_min, num2str(double(f_min)),"FontWeight","bold", color='r', fontsize=12);
text(x_max, f_max, num2str(double(f_max)),"FontWeight","bold", color='r', fontsize=12);
hold on;
plot([0,x_min], [f_min,f_min], 'k--');
scatter([0,x_min], [f_min,f_min], 'r.');
plot([0,x_max], [f_max,f_max], 'k--');
scatter([0,x_max], [f_min,f_max], 'r.')
scatter(U_x, U_y, 'k.');
