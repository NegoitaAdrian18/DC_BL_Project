% AMR 12-52 Calcul vectorial

i=6.5; %[A] - valoare de varf
r=6.6; %[ohm]
u=r*i; %[V] - valoare de varf
Ls=12; %[mH] - in Flux 2D am obtinut 13 [mH]

ke=2; %[Vs/rad] - constanta tensiunii electromotoare induse in infasurarea statorului 
kt=2; %[Vs/rad] - constanta de cuplu

p=14; %[perechi de poli]
% Tr_max = 12; [Nm]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  FROM ELMO   ---   SERVO MOTOR EFFICIENCY

% EX. ::  Motor ::  ke = 42.5 [V/KRPM];
%                   Tr = 40 [Nm];
%                   n = 1000 [rpm];
%         Drive ::  VDC = 73 [V];
%                   Imotor = 80[A];
%         Drives electrocal output power:   =  [sqrt(3)/2] * Imotor * VDC = 5022 [W];
%         Motor output mechanical power:    =   Tr * OMEGA = 4188 [W];
%
%       OBS|| The heat dissipation efficiency of the motor is  4188/5022 = 83[%]
%
%       The G-TWI80/80 delivers to the motor 5022 electrical watts, while
%       the motor produces only 4188 watts of mechanical power
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Z=30; %CRESTATURI
L_axial=45; %[mm] Lungimea axiala a pachetului de tole stator
delta=1; %[mm] Inaltimea intrefierului 
DSext=110; %[mm] Diametrul exterior al statorului
DRext=87; %[mm] Diametrul exterior al rotorului 
DSint=DRext+2*delta; %[mm] Diametrul interior al statorului 
DRint=74; %[mm] Diametrul interior al rotorului 

    % Dimensiuni Magnet Permanent
    
    L_axial = 45; %[mm] *** Lungimea axiala a magnetului 
    l_mp = 8; %[mm] *** latimea magnetului 
    h_mp = 4; %[mm] *** Inaltimea magnetului

D_delta_med=(DSint+DRext)/2; %[mm] Diametrul mediu la nivelul intrefierului

    % Aleg:
    kfe=0.95; % coeficient de immpachetare tole stator
    Bjs=1.55; % Inductia magnetica in jugul statorului 
    Bdinte=1.7; % Inductia magnetica in dintele statorului 
    Bdelta_med=0.65; % Inductia magnetica in intrefierul masinii
    
    % Fluxul magnetic fundamental pe pol
    % Suprafata polului 
Lfe = L_axial; 
Suprafata_pol=(pi*DSint*10^-3*Lfe*10^-3)/(2*p); 
tau_p=(pi*DSint*10^-3)/(2*p); % Pasul polar
l_radial_mp = l_mp*10^-3;       %[mm] latimea magnetului
alfa_pol = l_radial_mp/tau_p; % factor de acoperire polara

Flux_pol=alfa_pol*Suprafata_pol*Bdelta_med ; %[Wb] Fluxul magnetic pe pol

    % Inaltime jug stator
    
hjs = Flux_pol/(2*kfe*Lfe*10^-3*Bjs); %[m] Inaltimea jugului stator
hjs_mm=hjs*10^3; % [mm] Inaltiema jugului stator exprimata in mm

%   Dimensionare Crestatura

    % Latimea dintelui 
    
t = (pi*DSint*10^-3)/Z; % Pas dentar
bd = (t*Bdelta_med)/(kfe*Bdinte); % [m] Latime dinte
bd_mm = bd*10^3; % [mm] Latime dinte exprimata in mm

    % Dimensionare crestatura
    
so=1.5; %[mm]
h_istm=1; %[mm]
h_con=0.7; %[mm]

D3=DSext-2*hjs_mm; %[mm] Diametrul la baza jugului stator

hd=(D3-DSint)/2; %[mm] Inaltimea dintelui 

lcr_1=round((pi/Z)*(DSint+2*h_istm+2*h_con)-bd*10^3);
lcr_2=round((pi/Z)*(DSint+2*hd)-bd*10^3);

hcr_util = hd-h_con-h_istm;

Acr=((lcr_1+lcr_2)/2)*sqrt(hcr_util^2-((lcr_2-lcr_1)/4)^2); %[mm^2] aria crestaturii

Acr_m=Acr*10^-6;


fu=0.49;

Acr_util=fu*Acr;

    % Dimensiunile conductorului de cupru 
    
dc_iz = 0.7; %[mm] Diametrul condcutorului izolat
dc = 0.65; % [mm] Diametrul conductorului 
sc = (pi*dc^2)/4; % sectiunea conductorului 
fu_calc=sc/Acr_util;

    % Numarul de conductoare intr-o crestatura
    
n_cond = round(Acr_util/(dc_iz)^2); % Numar de condcutoare intr-o crestatura



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Calcul  Vectorial  %%%%%%%%%%%%%%%%%%%%%%%
    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


eo=0.95*u; %[V]

OMEGA=eo/ke; % [rad/s] - viteza unghiulara a rotorului necesara pentru a induce Bemf = eo

% Turatia exprimata in [rpm]
n_rpm=(60*OMEGA)/(2*pi); %[rpm]

% Turati exprimata in [rps]
n_rps = n_rpm/60; %[rps]

omega=2*pi*n_rps*p; %[rad/s] pulsatia campului magnetic rotoric

%Tensiunea electromotoare de faza este egala cu: eo_faza = eo/sqrt(3);
%Cu ajutorul Flux 2D am determinat tensiunea electromotoare de faza indusa
%ce este egala cu:
eo_faza=25; %[V]
Flux_MP=eo_faza/omega; %[Wb] - Fluxul magnetilor permanenti 


% Deoarece cunosc tensiunea si curentul, pot calcula cuplul electromagnetic
% mai departe:

% Cuplul electromagentic
id=0; %[A] - valoarea curentului pe axa "d" este nula {pentru motoare cu MP plasati la suprafata}
iq=i; %[A - valoarea curentului pe axa"q"  este egala cu valoarea curentului de alimentare
me=3/2*p*Flux_MP*iq; %[Nm] - Cuplul electromagnetic dezvoltat de motor la valoarea maxima a curentului de alimentare

% Calculul Fluxului statoric pe componente:

Flux_qs=Ls*10^-3*iq;  %[Wb]
Flux_ds=Flux_MP+Ls*10^-3*id;  %[Wb] 

% Determinarea turatiei de baza
%Din ecuatia de tensiuni  u = R*i+j*omega*Flux_s [V]
% Scrisa pe componente => usd = R*isd - omega*Flux_qs =       - omega*Flux_qs | ()^2
%                         usq = R*isq + omega*Flux_ds = R*isq + omega*Flux_ds | ()^2
%                                                     =        -  omega*0.078 | ()^2
%                                                     =6.6*6.5 + omega*0.0876 | ()^2

%   => usd^2 + usq^2 = Flux_qs^2 * (-omega)^2 + (Rs*isq)^2 + Flux_ds^2 *
%   omega^2 + (2 * Rs * is * Flux_MP * omega)
%   => usd^2 + usq^2 = 0.006084*omega^2 + 1840 + 0.007634*omega^2 + 7.5*omega
%   => usn^2 = 0.013718*omega^2 + 7.5*omega + 1840
%   => 1849 = 0.013718*omega^2 + 7.5*omega + 1840
%   => 0.013718*omega^2 + 7.5*omega + (1849 - 1840)
%   => 0.013718*omega^2 + 7.5*omega - 9  =  0 

omega_calcul=[0.013718 7.5 -9];
omega_12=roots(omega_calcul);

omega_baza=1.1974; %[rad/s] - valoare culeasa dupa ce am rulat calculele
n_baza=(60*omega_baza)/(2*pi); %[rpm]

usd = (-omega_baza)*Flux_qs; %[V]
usq = r*iq+omega_baza*Flux_ds; %[V]

us=sqrt(usd^2+usq^2); %[V]


%Calculul Puterilor

% P=3/2*Re{us*(is^*)}=3/2*Re{(usd+jusq)(isd-jisq)}=3/2*(usd*isd+usq*isq)
% Q=3/2*Im{us*(is^*)}=3/2*(usq*isd-usd*isq)
P=3/2*(usd*id+usq*iq); %[W]
Q=3/2*(usq*id-usd*iq); %[VAr]
S=sqrt(P^2+Q^2); %[vA]
cos_fi=P/S;

Ief=i/sqrt(2); %[A]
Pjs=3*(r/2)*Ief^2; %[W] Pierderi joule statorice

Pmec=P-Pjs; 

M_baza=Pmec/omega_baza; %[Nm]

randament=Pmec/P; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Calculul cuplului penru dublarea turatiei

omega_baza_2=2*omega_baza;

usq_calculat=((2.4*0.0874)^2+43^2-(6.6*6.5)^2-(2.4*12*10^-3*6.5)^2)/(2*2.4*0.0874);
usd_calculat=sqrt(u^2-usq_calculat^2);

isd_calculat=(usq_calculat+((r*usd_calculat)/(omega_baza_2*Ls*10^-3))-omega_baza_2*Flux_MP)/(r^2/(omega_baza_2*Ls*10^-3)+omega_baza_2*Ls*10^-3);

isq_calculat=sqrt(i^2-(-isd_calculat^2));

%Calcul puteri 

P_calculat=3/2*(usd_calculat*(-isd_calculat)+usq_calculat*isq_calculat);
Q_calculat=3/2*(usq_calculat*(-isd_calculat)-usd_calculat*isq_calculat);
S_calculat=sqrt(P^2+Q^2);

cos_fi_calculat=P/S;

for n=1:2:10
    
    iq(n)=n;
    omega_baza(n)=n;
    
    me(n)=3/2*p*Flux_MP*iq(n);   %[Nm] - Cuplul electromagnetic dezvoltat de motor la valoarea maxima a curentului de alimentare
    Pmec(n)=me(n)*omega_baza(n);
    
end

    plot(me, iq)
    ylabel('iq')
    xlabel('me')
    
    %figure,plot(me, Pmec)
    %ylabel('Pmec')
    %xlabel('me')
    
    
    
    
%  Calcul Cogging Torque %

% Consider o turatie constanta egala cu : n = 1/6 [rpm]  -> ceea ce corespunde unei rotatii cu un grad mecanic pe secunda.

% Slot pitch = 360/Z = 360/30 = 12 

% Step = 12/{nr de pct peste slot pitch} = 12/300 = 0.04

% In clc., este definit intervalul 0:12:0.04


