
% Determinarea perioadei  tensiunii electromotoare induse in infasurarea statorului 

doi_p = 28; % Numar de poli rotorici
p = doi_p/2; % Perechi de poli
 
T_bemf_mec = 360/doi_p * 2; % [ grade mecanice]  %%% Perioada T_bemf exprimata in grade mecanice %%%

T_bemf_el = T_bemf_mec * p; % [ grade electrice]  %%% Perioada T_bemf exprimata in grade electrice%%%

%%% Control angle < gama > between the phase currents coresponding to the phase Bemf: > Represent HALF the period of the BEMF {Can be expressed as the equivalent electrical degree } 

gama = T_bemf_mec/2; % control angle

        
     