Vsursa=43; % V
rph=3.3; % ohm
Ip=6.5; % A
ke=2;
kt=2;
R=rph*2;

% Pin = 3*rph*Ip; 
% Pmec = Tr * OMEGA
% Tr_1 = kt*Ip;


% Omega = (Vsursa - Ip*rph*2)/ke;


for n=1:1:Ip
    
    Ip(n)=n;
   % Omega(n) = Vsursa/ke - (kt*Ip(n)*rph)/(ke*kt);  >> Rezultate eronate  
    OMEGA(n)=(Vsursa-Ip(n).*rph*2)/ke;
    speed(n)=(OMEGA(n)*60)/(2*pi);
    Tr(n)=kt*Ip(n);
    
%     Pin(n)=3*rph*Ip(n);
%     Pmec(n)=Tr(n)*OMEGA(n); 
    
  
    
end


figure
plot(Ip, OMEGA)
xlabel(' Ip [A]')
ylabel(' OMEGA [rad/s]')
grid on

figure
plot(Ip, speed)
xlabel(' Ip [A]')
ylabel(' speed [rpm]')
grid on

figure
plot( Ip, Tr )
xlabel(' Ip [A]')
ylabel(' Tr [Nm]')
grid on

% figure
% plot(Tr, Pmec)
% xlabel(' Tr[Nm] ')
% ylabel(' Pmec ')

figure 
plot(speed, Tr)
xlabel(' speed [rpm]')
ylabel(' Tr [Nm]')
title('Torque - Speed Characteristics')
grid on
