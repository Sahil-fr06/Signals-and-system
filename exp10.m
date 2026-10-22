%% EXPERIMENT 10
%% TRANSFORM TECHNIQUES AND SYSTEM REPRESENTATION

clc;
clear;
close all;

%% ==========================================================
%% OBJECTIVE 1 : Pole-Zero Plot
%% ==========================================================

figure('Name','Experiment 10.1 : Pole-Zero Plot');

subplot(2,1,1)

b = [1 -0.5];
a = [1 -1.5 0.7];

zplane(b,a)
grid on
title('Pole-Zero Plot')

subplot(2,1,2)

b2 = [1 1];
a2 = [1 -0.2 0.36];

zplane(b2,a2)
grid on
title('Pole-Zero Plot')

%% ==========================================================
%% OBJECTIVE 2 : Z-Transform and Inverse Z-Transform
%% ==========================================================

syms n z

x = (0.5)^n;

X = ztrans(x,n,z);

disp('========================================')
disp('OBJECTIVE 2')
disp('Z-Transform X(z) = ')
disp(X)

x_inv = iztrans(X,z,n);

disp('Inverse Z-Transform x(n) = ')
disp(x_inv)

n1 = -20:20;

x1 = 2*(0.9).^n1;

figure('Name','Experiment 10.2')

stem(n1,x1,'filled','LineWidth',1.3)

grid on

title('Real Exponential Signal')

xlabel('n')

ylabel('x[n]')

axis([-20 20 0 20])

%% ==========================================================
%% OBJECTIVE 3 : Z-Transform of Given Signal
%% ==========================================================

syms n z

x = (0.8)^n;

X = ztrans(x,n,z);

disp('========================================')
disp('OBJECTIVE 3')
disp('Z-Transform X(z) = ')
disp(X)

n2 = -5:10;

x2 = zeros(size(n2));

x2(n2>=0) = (0.5).^n2(n2>=0);

figure('Name','Experiment 10.3')

stem(n2,x2,'filled','LineWidth',1.5)

grid on

title('x[n]')

xlabel('n')

ylabel('Amplitude')

axis([-5 10 0 1.1])

%% ==========================================================
%% OBJECTIVE 4 : Laplace Transform
%% ==========================================================

syms t s

x = exp(-2*t);

X = laplace(x,t,s);

disp('========================================')
disp('OBJECTIVE 4')
disp('Laplace Transform X(s) = ')
disp(X)

t1 = 0:0.01:5;

y = 5*exp(-t1);

figure('Name','Experiment 10.4')

plot(t1,y,'LineWidth',2)

grid on

title('Exponential Decay Over Time')

xlabel('Time')

ylabel('y(t)')

legend('y(t)')

axis([0 5 0 5.2])

disp('========================================')
disp('Experiment 10 Completed Successfully')
disp('========================================')