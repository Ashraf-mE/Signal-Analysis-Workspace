% Define message signal
fm = 10;
t = 0:0.001:1;
m = sin(2*pi*fm*t);

% Define carrier signal
fc = 100;
c = cos(2*pi*fc*t);

% Modulate message signal with carrier signal
beta = 10;
s = zeros(size(t));
for i=1:length(t)
    s(i) = m(i)*cos(2*pi*fc*t(i)+beta*sin(2*pi*fm*t(i)));
end

% Demodulate modulated signal
sdemod = zeros(size(t));
for i=1:length(t)
    sdemod(i) = s(i)*cos(2*pi*fc*t(i)+beta*sin(2*pi*fm*t(i)));
end

% Plot signals in time domain
figure;
subplot(4,1,1);
plot(t,m);
title('Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(4,1,2);
plot(t,c);
title('Carrier Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(4,1,3);
plot(t,s);
title('Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(4,1,4);
plot(t,sdemod);
title('Demodulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Plot signals in frequency domain
figure;
subplot(4,1,1);
plot(abs(fft(m)));
title('Message Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

subplot(4,1,2);
plot(abs(fft(c)));
title('Carrier Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

subplot(4,1,3);
plot(abs(fft(s)));
title('Modulated Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

subplot(4,1,4);
plot(abs(fft(sdemod)));
title('Demodulated Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;