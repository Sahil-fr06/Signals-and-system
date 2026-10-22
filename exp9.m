for k = 0:N-1
    for n = 0:N-1
        X(k+1) = X(k+1) + x(n+1)*exp(-1j*2*pi*k*n/N);
    end
end

%% Display Output
disp(' ');
disp('Input Sequence');
disp(['x(n) = {',num2str(x),'}']);

disp(' ');
disp('DFT Values');

for k=0:N-1
    fprintf('X(%d) = %.0f%+.0fj\n',k,real(X(k+1)),imag(X(k+1)));
end

disp(' ');
disp('Magnitude Spectrum');
disp('-----------------------------');
disp(' k        X(k)          |X(k)|');
disp('-----------------------------');

for k=0:N-1
    fprintf('%2d   %6.0f%+3.0fj      %6.3f\n',...
        k,real(X(k+1)),imag(X(k+1)),abs(X(k+1)));
end

%%====================================================
%% Figure 1 : Time, Magnitude and Phase
%%====================================================

figure('Name','DFT Analysis','NumberTitle','off');

subplot(3,1,1)
stem(0:N-1,x,'b','filled','LineWidth',1.5)
grid on
title('Time domain - Input sequence')
xlabel('Time (s)')
ylabel('Amplitude')

subplot(3,1,2)
stem(0:N-1,abs(X),'b','filled','LineWidth',1.5)
grid on
title('Frequency domain - Magnitude response')
xlabel('Frequency')
ylabel('|X(k)|')

subplot(3,1,3)
stem(0:N-1,angle(X),'b','filled','LineWidth',1.5)
grid on
title('Frequency domain - Phase response')
xlabel('Frequency')
ylabel('Phase')

%%====================================================
%% Figure 2 : Smooth DFT Spectrum
%%====================================================

NFFT = 128;

Xfft = fft(x,NFFT);

f = (0:NFFT-1)/NFFT;

figure('Name','Expected Output Graph','NumberTitle','off');

subplot(2,1,1)
plot(f,abs(Xfft),'o-','LineWidth',1)
grid on
title('Magnitude Spectrum of DFT')
xlabel('Frequency')
ylabel('Magnitude')

subplot(2,1,2)
stem(f,abs(Xfft),'r','filled')
grid on
title('Its DFT')
xlabel('Frequency')
ylabel('Magnitude')
xlim([0 1])
% Circular Convolution using FFT
clc;
clear;
close all;

%% Input Sequences
x = [1 1 1 1 1 0 0 0];
h = [1 1 1 1 1 0 0 0];

N = 8;

%% FFT
X = fft(x,N);
H = fft(h,N);

%% Circular Convolution
Y = ifft(X.*H);

%% Display Output
disp('Input Sequences')
fprintf('x(n) = ');
disp(x)

fprintf('h(n) = ');
disp(h)

disp('Circular Convolution Output')
disp(real(Y))

fprintf('\n n      y(n)\n');
for k=0:N-1
    fprintf('%2d     %.0f\n',k,real(Y(k+1)));
end

%% Plot
figure('Color','w')

subplot(3,1,1)
stem(0:N-1,x,'filled','LineWidth',1.5)
grid on
title('First Sequence')
xlabel('n')
ylabel('x(n)')
axis([0 7 0 1.5])

subplot(3,1,2)
stem(0:N-1,h,'filled','LineWidth',1.5)
grid on
title('Second Sequence')
xlabel('n')
ylabel('h(n)')
axis([0 7 0 1.5])

subplot(3,1,3)
stem(0:N-1,real(Y),'filled','LineWidth',1.5)
grid on
title('Circular Convoluted Sequence')
xlabel('n')
ylabel('y(n)')
axis([0 7 0 max(real(Y))+1])
%=========================================================
% FFT - Decimation In Time (DIT) Algorithm
%=========================================================

clc;
clear;
close all;

%% Input Sequence
x = [1 2 3 4 5 6 7 8];
N = length(x);

%% FFT
X = fft(x);
k = 0:N-1;

%% Display Output
fprintf('\nOutput\n\n');

fprintf('Input Sequence\n');
fprintf('x(n) = {');
fprintf('%d ',x);
fprintf('}\n\n');

fprintf('FFT Output\n\n');
fprintf(' k\t\tX(k)\n');
fprintf('-----------------------------\n');

for i = 1:N
    fprintf('%d\t%8.3f %+8.3fj\n',k(i),real(X(i)),imag(X(i)));
end

fprintf('\nMagnitude Spectrum\n');
fprintf('-------------------------\n');
fprintf('| k |   |X(k)| |\n');
fprintf('-------------------------\n');

for i=1:N
    fprintf('| %d | %7.3f |\n',k(i),abs(X(i)));
end

%%====================================================
%% Figure 1 : Input & Magnitude Spectrum
%%====================================================

figure('Color','w');

subplot(2,1,1)
stem(k,x,'filled','LineWidth',1.5)
grid on
title('Input Sequence')
xlabel('n')
ylabel('Amplitude')

subplot(2,1,2)
stem(k,abs(X),'filled','LineWidth',1.5)
grid on
title('Magnitude Spectrum using DIT-FFT')
xlabel('Frequency Index (k)')
ylabel('|X(k)|')

%%====================================================
%% Figure 2 : Basic Magnitude FFT
%%====================================================

NFFT = 256;
Xfft = fft(x,NFFT);

figure('Color','w');
stem(0:NFFT-1,abs(Xfft),'k','filled')
grid on
title('Basic Magnitude FFT')
xlabel('Bin')
ylabel('Bin Value')
xlim([0 250])
%=========================================================
% FFT - Decimation In Frequency (DIF) Algorithm
%=========================================================

clc;
clear;
close all;

%% Input Sequence
x = [1 2 3 4 5 6 7 8];
N = length(x);

%% FFT (DIF Result)
X = fft(x);
k = 0:N-1;

%% Display Output
fprintf('\nOutput\n\n');

fprintf('Input Sequence\n');
fprintf('x(n)={');
fprintf('%d,',x(1:end-1));
fprintf('%d}\n\n',x(end));

fprintf('DIF-FFT Output\n\n');
fprintf('k\t\tX(k)\n');
fprintf('-------------------------------\n');

for i=1:N
    fprintf('%d\t%8.3f %+8.3fj\n',k(i),real(X(i)),imag(X(i)));
end

fprintf('\nMagnitude Spectrum\n');
fprintf('-------------------------\n');
fprintf('| k | |X(k)| |\n');
fprintf('-------------------------\n');

for i=1:N
    fprintf('| %d | %7.3f |\n',k(i),abs(X(i)));
end

%%=========================================================
%% Figure 1
%%=========================================================

figure('Color','w');

subplot(2,1,1)
stem(k,x,'filled','LineWidth',1.5)
grid on
title('Input Sequence')
xlabel('n')
ylabel('Amplitude')

subplot(2,1,2)
stem(k,abs(X),'filled','LineWidth',1.5)
grid on
title('Magnitude Spectrum using DIF-FFT')
xlabel('Frequency Index (k)')
ylabel('|X(k)|')

%%=========================================================
%% Figure 2 (Expected Style)
%%=========================================================

NFFT = 16;
X16 = fft(x,NFFT);

subplot_color1 = [1 0 0];      % Red
subplot_color2 = [0 0 1];      % Blue

figure('Color','w');

% Original FFT
subplot(2,1,1)
stem(0:NFFT-1,abs(X16),...
    'Color',subplot_color1,...
    'MarkerFaceColor',subplot_color1,...
    'LineWidth',1.5)
grid on
title('3) Original FFT Spectrum (N=16)')
xlabel('Frequency (Hz)')
ylabel('Magnitude')
xlim([0 15])

% Repeated Signal FFT
x_rep = repmat(x,1,4);      % Repeat signal 4 times
X64 = fft(x_rep,64);

subplot(2,1,2)
stem(linspace(0,16,64),abs(X64),...
    'Color',subplot_color2,...
    'MarkerFaceColor',subplot_color2,...
    'LineWidth',1.5)
grid on
title({'4) Repeated Signal FFT (N=64) - Comb Effect';...
      'Note: Zeros between multiples of 4, and Magnitude scaled by 4'})
xlabel('Frequency (Hz)')
ylabel('Magnitude')
xlim([0 16]) 