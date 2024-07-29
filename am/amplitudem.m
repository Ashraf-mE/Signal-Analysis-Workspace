m = 1;  
Am = 1;   
fm = 10;  
fs = 100*fm;  

Tm = 1/fm;    
t = 0:1/fs:5*Tm;   
ym = Am*sin(2*pi*fm*t);  
  
plot(t,ym); 

xlabel("time (secs) -->");
ylabel(" m(t)(Volts) ");
title ('Time domain Message Signal');

Ac = Am/m;    
fc = 20*fm;  
yc = Ac*sin(2*pi*fc*t);   


plot(t,yc); 
ylabel ('ycarrier(Volts)');
xlabel("time (secs) -->");
title ('Time Domain Carrier Signal');

AM = Ac*sin(2*pi*fc*t).*(1+m*sin(2*pi*fm*t)); 
plot(t,AM,'r');

xlabel ("time (secs) -->");
ylabel("AM(Volts)");
title ('time domain AM Signal');

L = length(t); 
Nf=L ;
AM_fft = fftshift(fft(AM,Nf));    
mf = fftshift(fft(ym,Nf));    
cf = fftshift(fft(yc,Nf));     
f = (-Nf/2:1:Nf/2-1)*fs/Nf;      
plot(f,abs(mf));  

xlabel("Frequency (Hz) -->");
ylabel(" |m(f)| ");
title ('Frequency domain Message Signal');

plot(f,abs(cf)); 
ylabel ('|c(f)|)');
xlabel("Frequency (Hz) -->");
title ('Frequency Domain Carrier Signal');

plot(f,abs(AM_fft)); 
title('Freq Response of AM Signal');
xlabel('frequency (Hz)');
ylabel(' |AM(F)|')


Vc = 2*AM.*sin(2*pi*fc*t);
[b,a] = butter(4,fc*2/fs);
ym_rec = filter(b,a,Vc);
ym_rec=ym_rec- mean(ym_rec); 

plot(t, ym_rec,'LineWidth',2);
plot(t,ym,'r');
title('demodulated AM signal with origional message signal');
legend("Demodulated AM signal","message signal");
xlabel('Time (s)');
ylabel('Amplitude (Volts)');

ym_rec_fft = fftshift(fft(ym_rec,Nf));
f = (-Nf/2:1:Nf/2-1)*fs/Nf;
plot(f,abs(ym_rec_fft));

title('Freq Response of demodulated AM signal y_m(t)');
xlabel('f(Hz)');
ylabel('|AM(F)|');

Nf=L;      
f_ym = fftshift(fft(ym,Nf));
f = (-Nf/2:1:Nf/2-1)*fs/Nf;
plot(f,abs(f_ym));
xlabel("frequency (Hz)");
ylabel("|m(f)|");
title("Frequency response of message signal m(t)");

