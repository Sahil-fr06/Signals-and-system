%% EXPERIMENT: FOURIER TRANSFORM AND DTFT ANALYSIS
clc;
clear;
close all;

%% ==========================================================
%% 1. Fourier Transform of Periodic Impulse Train
%% ==========================================================

t = -5:0.01:5;
dt = t(2)-t(1);

x = zeros(size(t));
x(mod(round((t+5)/dt),200)==0)=1;

N = length(x);
X = fftshift(fft(x));

Fs = 1/dt;
f = (-N/2:N/2-1)*(Fs/N);

figure;

subplot(3,1,1)
stem(t,x,'b','filled')
grid on
title('Periodic Impulse Train')
xlabel('t (Time)')
ylabel('Amplitude')
xlim([-6 6])

subplot(3,1,2)
plot(f,abs(X)/N,'r','LineWidth',1.5)
grid on
title('Magnitude of the Fourier Transform')
xlabel('f (Frequency)')
ylabel('|X(f)|')
xlim([-60 60])

subplot(3,1,3)
plot(f,angle(X),'g','LineWidth',1.5)
grid on
title('Phase of the Fourier Transform')
xlabel('f (Frequency)')
ylabel('Phase of X(f)')
xlim([-60 60])

%% ==========================================================
%% 2. Discrete-Time Fourier Transform (DTFT)
%% ==========================================================

x = ones(1,4);

n = 0:length(x)-1;

w = -5:0.01:5;

X = zeros(size(w));

for k = 1:length(w)
    X(k) = sum(x.*exp(-1j*w(k)*n));
end

figure;

subplot(2,1,1)
plot(w,abs(X),'LineWidth',1.5)
grid on
title('Fourier Transform of Discrete-Time Pulse Signal')
xlabel('f')
ylabel('Magnitude of X_T(f)')
xlim([-5 5])

subplot(2,1,2)
plot(w,angle(X),'LineWidth',1.5)
grid on
title('Phase Spectrum')
xlabel('f')
ylabel('Phase of X_T(f)')
xlim([-5 5])

%% ==========================================================
%% 3. DTFT of Rectangular Pulse (Magnitude Only)
%% ==========================================================

N = 11;
x = ones(1,N);

n = 0:N-1;

wn = -1:0.001:1;
w = wn*pi;

X = zeros(size(w));

for k = 1:length(w)
    X(k) = sum(x.*exp(-1j*w(k)*n));
end

figure;

plot(wn,abs(X),'b','LineWidth',1.5)

grid on
box on

title('Magnitude of DTFT of Rectangular Pulse')
xlabel('Normalized Frequency (\omega/\pi)')
ylabel('|H(e^{j\omega})|')

xlim([-1 1])
ylim([0 12])

%% ==========================================================
%% 4. DTFT of Rectangular Pulse (Magnitude & Phase)
%% ==========================================================

N = 11;
x = ones(1,N);

n = 0:N-1;

wn = -1:0.001:1;
w = wn*pi;

X = zeros(size(w));

for k = 1:length(w)
    X(k) = sum(x.*exp(-1j*w(k)*n));
end

figure;

subplot(2,1,1)
plot(wn,abs(X),'b','LineWidth',1.5)
grid on
box on
title('Magnitude of DTFT of Rectangular Pulse')
xlabel('Normalized Frequency (\omega/\pi)')
ylabel('|X(e^{j\omega})|')
xlim([-1 1])
ylim([0 12])

subplot(2,1,2)
plot(wn,angle(X),'b','LineWidth',1.2)
grid on
box on
title('Phase of DTFT of Rectangular Pulse')
xlabel('Normalized Frequency (\omega/\pi)')
ylabel('Phase of X(e^{j\omega})')
xlim([-1 1])
ylim([-2 2])

disp('------------------------------------------------');
disp('All Fourier Transform and DTFT experiments completed.');
disp('Four figure windows have been generated.');
disp('------------------------------------------------');