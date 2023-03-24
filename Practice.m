function comment_remover(varargin)
{
%% message signal m(t)=u(t+2)-u(t-2)
syms t f 
fc=10;%let carrier frequency frequency contain 10 Hz .x_carrier=cos(2*pi*10*t)
fm = 5;
% x =  heaviside(t+2)- heaviside(t-2) %% Fourier transform of m(t)
% X=fourier(x,f) ;% fourier transform
% %% using anonymous function
% XX = @(f) 2*(sin(2*f)./(f))
% f=-100:0.01:100-0.01;% proper frequency range .Avoiding 0 / 0.
% %% Generation of  DSB-SC
% Xshift=( XX(f-fc)+XX(f+fc));
% %% Designing VSB shaping filter characteristic
% % Define normalized VSB shaping filter
% Hf = @(f) ((f>=9 & f<=20)) ;
% %% Generating SSB
% SSB =@(f) Xshift.*(f>=10 & f<=50) + Xshift.*(f<=-10 & f>=-50);
% %%Here I am just plotting SSB-SC and VSB modulation signals.you can also
% %%plot Hf(f) characteristic normalized filter and DSB-SC from equation.
% %% Generation of VSB
% VSB_upper =  @(f)((XX(f-fm)+XX(f+fm)).*Hf(f)) %SSB(f).*Hf(f)SB_upper =  @(f)((XX(f-fm)+XX(f+fm)).*Hf(f)) %SSB(f).*Hf(f)
% subplot(211)
% %% ploting SSB
% plot(f,abs(SSB(f)),[-10,-10],[0,4],[10 10],[0,4],'r','linewidth',1.5);
% % set axis for visualize porpuse only
% xlim([-35 35]);
% grid on;ylim([0 6]);xlabel('frequency in Hz');ylabel('Magnitude spectrum');
% legend('| SSB-SC|');
% title('Single Sideband Modulation');
% %% ploting VSB
% subplot(212)
% plot(f,abs(VSB_upper(f)),'b',-f,abs(VSB_upper(f)),'k','linewidth',1.5);grid on;
% xlabel('frequency in Hz');ylabel('Magnitude spectrum');
% title('SSB');ylim([0 6]);legend('| VSB |');
% % set axis for visualize purpose
% xlim([-35 35]);
% % see carefully around 10 Hz .A vestige was found before +10 Hz and also in
% % case negative -10 Hz
% %% 
% I'm editing this file
}
