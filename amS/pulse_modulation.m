% clc;
% close all;
% clear all;
% a = 10;
% f = 10;
% t = 0:0.02:2; 
% x1 = 1;  %generation of an impulse signal
% x2 = a*sin(2*pi*f*t); %generation of sine wave
% y = x1.*x2; %modulation step
% subplot(3,1,1); %for impulse signal plot
% stem(x1);
% title('Impulse Signal');
% xlabel('Time');
% ylabel('Amplitude ');
% subplot(3,1,2) %for sine wave plot
% plot(t,x2);
% title('Sine Wave');
% xlabel('Time ');
% ylabel('Amplitude ');
% subplot(3,1,3) %for PAM wave plot
% stem(t,y);
% title('PAM Wave');
% xlabel('Time');
% ylabel('Amplitude');
% PAM using Natural Sampling ---------------------
% clc;
% clear all;
% close all;
% fc= 100;
% fm= fc/10;
% fs= 100*fc;
% t=0:1/fs:4/fm;
% Am = 10;
% Ac = 10;
% Msg_sgl= Am*cos(2*pi*fm*t);
% Carr_sgl= Ac*square(2*pi*fc*t)+Ac;
% Mod_sgl= Msg_sgl.*Carr_sgl;
% tt= [];
% for i=1:length(Mod_sgl);
%     if Mod_sgl(i)==0;
%         tt=[tt,Mod_sgl(i)];
%     else
%         tt=[tt,Mod_sgl(i)+2];
%     end
% end
% figure(1)
% subplot(4,1,1);
% plot(t,Msg_sgl);
% title('Message Signal');
% xlabel('Time Period');
% ylabel('Amplitude');
% subplot(4,1,2);
% plot(t,Carr_sgl);
% title('Carrier Signal')
% xlabel('Time Period');
% ylabel('Amplitude');
% subplot(4,1,3);
% plot(t,Mod_sgl);
% title('PAM Modulated signal')
% xlabel('Time Period');
% ylabel('Amplitude');
% subplot(4,1,4);
% plot(t,tt);
% title('PAM')
% xlabel('Time Period');
% ylabel('Amplitude');
% 
% % --------- EDITED me --------
% % Fourier Transform
% L = length(Mod_sgl);
% Y = fft(Mod_sgl);
% P2 = abs(Y/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% f = fs*(0:(L/2))/L;
% 
% figure;
% plot(f,P1);
% title('Single-Sided Amplitude Spectrum of PAM Modulated Signal') 
% xlabel('f (Hz)'); 
% ylabel('|P1(f)|');
% % PWM Signal --------------------------
clc;
close all;
clear all;
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
plot(t,pwm,'g',t,m,'r',t,s,'b');
ylabel('Amplitude');
axis([0  1 -1.5 1.5]);
xlabel('Time index');
title('PWM Wave');
grid on;
% % % PPM Signal -----------------------------
% clc;
% clear all;
% close all;
% fc=1000;
% fs=10000;
% fm=200;
% % t=0:1/fs:4/fm;
% t=0:1/fs:((2/fm)-(1/fs));
% X= 0.1*cos(2*pi*fm*t)+0.1;
% Y= modulate(X,fc,fs,'PPM');
% subplot(2,2,1);
% plot(X);
% title('Msg Signal');
% subplot(2,2,2);
% plot(Y);
% axis([0 500 -0.2 1.2]);
% title('PPM');
