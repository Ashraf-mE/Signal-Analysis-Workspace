 %% DSB SC MODULATION AND DEMODULATION.
            
            %===========DEFINING THE SIGNALS==================
            t = 0:0.001:1; 
            m = 1;
            Am = 10;
            Ac = Am / m;
            fm = 10;
            fc = 10*fm;
            msg = audioread("shivam.wav");    %message signal
            carr = Ac*sin(2*pi*fc*t);   %carrier signal
            fs = 10000;                  %sampling frequency
            
            %% DSB SC MODULATION AND DEMODULATION
            %===========DSB SC IN TIME DOMAIN==================
            dsb_sc = msg.*carr; %dsb sc modulated wave
            
            %=====DSB SC IN FREQUENCY DOMAIN============
            ld=length (dsb_sc);
            f=linspace (-fs/2,fs/2,ld);
            DSB_SC=fftshift (fft (dsb_sc,ld)/ld); %frequency spectrum of dsb_sc modulated signal.
            
            %===========DSB SC DEMODULATION TIME DOMAIN============
%             msg_r=abs(hilbert(dsb_sc)).*2.*cos(2*pi*100*t);%demodulated signal

%             -------- Edited ME --------
            msg_r = 2*(dsb_sc.*carr)/(Ac*Am); %demodulated signal
            msg_r = lowpass(msg_r, 2*fc, fs); %corrected demodulated signal

            %===========DSB SC DEMODULATION FREQUENCY DOMAIN============
            lr=length (msg_r);
            fr=linspace (-fs/2,fs/2,lr); %frequency bins
            MSG_R=fftshift (fft (msg_r,lr)/lr); %frequency spectrum of demodulated signal
            
            %===========LOW PASS FILTER==================
            [b,a] = butter(6,2*fc/(fs/2)); % Butterworth filter of order 6 and cutoff frequency 2000 Hz
            msg_r = filter(b,a,msg_r); % Filtered message signal
            msg_r = msg_r - mean(msg_r); 

            %===========PLOTTING THE SIGNALS==================
            figure;
            plot(t,msg);
%             title('Message Signal');
            figure;
            plot(t,carr);
%             title('Carrier Signal');
                        figure;

            plot(t,dsb_sc);
%             title('DSB-SC Modulated Signal');
                        figure;

            plot( f,abs(fftshift(fft(msg))));
%             title('Frequency Spectrum of Message Signal');
            figure;

            plot( f,abs(fftshift(fft(carr))));
%             title('Frequency Spectrum of Carrier Signal');
            figure;

            plot(f,abs(DSB_SC));
%             title('Frequency Spectrum of DSB-SC Modulated Signal');
                          figure;

            plot(t, msg,'LineWidth',2);
                        figure;

            plot( t, msg_r, 'r');
%             title('Demodulated Signal');
                        figure;

            plot( fr,abs(MSG_R),'LineWidth',2);
                        figure;

            plot(f, abs(fftshift(fft(msg))), 'r')
%             title('Frequency Spectrum of Demodulated Signal');