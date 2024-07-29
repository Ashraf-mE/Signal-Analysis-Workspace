% DSB SC MODULATION AND DEMODULATION
%===========DSB SC IN TIME DOMAIN==================
            t = 0:0.001:1; 
            m = 1;
            Am = 10;
            Ac = Am / m;
            fm = 100;
            fc = 10*fm;
            msg = Am*sin(2*pi*fm*t);    %message signal
            carr = Ac*sin(2*pi*fc*t);  %carrier signal
            fs = 10000;     
dsb_sc = msg.*carrier; %dsb sc modulated wave

%=====DSB SC IN FREQUENCY DOMAIN============
ld=length (dsb_sc);
f=linspace (-fs/2,fs/2,ld);
DSB_SC=fftshift (fft (dsb_sc,ld)/ld); %frequency spectrum of dsb_sc modulated signal.

%===========DSB SC DEMODULATION TIME DOMAIN==================
msg_r=dsb_sc.*carrier; %demodulated signal
msg_r = lowpass(msg_r, 2000, fs); %corrected demodulated signal

%=====DSB SC DEMODULATION FREQUENCY DOMAIN============
lr=length (msg_r);
fr=linspace (-fs/2,fs/2,lr); %frequency bins
MSG_R=fftshift (fft (msg_r,lr)/lr); %frequency spectrum of demodulated signal

%===========LOW PASS FILTER==================
[b,a] = butter(6,2000/(fs/2)); % Butterworth filter of order 6 and cutoff frequency 2000 Hz
msg_filtered = filter(b,a,msg_r); % Filtered message signal

%Plotting the signals
figure;
subplot(2,2,1);
plot(t,msg);
title('Message Signal');
xlabel('Time');
ylabel('Amplitude');

subplot(2,2,2);
plot(t,carrier);
title('Carrier Signal');
xlabel('Time');
ylabel('Amplitude');

subplot(2,2,3);
plot(t,dsb_sc);
title('DSB-SC Modulated Signal');
xlabel('Time');
ylabel('Amplitude');

subplot(2,2,4);
plot(t,msg_filtered);
title('Filtered Message Signal');
xlabel('Time');
ylabel('Amplitude');

figure;
subplot(3,1,1);
plot(f,abs(DSB_SC));
title('Frequency Spectrum of DSB-SC Modulated Signal');
xlabel('Frequency');
ylabel('Magnitude');

subplot(3,1,2);
plot(fr,abs(MSG_R));
title('Frequency Spectrum of DSB-SC Demodulated Signal');
xlabel('Frequency');
ylabel('Magnitude');

subplot(3,1,3);
MSG_FILTERED=fftshift (fft (msg_filtered,length(msg_filtered))/length(msg_filtered)); %frequency spectrum of filtered message signal
plot(fr,abs(MSG_FILTERED));
title('Frequency Spectrum of Filtered Message Signal');
xlabel('Frequency');
ylabel('Magnitude');