power_of_2 = 1024;

Tr = MechanicalsetMagnetictorqueROTORNm1000; % 
Tr(end:power_of_2)=0;
Trq =MechanicalsetMagnetictorqueROTORNm;
 

t = TIME; 
t(end:power_of_2)=0;

t1=t(1,1); % t(rand, coloana)
t2=t(1,2); % t(rand, coloana)
dt=t2-t1;  % change in time

fs=1/dt; 


%x=1:power_of_2;

%%%  FFT Frequency  %%%
for i=1:power_of_2
    
    x(i)=i;
    f_fft(i)=x(i).*fs/power_of_2;

end

Y = fft(Tr);  % FFT on Tr signal

z = 2/power_of_2;

A = z.*abs(Y); % Amplitude

I = ifft(Y); % Invers fft


figure(1)
subplot(2,1,1)
plot(f_fft, A);
xlabel('f_fft')
ylabel('A')

figure(2)
subplot(2,1,1)
plot(TIME, Trq)
xlabel('Time [s]')
ylabel('Tr  [Nm]')

figure(3)
subplot(2,1,2)
plot(t,I)
xlabel('Time  [s]')
ylabel('I  ')

    