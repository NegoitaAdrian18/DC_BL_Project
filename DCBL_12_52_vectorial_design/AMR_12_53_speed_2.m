Vsursa=43; % V
rph=3.3; % ohm
Ip=6.5; % A
ke=2;
kt=2;
R=rph*2;

OMEGA_NL = (0.95*Vsursa)/ke;

for i=1:1:OMEGA_NL
   
    OMEGA(i)=i;
    Tr(i)=((Vsursa-ke*OMEGA(i))*kt)/(2*rph);
    speed(i)=(60*OMEGA(i))/(2*pi);
    
end

figure(1)
plot(speed, Tr)
xlabel(' speed [rpm] ')
ylabel(' Tr [Nm] ')
grid on