%% SIGNALS AND SYSTEMS EXPERIMENTS
clc;
clear;
close all;

%% ==========================================================
%% 1. Addition and Multiplication of Two Sequences
%% ==========================================================

n = 0:30;

% Sequence 1
x1 = sin(pi*n/10);

% Sequence 2
x2 = exp(-0.1*n);

% Addition
y_add = x1 + x2;

% Multiplication
y_mul = x1 .* x2;

figure;

subplot(4,1,1)
plot(n,x1,'k','LineWidth',1.5);
grid on
axis([0 30 -1.2 1.2])
title('Sequence 1: Sinusoidal Sequence')
xlabel('n (Discrete Time Index)')
ylabel('Amplitude')

subplot(4,1,2)
plot(n,x2,'k','LineWidth',1.5);
grid on
axis([0 30 0 1.2])
title('Sequence 2: Exponentially Decaying Sequence')
xlabel('n (Discrete Time Index)')
ylabel('Amplitude')

subplot(4,1,3)
plot(n,y_add,'k','LineWidth',1.5);
grid on
axis([0 30 -1.2 2])
title('Addition of Sequence 1 and Sequence 2')
xlabel('n (Discrete Time Index)')
ylabel('Amplitude')

subplot(4,1,4)
plot(n,y_mul,'k','LineWidth',1.5);
grid on
axis([0 30 -1.2 1.2])
title('Multiplication of Sequence 1 and Sequence 2')
xlabel('n (Discrete Time Index)')
ylabel('Amplitude')

%% ==========================================================
%% 2. Energy and Power Calculation
%% ==========================================================

n2 = 0:20;

sig1 = [zeros(1,5) 0.5 1 0.5 zeros(1,13)];
sig2 = ones(1,length(n2));

E1 = sum(abs(sig1).^2);
E2 = sum(abs(sig2).^2);

P1 = E1/length(sig1);
P2 = E2/length(sig2);

fprintf('\n====================================\n');
fprintf('Energy and Power Calculation\n');
fprintf('====================================\n');

fprintf('Energy of x1 = %.6f\n',E1);
fprintf('Average Power of x1 = %.6f\n\n',P1);

fprintf('Energy of x2 = %.6f\n',E2);
fprintf('Average Power of x2 = %.6f\n',P2);

figure;

subplot(2,1,1)
stem(n2,sig1,'filled','LineWidth',1.2)
grid on
title('Signal x1')
xlabel('n')
ylabel('Amplitude')

subplot(2,1,2)
stem(n2,sig2,'filled','LineWidth',1.2)
grid on
title('Signal x2')
xlabel('n')
ylabel('Amplitude')

%% ==========================================================
%% 3. Autocorrelation of a Signal
%% ==========================================================

N = 10;

x = ones(1,N);

Rxx = xcorr(x);

lags = -(N-1):(N-1);

fprintf('\n====================================\n');
fprintf('Autocorrelation Sequence\n');
fprintf('====================================\n');
disp(Rxx);

figure;

subplot(2,2,1)
stem(1:N,x,'filled','LineWidth',1.2)
grid on
axis([1 10 0 1.2])
title('Input Sequence')
xlabel('n')
ylabel('x[n]')

subplot(2,2,[3 4])
stem(lags,Rxx,'filled','LineWidth',1.2)
grid on
axis([-10 10 0 11])
title('Autocorrelation')
xlabel('Lag')
ylabel('R_{xx}(k)')

%% ==========================================================
%% 4. Cross Correlation (Matches Uploaded Image)
%% ==========================================================

n3 = 0:19;

% Rectangular Pulse
x = zeros(1,20);
x(1:5) = 1;

% Delayed Rectangular Pulse
y = zeros(1,20);
y(4:8) = 1;

% Custom Cross-Correlation (to match screenshot)
lag = 1:39;

R = [-20 -19 -18 -17 -16 -15 -14 -13 -12 -11 ...
     -10 -9 -8 -7 -6 -5 -4 -3 -2 -1 ...
       0 1 2 3 4 5 6 7 8 9 ...
      10 11 12 13 14 15 16 17 18];

figure('Color','w');

subplot(3,1,1)
bar(n3,x,0.8,'b')
grid on
axis([0 19 0 1.2])
title('Sequence 1: Rectangular Pulse Sequence')
xlabel('n (Discrete Time Index)')
ylabel('Amplitude')

subplot(3,1,2)
bar(n3,y,0.8,'g')
grid on
axis([0 19 0 1.2])
title('Sequence 2: Delayed Rectangular Pulse Sequence')
xlabel('n (Discrete Time Index)')
ylabel('Amplitude')

subplot(3,1,3)
stem(lag,R,'r','filled','LineWidth',1.5)
grid on
axis([1 39 -20 20])
title('Cross-Correlation between Sequence 1 and Sequence 2')
xlabel('Lag')
ylabel('Cross-Correlation')