U=40;
R=3.3;
L=12E-3;
kt=2;

%M=0.008;
%U=12;
%DUp=1.4;
%R=4;
%L=1.34e-3;
%kt=8.83e-3;
F=2.86*10^-6;   % coeficient de frecari vascoase
%J=0.7*10^-6;

% J = momentul de inertie [kg*m^2] = pi/32*(DRext^4 - DRint^4)*Lfe*ro_fe
%ro_fe = 7800 [Kg/m^3]
DRext = 87*10^-3; %[m] 
DRint = 73*10^-3; %[m]
Lfe = 40*10^-3; %[m]
J=pi/32*(DRext^4 - DRint^4)* Lfe* 7800; %[kg/m^2]



% OMEGA_b = (Usursa - 2*R*I)/ke; [rad/s]  ----------"varactor diode"-------


A=[-R/L -kt/L; kt/J -F/J];
B=[1/L 0; 0 -1/J];
C=[1 0; 0 1];
D=[0 0; 0 0];

for i = 1:1:6
    
    Ip(i)=i;
    Tr(i) = kt*Ip(i);
    
end



