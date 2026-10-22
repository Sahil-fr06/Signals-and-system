%% SIGNALS AND SYSTEMS EXPERIMENTS
clc;
clear;
close all;

%% ==========================================================
%% 1. Discrete-Time Delay System
%% ==========================================================

n1 = 0:12;

x = [0 0 2.5 2.5 2.45 2.4 2.3 2.2 2.05 1.9 1.75 1.55 1.35];

x_delay = [0 x(1:end-1)];

y_delay = x_delay;

figure('Color','w');

subplot(2,1,1)
stem(n1,x_delay,'o','LineWidth',1.2,'MarkerFaceColor','w');
grid on
axis([0 12 0 3])
title('DELAYED INPUT')
xlabel('n')
ylabel('Amplitude')

subplot(2,1,2)
stem(n1,y_delay,'o','LineWidth',1.2,'MarkerFaceColor','w');
grid on
axis([0 12 0 3])
title('DELAYED OUTPUT')
xlabel('n')
ylabel('Amplitude')

%% ==========================================================
%% 2. Causal, Non-Causal and Anti-Causal Systems
%% ==========================================================

n2 = -8:8;

% Causal
h_causal = zeros(size(n2));
h_causal(n2==1)=1;
h_causal(n2==2)=2;
h_causal(n2==3)=2;
h_causal(n2==4)=4;

% Non-Causal
h_noncausal = zeros(size(n2));
h_noncausal(n2==-2)=3;
h_noncausal(n2==-1)=2;
h_noncausal(n2==0)=3;
h_noncausal(n2==1)=3;
h_noncausal(n2==2)=2;

% Anti-Causal
h_anticausal = zeros(size(n2));
h_anticausal(n2==-4)=6;
h_anticausal(n2==-3)=4;
h_anticausal(n2==-2)=3;

figure('Color','w');

subplot(3,1,1)
stem(n2,h_causal,'o','LineWidth',1.2)
grid on
axis([-8 8 0 4.5])
title('Causal system')
xlabel('n')
ylabel('h[n]')

subplot(3,1,2)
stem(n2,h_noncausal,'o','LineWidth',1.2)
grid on
axis([-8 8 0 3.5])
title('Non-causal system')
xlabel('n')
ylabel('h[n]')

subplot(3,1,3)
stem(n2,h_anticausal,'o','LineWidth',1.2)
grid on
axis([-8 8 0 6.5])
title('Anti-causal system')
xlabel('n')
ylabel('h[n]')

%% ==========================================================
%% 3. Analysis of Discrete-Time System
%% ==========================================================

n3 = 0:25;

x3 = [1.9 1.3 -0.5 0.6 -1.5 -0.2 0.5 1.0 -1.8 2.1 ...
     -0.1 -0.5 -1.8 1.2 -0.7 2.7 0.2 -2.0 -2.2 1.8 ...
      1.0 0.9 0.1 -2.1 1.4 -0.6];

figure('Color','w')

stem(n3,x3,'filled','LineWidth',1.5)
grid on
axis([0 25 -3 3])
title('Discrete-Time Signal')
xlabel('n')
ylabel('x[n]')

%% ==========================================================
%% 4. Analysis of Continuous-Time System
%% ==========================================================

t = 0:0.001:2;

x4 = cos(2*pi*t);

figure('Color','w')

plot(t,x4,'Color',[0.3010 0.7450 0.9330],'LineWidth',1.2)
grid on
axis([0 2 -1 1])

title('Acquired Signal')
xlabel('sec')
ylabel('Voltage (V)')