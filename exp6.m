%% MATLAB Program: Convolution, Sampling Theorem and Aliasing
clc;
clear;
close all;

%% ==============================================================
%% 1. Convolution of Continuous-Time Signals
%% ==============================================================

% Time axis
t = -6:0.01:6;

% Signal 1 : Rectangular Pulse
x = double(t>=-1 & t<=1);

% Signal 2 : Exponential Decay
h = exp(-t).*(t>=0);

% Convolution
dt = 0.01;
y = conv(x,h)*dt;

% Time axis for convolution
t_conv = (2*t(1)):dt:(2*t(end));

% Plot
figure('Name','Continuous-Time Convolution','Color','w');

subplot(3,1,1)
plot(t,x,'b','LineWidth',1.5)
grid on
axis([-6 6 0 1.2])
title('Signal 1 : Rectangular Pulse')
ylabel('x(t)')

subplot(3,1,2)
plot(t,h,'g','LineWidth',1.5)
grid on
axis([-6 6 0 1.2])
title('Signal 2 : Exponential Decay')
ylabel('h(t)')

subplot(3,1,3)
plot(t_conv,y,'r','LineWidth',1.5)
grid on
axis([-10 10 0 1.5])
title('Convolution of x(t) and h(t)')
xlabel('Time')
ylabel('y(t)')

%% ==============================================================
%% 2. Convolution of Discrete-Time Signals
%% ==============================================================

% Input sequences
x = [2 5 8];
h = [1 2 3];

% Linear convolution
y_linear = conv(x,h);

% Circular convolution
N = length(y_linear);

xpad = [x zeros(1,N-length(x))];
hpad = [h zeros(1,N-length(h))];

y_circular = ifft(fft(xpad).*fft(hpad));

% Sample indices
n1 = 0:length(x)-1;
n2 = 0:length(h)-1;
ny = 0:length(y_linear)-1;

% Plot
figure('Name','Discrete-Time Convolution','Color','w');

subplot(2,2,1)
stem(ny,y_linear,'filled','LineWidth',1.4)
grid on
title('Linear Convolution')
xlabel('n')
ylabel('Amplitude')

subplot(2,2,3)
stem(ny,real(y_circular),'filled','LineWidth',1.4)
grid on
title('Circular Convolution')
xlabel('n')
ylabel('Amplitude')

subplot(1,2,2)
stem(n1,x,'filled','LineWidth',1.5)
hold on
stem(n2,h,'filled','LineWidth',1.5)
grid on
xlabel('n')
ylabel('Amplitude')
title('Input Sequences')
legend('x(n)','h(n)','Location','northwest')

%% ==============================================================
%% 3. Sampling Theorem Verification
%% ==============================================================

% Parameters
f0 = 1;          % Signal frequency
Fs = 20;         % Sampling frequency
Ns = 60;         % Number of samples

% Time vector
t = (0:Ns-1)/Fs;

% Sampled signal
x = sin(2*pi*f0*t);

% Plot
figure('Name','Sampling Theorem','Color','w');

stem(t,x,'filled','LineWidth',1.2)
hold on
plot(t,x,'b','LineWidth',0.8)

grid on
axis([0 3 -2 2])

xlabel('Time (s)')
ylabel('Amplitude')

title('Sampling Theorem Verification')

legend(sprintf('f_0 = %d Hz\nF_s = %d Hz\nN = %d Samples', ...
    f0,Fs,Ns),'Location','northeast')

%% ==============================================================
%% 4. Aliasing Effect Demonstration
%% ==============================================================

% Parameters
fm = 2;          % Message frequency
fs = 3;          % Sampling frequency (< Nyquist)

% Continuous signal
t = 0:0.001:3;
x = sin(2*pi*fm*t);

% Sample points
ts = 0:1/fs:3;
xs = sin(2*pi*fm*ts);

% Aliased signal
fa = abs(fs-fm);
xa = -sin(2*pi*fa*t);

% Plot
figure('Name','Aliasing Effect','Color','w');

subplot(2,1,1)

plot(t,x,'k','LineWidth',1.4)
hold on
stem(ts,xs,'filled','b','LineWidth',1.2)

grid on
axis([0 3 -1.5 1.5])

title('Original Signal with Sample Points')
xlabel('Time (s)')
ylabel('Amplitude')

legend('Original Signal','Sample Points','Location','northeast')

subplot(2,1,2)

plot(t,xa,'r--','LineWidth',1.5)
hold on
stem(ts,xs,'filled','b','LineWidth',1.2)

grid on
axis([0 3 -1.5 1.5])

title('False Reconstruction due to Aliasing')
xlabel('Time (s)')
ylabel('Amplitude')

text(2.05,-1.2,'f_s = 1.5 f_m','FontSize',10)