clc; clear all; close all;
fc= 100; fm= fc/10; fs= 100*fc;
t=0:1/fs:4/fm;
Am = 10; Ac = 10;
Msg_sgl= Am*cos(2*pi*fm*t);
Carr_sgl= Ac*square(2*pi*fc*t)+Ac;
Mod_sgl= Msg_sgl.*Carr_sgl;

% Fourier Transform
L = length(Msg_sgl);
Y = fft(Msg_sgl);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = fs*(0:(L/2))/L;

L1 = length(Carr_sgl);
Y1 = fft(Carr_sgl);
P21 = abs(Y1/L1);
P11 = P21(1:L1/2+1);
P11(2:end-1) = 2*P11(2:end-1);
f1 = fs*(0:(L1/2))/L1;

L2 = length(Mod_sgl);
Y2 = fft(Mod_sgl);
P22 = abs(Y2/L2);
P12 = P22(1:L2/2+1);
P12(2:end-1) = 2*P12(2:end-1);
f2 = fs*(0:(L2/2))/L2;

figure(1)
subplot(4,1,1); plot(t,Msg_sgl); title('Message Signal'); ;xlabel('Time Period'); ylabel('Amplitude');
subplot(4,1,2); plot(f,P1); title('Single-Sided Amplitude Spectrum of Message Signal') ;xlabel('f (Hz)'); ylabel('|P(f)|');
subplot(4,1,3); plot(t,Carr_sgl); title('Carrier Signal') ;xlabel('Time Period'); ylabel('Amplitude');
subplot(4,1,4); plot(f1,P11); title('Single-Sided Amplitude Spectrum of Carrier Signal') ;xlabel('f (Hz)'); ylabel('|P(f)|');


figure(2)
subplot(4,1,1); plot(t,Mod_sgl); title('PAM Modulated signal') ;xlabel('Time Period'); ylabel('Amplitude');
subplot(4,1,2); plot(f,P12); title('Single-Sided Amplitude Spectrum of Message Signal') ;xlabel('f (Hz)'); ylabel('|P(f)|');

% Demodulation
Demod_sgl= Mod_sgl.*Carr_sgl;
L3 = length(Demod_sgl);
Y3 = fft(Demod_sgl);
P23 = abs(Y3/L3);
P13 = P23(1:L3/2+1);
P13(2:end-1) = 2*P13(2:end-1);
f3 = fs*(0:(L3/2))/L3;

figure(3)
subplot(4,1,1); plot(t,Demod_sgl); title('Demodulated Signal'); xlabel('Time Period'); ylabel('Amplitude');
subplot(4,1,2); plot(f,P13); title('Single-Sided Amplitude Spectrum of Demodulated Signal'); xlabel('f (Hz)'); ylabel('|P(f)|');