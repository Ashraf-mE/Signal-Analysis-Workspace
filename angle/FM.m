fc = 1000; % carrier frequency in Hz
fm = 100; % message frequency in Hz
Fs = 10000; % sampling frequency in Hz
t = 0:1/Fs:1; % time vector
kf = 100; % frequency sensitivity

% generate message signal
message = sin(2*pi*fm*t);

% generate FM signal
fm_signal = fmmod(message,fc,Fs,kf);

% plot signals
subplot(3,1,1);
plot(t, message);
title('Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,2);
plot(t, fm_signal);
title('FM Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Demodulation of FM signal
demod_fm = fmdemod(fm_signal,fc,Fs,kf);

% plot demodulated signal
subplot(3,1,3);
plot(t, demod_fm);
title('Demodulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% analysis
% calculate power spectral density of message signal
figure;
[psd_message,freq_message] = periodogram(message,[],[],Fs);
plot(freq_message,10*log10(psd_message));
title('PSD of Message Signal');
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');

% calculate power spectral density of FM signal
figure;
[psd_fm,freq_fm] = periodogram(fm_signal,[],[],Fs);
plot(freq_fm,10*log10(psd_fm));
title('PSD of FM Signal');
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');

% calculate power spectral density of demodulated signal
figure;
[psd_demod,freq_demod] = periodogram(demod_fm,[],[],Fs);
plot(freq_demod,10*log10(psd_demod));
title('PSD of Demodulated Signal');
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');