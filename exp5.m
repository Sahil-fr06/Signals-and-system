%% SIGNALS AND SYSTEMS EXPERIMENTS
clc;
clear;
close all;

%% ==========================================================
%% 1. Impulse Response of the System
%% ==========================================================

n = 0:10;

h = [1 1 0.32 -0.12 -0.18 -0.08 0.02 0.04 0.02 0.01 0];

t1 = 0:0.01:5;
hc = 25*exp(-20*t1).*sin(60*t1);

figure('Name','Experiment 1: Impulse Response','Color','w');

subplot(1,2,1)
stem(n,h,'filled','LineWidth',1.3)
grid on
axis([0 10 -0.2 1.2])
title('Impulse Response')
xlabel('Observation Time')
ylabel('Response')

subplot(1,2,2)
plot(t1,hc,'LineWidth',1.2)
grid on
axis([0 5 -5 25])
title('Continuous-Time Impulse Response')
xlabel('Time (seconds)')
ylabel('Amplitude')

%% ==========================================================
%% 2. Step Response of the System
%% ==========================================================

n2 = 0:18;

y = [0.10 0.48 0.90 1.12 1.08 1.00 0.97 0.99 1.00 ...
     1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00];

n3 = 0:120;

y2 = zeros(size(n3));

for k = 1:length(n3)

    if n3(k) < 60
        y2(k)=0.02*sin(0.4*n3(k));
    else
        y2(k)=1+0.08*exp(-(n3(k)-60)/10)* ...
              sin(2*pi*(n3(k)-60)/4);
    end

end

figure('Name','Experiment 2: Step Response','Color','w');

subplot(1,2,1)
stem(n2,y,'filled','LineWidth',1.2)
grid on
axis([0 18 0 1.2])
title('Step Response')
xlabel('n (samples)')
ylabel('Amplitude')

subplot(1,2,2)
stem(n3,y2,'filled','LineWidth',1)
grid on
axis([0 120 -0.2 1.2])
title('Step Response')
xlabel('n (samples)')
ylabel('Amplitude')

%% ==========================================================
%% 3. Verification of Linearity Property
%% ==========================================================

t2 = -1:0.001:4;

x1 = double(t2>=0 & t2<1);

y1 = zeros(size(t2));

for k = 1:length(t2)

    if t2(k)>=0 && t2(k)<=1
        y1(k)=t2(k);

    elseif t2(k)>1
        y1(k)=1;

    end

end

x2 = zeros(size(t2));

x2(t2>=0 & t2<1)=2;
x2(t2>=1 & t2<2)=1;
x2(t2>=2 & t2<3)=2;

figure('Name','Experiment 3: Linearity Property','Color','w');

subplot(2,2,1)
plot(t2,x1,'r','LineWidth',1.5)
grid on
axis([-1 4 -0.5 1.5])
title('x_1(t)')
ylabel('x_1(t)')

subplot(2,2,3)
plot(t2,y1,'b','LineWidth',1.5)
grid on
axis([-1 4 -0.5 1.5])
title('y_1(t)')
xlabel('t')
ylabel('y_1(t)')

subplot(2,2,4)
plot(t2,x2,'r','LineWidth',1.5)
grid on
axis([-1 4 -0.5 2.5])
title('x_2(t)')
xlabel('t')
ylabel('x_2(t)')

%% ==========================================================
%% 4. Analysis of Discrete-Time System
%% ==========================================================

n4 = 0:150;

x4 = sin(2*pi*0.12*n4);

y4 = 0.2*exp(-0.05*n4).*cos(0.35*n4);

figure('Name','Experiment 4: Discrete-Time System','Color','w');

subplot(2,1,1)
plot(n4,x4,'b','LineWidth',1.2)
grid on
axis([0 150 -1.5 1.5])
title('Input Signal')
xlabel('Time (n)')
ylabel('Amplitude')

subplot(2,1,2)
plot(n4,y4,'b','LineWidth',1.2)
grid on
axis([0 150 -0.2 0.3])
title('Output Signal')
xlabel('Time (n)')
ylabel('Amplitude')