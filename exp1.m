%% Generation of Different Signals
clc;
clear;
close all;

%% ==========================================================
%% 1. Continuous-Time Sinusoidal Signal
%% ==========================================================

t = 0:0.001:1;      % Time axis
A = 2;              % Amplitude
f = 5;              % Frequency (Hz)

x = A*sin(2*pi*f*t);

figure;
plot(t,x,'b','LineWidth',1);
grid on;
axis([0 1 -2 2]);
title('Continuous Time Sinusoidal Signal');
xlabel('Time (s)');
ylabel('Amplitude');

%% ==========================================================
%% 2. Discrete-Time Sinusoidal Signal
%% ==========================================================

n = -1:0.1:1;

xd = sin(pi*n);

figure;
stem(n,xd,'filled','LineWidth',1);
grid on;
axis([-1 1 -1 1]);
title('Discrete Time Sinusoidal Signal');
xlabel('Sample Index (n)');
ylabel('Amplitude');

%% ==========================================================
%% 3. Sawtooth and Triangular Signals
%% ==========================================================

% Sawtooth Signal
t1 = 0:0.001:1;
f1 = 3;
x1 = mod(f1*t1,1);

% Triangular Signal
t2 = 0:0.01:20;
f2 = 0.5;
x2 = sawtooth(2*pi*f2*t2,0.5);

figure;

% Sawtooth
subplot(1,2,1)
plot(t1,x1,'r','LineWidth',1);
grid on;
axis([0 1 0 1]);
title('Sawtooth');
xlabel('Time (sec)');
ylabel('Amplitude');

% Triangular
subplot(1,2,2)
plot(t2,x2,'b','LineWidth',1);
grid on;
axis([0 20 -1 1]);
title('Triangular Waveform');
xlabel('Time Index');
ylabel('Amplitude');

%% ==========================================================
%% 4. Continuous Unit Step, Ramp and Discrete Ramp
%% ==========================================================

% Continuous Unit Step
t3 = -1:0.001:1;
u = double(t3>=0);

% Continuous Ramp
t4 = 0:0.001:1;
r = t4;

% Discrete Ramp
n2 = 0:5;
rd = n2;

figure;

% Continuous Unit Step
subplot(1,3,1)
plot(t3,u,'k','LineWidth',2);
grid on;
axis([-1 1 -0.2 1.5]);
title('Continuous Unit Step');
xlabel('t');
ylabel('Amplitude');

% Continuous Ramp
subplot(1,3,2)
plot(t4,r,'g','LineWidth',2);
grid on;
axis([0 1 0 1]);
title('Continuous-Time Unit Ramp Signal');
xlabel('t');
ylabel('r(t)');

% Discrete Ramp
subplot(1,3,3)
stem(n2,rd,'filled','LineWidth',1.2);
grid on;
axis([0 5 0 5]);
title('Discrete Ramp Sequence');
xlabel('Time');
ylabel('Amplitude');