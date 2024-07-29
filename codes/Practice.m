clc; close all; clear all;
t=0:0.0001:1;
s=sawtooth(2*pi*10*t+pi);
m=0.75*sin(2*pi*1*t);
n=length(s);
for i=1:n
    if (m(i)>=s(i))
        pwm(i)=1;
    elseif (m(i)<=s(i))
        pwm(i)=0;
    end
end

% Modulation
fc = 100; % Carrier frequency
fs = 10000; % Sampling frequency
t_mod = 0:1/fs:1; % Time vector for modulation
carrier = cos(2*pi*fc*t_mod); % Carrier signal
% carrier = carrier(1:end-1); % Removing last element from carrier signal
modulated = pwm.*carrier; % Modulated signal

% Demodulation
[b,a] = butter(5,fc/(fs/2)); % Butterworth filter of order 5
demodulated = filtfilt(b,a,modulated); % Demodulated signal

% Plotting in time domain
figure;
subplot(2,2,1);
plot(t,pwm,'g');
ylabel('Amplitude');
axis([0 1 -0.5 1.5]);
xlabel('Time index');
title('PWM Wave');
grid on;

subplot(2,2,2);
plot(t,m,'r');
ylabel('Amplitude');
axis([0 1 -1.5 1.5]);
xlabel('Time index');
title('Message Signal');
grid on;

subplot(2,2,3);
plot(t_mod,carrier,'b');
ylabel('Amplitude');
axis([0 1 -1.5 1.5]);
xlabel('Time index');
title('Carrier Signal');
grid on;

subplot(2,2,4);
plot(t_mod,modulated,'m');
ylabel('Amplitude');
axis([0 1 -1.5 1.5]);
xlabel('Time index');
title('Modulated Signal');
grid on;

% Plotting in frequency domain
N = length(modulated);
f = (-N/2:N/2-1)*(fs/N); % Frequency vector
modulated_fft = fftshift(abs(fft(modulated,N)));
demodulated_fft = fftshift(abs(fft(demodulated,N)));

figure;
subplot(3,1,1);
plot(t_mod,demodulated,'k');
ylabel('Amplitude');
axis([0 1 -1.5 1.5]);
xlabel('Time index');
title('Demodulated Signal');
grid on;

subplot(3,1,2);
plot(f/1000,modulated_fft,'m'); % Frequency in kHz
ylabel('Magnitude (dB)');
xlabel('Frequency (kHz)');
title('Modulated Signal Spectrum');

subplot(3,1,3);
plot(f/1000,demodulated_fft,'k'); % Frequency in kHz
ylabel('Magnitude (dB)');
xlabel('Frequency (kHz)');
title('Demodulated Signal Spectrum');
