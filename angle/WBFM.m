% MATLAB code to generate the wideband FM signal
clc;	 % Clears the Command Window
clear all; % Clears the Workspace
close all; % Closes all the Windows opened by the program

% Time sampling where Step Size = 0.001
t = 0:0.001:1;

fm = 20; % frequency of the Message signal
fc = 250; % frequency of the Carrier signal

% Take the user input for the Frequency Modulation Index (b)
% (b) must be greater than 1
b = input("Enter the value of b (>1): ");

% Define the Message signal
% here its a Sine wave
msg = sin(2*pi*fm*t);

% Define the Carrier signal
% here it is a Cosine wave
crr = cos(2*pi*fc*t);

% Wideband FM Signal generation
wb_fm = cos((2*pi*fc*t)+(b*sin(2*pi*fm*t)));

% Plot all the three signals
figure('Name','Wideband FM Signal Generation');

% Message Signal
subplot(3,1,1);
plot(t, msg, 'b', 'Linewidth', 1.5);
title('Message signal');
xlabel('Time')
ylabel('Amplitude')
grid on;

% Carrier Signal
subplot(3,1,2);
plot(t, crr, 'r', 'Linewidth', 1.5);
title('Carrier signal');
xlabel('Time')
ylabel('Amplitude')
grid on;

% Wideband FM Signal
subplot(3,1,3);
plot(t, wb_fm, 'g', 'Linewidth', 1.5);
title('Wideband FM signal');
xlabel('Time')
ylabel('Amplitude')
grid on;
