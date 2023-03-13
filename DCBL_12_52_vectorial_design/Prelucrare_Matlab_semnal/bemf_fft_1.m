power_of_2 = 512; % 2^9 = 512

t = TIME_3;
t(end:power_of_2)=0;

Ph1 = x3_Circuit_Voltage_V1_V2;
Ph1(end:power_of_2)=0;

power_of_2 = 512; % 2^9 = 512

x=1:power_of_2;

t1 = t(1,1);
t2 = t(1,1);
dt = t2-t1;

fs = 1/dt;

Y = fft(Ph1);

f_fft = x.*(fs/power_of_2); % fft frequency

z = 2/power_of_2;

Amp = z.*abs(Y); % fft Amplitude

figure(1)
plot(TIME, Ph1)
xlabel('Time  [s]')
ylabel('Ph1')

figure(2)
plot(f_fft, Amp)
xlabel('Frequency  [Hz]')
ylabel('Amplitude')

