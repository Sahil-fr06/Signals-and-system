%% SIGNALS AND SYSTEMS EXPERIMENTS
clc;
clear;
close all;

%% ==========================================================
%% 1. Periodic and Aperiodic Signals
%% ==========================================================

% Periodic Signal
t1 = 0:0.001:8;
A = 2;
f = 0.25;

x1 = A*sin(2*pi*f*t1);

% Aperiodic Signal
t2 = 0:0.001:5;
f2 = 1;

x2 = exp(-0.1*t2).*sin(2*pi*f2*t2 + pi/6);

figure;

subplot(1,2,1)
plot(t1,x1,'g','LineWidth',1.5);
grid on;
axis([0 8 -2.5 2.5]);
title('Periodic Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(1,2,2)
plot(t2,x2,'b','LineWidth',1.5);
grid on;
axis([0 5 -1.5 1]);
title('Aperiodic Signal');
xlabel('Time (ms)');
ylabel('x(t)');

%% ==========================================================
%% 2. Even and Odd Signal Decomposition
%% ==========================================================

t = -1:0.001:1;

% Original Signal
x = 0.3 + sin(4*pi*t) + exp(-2*t.^2).*cos(2*pi*t);

% Time-Reversed Signal
x_rev = 0.3 + sin(-4*pi*t) + exp(-2*t.^2).*cos(2*pi*t);

% Even Part
xe = (x + x_rev)/2;

% Odd Part
xo = (x - x_rev)/2;

figure;

plot(t,x,'k','LineWidth',1.5);
hold on;
plot(t,xe,'b--','LineWidth',1.5);
plot(t,xo,'r:','LineWidth',1.5);

grid on;
axis([-1 1 -1 1.2]);

title('Even-Odd Decomposition');
xlabel('t');
ylabel('Amplitude');
legend('x(t)','Even Part','Odd Part','Location','northeast');

%% ==========================================================
%% 3. Time Shifting and Time Reversal
%% ==========================================================

t = 0:0.001:5;

% Original Signal
x = sin(2*pi*t);

% Delayed Signal
delay = 0.25;
x_delay = sin(2*pi*(t-delay));

% Time-Reversed Signal
t_rev = -5:0.001:0;
x_reverse = sin(2*pi*(-t_rev));

figure;

subplot(1,2,1)
plot(t,x,'b','LineWidth',1.5);
hold on;
plot(t,x_delay,'r','LineWidth',1.5);

grid on;
axis([0 5 -1.2 1.2]);

title('Time Shift (Delay)');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Original Signal','Delayed Signal','Location','best');

subplot(1,2,2)
plot(t_rev,x_reverse,'m','LineWidth',1.5);

grid on;
axis([-5 0 -1.2 1.2]);

title('Time Reversed Signal');
xlabel('Time (s)');
ylabel('Amplitude');