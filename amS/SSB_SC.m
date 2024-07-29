
            % Defining message signal
            fm = F; % Frequency of message signal
            Am = A; % Amplitude of message signal
            t = 0:0.001:1; % Time base
            
            % Message signal
            m = Am*cos(2*pi*fm*t);
            
            % Defining carrier signal
            fc = 10*fm; % Frequency of carrier signal
            Ac = Am; % Amplitude of carrier signal
            
            % Carrier signal
            c = Ac*cos(2*pi*fc*t);
            
            % Modulated signal
            sb = m.*cos(2*pi*fc*t) - m.*sin(2*pi*fc*t);
            
            % Demodulated signal
            demod_sb = hilbert(sb);
            demod_sb = abs(demod_sb);
            
            % Filtering and scaling demodulated signal
            [b,a] = butter(5,2*fm/fc);
            demod_sb_filtered = filter(b,a,demod_sb);
            scaling_factor = Am/max(demod_sb_filtered);
            demod_sb_scaled = scaling_factor*demod_sb_filtered;
            
            % Plotting signals in time domain
            plot(app.message, t,m);
%             title('Message Signal');

            plot(app.carrier, t,c);
%             title('Carrier Signal');
            
            plot(app.modulated, t,sb);
%             title('Modulated Signal');
            
% %            ----- Edited -----
            m1 = abs(m);
            ylim(app.Time_domain, [0,Am]);
            plot(app.Time_domain, t,demod_sb_scaled);
            hold(app.Time_domain, 'on');
            plot(app.Time_domain, t,m1, 'LineWidth',2);
            hold(app.Time_domain, 'off');
%             title('Demodulated Signal');
            
            % Plotting signals in frequency domain
            N = length(t);
            f = (-N/2:N/2-1)*(1/(t(2)-t(1)))/N;
            sbu = fftshift(fft(sb))/N;
            sbl = fftshift(fft(m.*2.*cos(2*pi*fc*t) + m.*2.*sin(2*pi*fc*t)))/N;
            
            plot(app.message_2, f,abs(fftshift(fft(m))));
%             title('Frequency Spectrum of Message Signal');

            plot(app.carrier_2, f,abs(fftshift(fft(c))));
%             title('Frequency Spectrum of Carrier Signal');
            
            plot(app.modulated_2, f,abs(sbu));
%             title('Modulated Signal Spectrum');
            
            plot(app.Freq_domain, f,abs(sbl));
            hold(app.Freq_domain, 'on');
            plot(app.Freq_domain, f,abs(fftshift(fft(c))), 'LineWidth',2);
            hold(app.Freq_domain, 'off');
%             title('Demodulated Signal Spectrum');
