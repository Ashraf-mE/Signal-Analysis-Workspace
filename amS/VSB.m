% Sampling frequency
Fs = 1000; 

% Time vector
t = 0:1/Fs:1-1/Fs; 

% Message signal
f = 10;
msg = sin(2*pi*f*t);

% Carrier frequency
fc = 100;

% Modulation index
m = 0.5;

% Generating the carrier signal
carrier = sin(2*pi*fc*t);

% Generating the VSB modulated signal
vsb_modulated = zeros(size(t));
for i=1:length(t)
    if msg(i)>=0
        vsb_modulated(i) = msg(i)*carrier(i);
    else
        vsb_modulated(i) = -msg(i)*carrier(i);
    end
end

% Generating the VSB demodulated signal
vsb_demodulated = zeros(size(t));
for i=1:length(t)
    if vsb_modulated(i)>=0
        vsb_demodulated(i) = vsb_modulated(i)*carrier(i);
    else
        vsb_demodulated(i) = -vsb_modulated(i)*carrier(i);
    end
end

% Low-pass filter
[b,a] = butter(6,2*50/Fs);
filtered_demod = filter(b,a,vsb_demodulated);

% Plotting the signals in time domain
figure;
subplot(3,1,1);
plot(t,msg);
title('Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,2);
plot(t,vsb_modulated);
title('VSB Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,3);
plot(t,filtered_demod);
title('Filtered VSB Demodulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Plotting the signals in frequency domain
figure;
subplot(3,1,1);
plot(abs(fft(msg)));
title('Message Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

subplot(3,1,2);
plot(abs(fft(vsb_modulated)));
title('VSB Modulated Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

subplot(3,1,3);
plot(abs(fft(filtered_demod)));
title('Filtered VSB Demodulated Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');