fs = 50; 
t = (0:2*fs+1)'/fs;


x = sin(2*pi*t) + sin(4*pi*t);


fc = 10; 
phasedev = pi/2;


tx = pmmod(x,fc,fs,phasedev);


rx = awgn(tx,10,'measured');


y = pmdemod(rx,fc,fs,phasedev);


figure; plot(t,[x y]);
legend('Original signal','Recovered signal');
xlabel('Time (s)')
ylabel('Amplitude (V)')
