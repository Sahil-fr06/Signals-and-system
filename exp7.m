%% EXPERIMENT 7: SIGNAL RECONSTRUCTION AND SPECTRAL ANALYSIS
% Objective 1 : Reconstruction of Signal from Samples
% Objective 2 : Fourier Series of Half-Wave Rectifier Output
% Objective 3 : Fourier Transform of a Continuous-Time Signal
% Objective 4 : Fourier Transform of a Rectangular Waveform

clc;
clear;
close all;

%% ==========================================================
%% OBJECTIVE 1: Reconstruction of Signal from Samples
%% ==========================================================

fm = 2;
fs = 10;

t = -5:0.01:15;

% Original signal
x = sinc(t-3) + 2*sinc(t-6) + 4*sinc(t-9);

% Sampled signal
ts = -5:1/fs:15;
xs = sinc(ts-3) + 2*sinc(ts-6) + 4*sinc(ts-9);

% Reconstruction
xr = interp1(ts,xs,t,'spline');

figure('Name','Objective 1');

plot(ts,xs,'bo','MarkerSize',6)
hold on
plot(t,xr,'r','LineWidth',1.5)

grid on
legend('Sampled','Interpolated')
title('Signal Reconstruction using Spline Interpolation')
xlabel('Time')
ylabel('Signal')

%% ==========================================================
%% OBJECTIVE 2: Fourier Series of Half-Wave Rectifier Output
%% ==========================================================

t = linspace(0,4*pi,2000);

x = sin(t);
x(x<0)=0;

N = 20;

a0 = (1/pi)*trapz(t(1:1000),x(1:1000));

fsignal = a0/2;

for n=1:N

    an = (1/pi)*trapz(t(1:1000),x(1:1000).*cos(n*t(1:1000)));

    bn = (1/pi)*trapz(t(1:1000),x(1:1000).*sin(n*t(1:1000)));

    fsignal = fsignal + an*cos(n*t) + bn*sin(n*t);

end

figure('Name','Objective 2')

subplot(2,1,1)

plot(t,x,'b','LineWidth',2)

grid on

title('Half-Wave Rectified Signal')

xlabel('Time')

ylabel('Amplitude')

subplot(2,1,2)

plot(t,fsignal,'r','LineWidth',2)

grid on

title('Fourier Series Approximation')

xlabel('Time')

ylabel('Amplitude')

%% ==========================================================
%% OBJECTIVE 3: Fourier Transform of Continuous-Time Signal
%% ==========================================================

t = -5:0.01:5;

x = exp(-abs(t));

N = 4096;

X = fftshift(fft(x,N));

Fs = 1/0.01;

f = (-N/2:N/2-1)*(Fs/N);

figure('Name','Objective 3')

subplot(3,1,1)

plot(t,x,'LineWidth',2)

grid on

title('Continuous-Time Signal')

xlabel('Time (s)')

ylabel('Amplitude')

subplot(3,1,2)

plot(f,abs(X)/max(abs(X)),'r','LineWidth',2)

grid on

title('Magnitude Spectrum')

xlabel('Frequency (Hz)')

ylabel('|X(f)|')

subplot(3,1,3)

plot(f,angle(X),'r','LineWidth',2)

grid on

title('Phase Spectrum')

xlabel('Frequency (Hz)')

ylabel('Phase (Radians)')

%% ==========================================================
%% OBJECTIVE 4: Fourier Transform of Rectangular Waveform
%% ==========================================================

N = 128;

x = zeros(1,N);

x(1:8) = 1;

x(end-7:end) = 1;

X = fftshift(fft(x));

f = (-N/2:N/2-1)/N;

figure('Name','Objective 4')

subplot(3,1,1)

stem(0:N-1,x,'filled')

axis([0 N 0 1.2])

grid on

title('Rectangular Pulse')

xlabel('Sample Number')

ylabel('Amplitude')

subplot(3,1,2)

plot(f,abs(X),'r','LineWidth',2)

grid on

title('Magnitude Spectrum')

xlabel('Frequency (Hz)')

ylabel('|X(f)|')

subplot(3,1,3)

plot(f,angle(X),'r','LineWidth',2)

grid on

title('Phase Spectrum')

xlabel('Frequency (Hz)')

ylabel('Phase (Radians)')