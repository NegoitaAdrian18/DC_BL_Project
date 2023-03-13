
% Determinarea perioadei  tensiunii electromotoare induse in infasurarea statorului 
Z = 30; % Numar de crestaturi
doi_p = 28; % Numar de poli rotorici
p = doi_p/2; % Perechi de poli
 
T_bemf_mec = 360/doi_p * 2; % [ grade mecanice]  %%% Perioada T_bemf exprimata in grade mecanice %%%

T_bemf_el = T_bemf_mec * p; % [ grade electrice]  %%% Perioada T_bemf exprimata in grade electrice%%%

%%% Control angle < gama > between the phase currents coresponding to the phase Bemf: > Represent HALF the period of the BEMF {Can be expressed as the equivalent electrical degree } 

gama = T_bemf_mec/2; % control angle

%%% Perriod of Cogging Torque %%%

L = lcm(doi_p, Z);
Tcogg = 360/L; % [s]


Usursa = 40; %[V]
R = 3.3;
I = 3;
ke = 2;

OMEGA_b = (Usursa - 2*R*I)/ke;
n_rpm = (60*OMEGA_b)/(2*pi);

        
     