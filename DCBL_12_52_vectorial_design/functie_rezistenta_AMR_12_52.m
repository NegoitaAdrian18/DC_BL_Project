    %%%  Rezistenta de faza >>> AMR 12_52  -> Bobinaj Concentrat


ro_cupru = 1.782*10^-8;                                         % [Ohm * m]
m = 3 ;                                                         % [faze ale motorului]

Z = input('Numar de crestaturi: ');

diz = input('Diametrul conductorului izolat [mm]: ');           % [mm] Diametrul conductoruluui izolat  ==>>> Diametrul conductorului izolat va fi de 0.65 [mm] 
d = diz-0.05;                                                   % [mm] Diametrul conductorului neizolat
sc = (pi*d^2)/4;                                                % [mm^2] Sectiunea conductorului 

h_cr_util = input('Inaltimea crestaturii utile [mm]: ');        % [mm] Inaltimea crestaturii utile

hcr_util = h_cr_util*10^-3;                                     % [m] Inaltimea crestaturii utile

bdinte = input('Latimea dintelui [mm]: ');                      % [mm] Latimea dintelui 
bd = bdinte *10^-3 ;                                            %  [m] Latimea dintelui 

L_axial_fe = input('Lungimea axiala de fier [mm]: ');           % [mm] Lungimea axiala a pachetului de tole stator
Lfe = L_axial_fe*10^-3;                                         % [m] Lungimea axiala  a pachetului de tole stator


l_cr_1 = input('Latimea Z_1: ');                                % [mm] Latimea crestataturii la nivelul penei de crestatura
lcr_1 = l_cr_1*10^-3; % [m]
l_Z_1_half = lcr_1/2;                                           % [m]  Latimea a jumatate din fereastra crestaturii la nivelul penei de crestatura

l_cr_2 = input('Latimea Z_2: ');                                % Latimea crestaturii la nivelul intrefierului 
lcr_2 = l_cr_2*10^-3; % [m]
l_Z_2_half = lcr_2/2;                                           % [m] Latimea a jumatate din fereastra crestaturii la nivelul jugului statorului 

%-------------------------------------------------------------------------------------------------------------------------------

l_Z_mediu = ((l_Z_1_half+l_Z_2_half))*10^3; 
l_Z_half = l_Z_mediu/2;

A_cr = ((lcr_1+lcr_2)/2)*sqrt((hcr_util)^2 - ((lcr_2-lcr_1)^2)/4);  % [m^2] Aria bruta a crestaturii 
Acr = A_cr*10^6;                                                % [mm^2] Aria bruta a crestaturii 

                                        % ARIA DE CUPRU din Crestatura

Ncond_z = round(Acr/diz^2);                                       % Numarul maxim de conductoare intr o crestatura

A_cu = Ncond_z * sc;                                            % [mm^2] Aria de cupru dintr-o crestatura

fill = A_cu/Acr;                                                % Factorul de umplere crestatura > arata cat la suta din aria crestaturii nu este umpluta cu cupru

                                        % ARIA CRESTATURII UTILE
                                        

A_cr_utila = fill*Acr;                                          % Aria crestaturii utile 


                                        % Numarul de conductoare fizice intr-o crestatura
                                        

Ncond1 = round(A_cr_utila/diz^2);                                % Numar de conductoare fizice ,  intr - o crestatura
Ncond = round(A_cr_utila/diz^2)-19;

                                        % Numar de conductoare fizice in jumatate de crestatura

                                        
Ncond_half = Ncond/2;                                           % Numar de condcutoare fizice, in jumatate de crestatura

%_____________________________________________________________________________________________________________________________

B_delta = 0.65;                                                 % [T] Inductia medie in intrefier 
n = 170;                                                        % [rpm] Turatie motor
OMEGA = (2*pi*n)/60;                                            % [rad/s]
DSint = 89*10^-3;                                               % [m] Diametrul statorului interior
RSint = DSint/2;                                                % [m] Raza rotorului exerioara
Ncond_ph = Ncond*Z/m;                                           % Numarul de conductoare pe faza
eph = 2*Ncond_ph*B_delta*Lfe*RSint;                       % [Vrms]
ke = 2*eph;
El_l = ke*OMEGA;


%______________________________________________________________________________________________________________________________


                                        % Numar de conductoare pe strat
                                        
n_cond_str = round(h_cr_util/diz) ;                                         
                                        

                                        % Numar de straturi in crestatura
                                        

str_z =  round(l_Z_half/diz);                                     % Numarul de straturi in crestatura



                                        % Numarul de straturi in jumatate din fereastra crestaturii

                                        
str_z_half = round(str_z/2);                                         
                                        
                                        % Numarul maxim de straturi pe dinte 
                                        
                        
                                        
str_z_dinte = str_z_half;                                          % Numarul maxim de straturi pe dinte






 if str_z_dinte <=  l_Z_half/diz
     disp('Numarul de straturi se incadreaza in jumatate din latimea ferestrei crestaturii')
 else
     disp('Numarul de straturi NU se incadreaza in jumatate din latimea ferestrei crestaturii')
 end
 
                                             % Lungimea unei spire pe strat
                                      
                                            
lsp_str_1 = 2*(Lfe + bd + 2*diz*10^-3);                         % Lungimea unei spire de pe primul strat
lsp_str_2 = 2*(Lfe + bd + 6*diz*10^-3);                         % Lungimea unei spire de pe al dilea strat
lsp_str_3 = 2*(Lfe + bd + 10*diz*10^-3);                        % Lungimea unei spire de pe al treilea strat

                                              % Lungimea spirelor pe strat
                                              
Lsp_str_1 = lsp_str_1*n_cond_str;                              % [m] Lungimea spirelor pe primul strat
Lsp_str_2 = lsp_str_2*n_cond_str;                              % [m] Lungimea spirelor pe al doilea strat
Lsp_str_3 = lsp_str_3*(Ncond_half-2*n_cond_str);               % [m] Lungimea spirelor pe al treilea strat %%{ Trebiuie optimizat }

Lsp_total = Lsp_str_1+Lsp_str_2+Lsp_str_3;                     % [m] Lungimea spirelor pe dinte

                                                % Rezistenta pe dinte
                                                
Rdinte = (ro_cupru * Lsp_total)/(sc*10^-6);                    % [ohm] Rezistenta pe dinte

Rph = Ncond_half*Rdinte                                       % [ohm] Rezistenta pe faza

Rl_l = 2*Rph                                                  % [ohm] Rezistenta intre doua faze



%_________________________________________________________________________________________________________________________

%  for n = 35:1:45
%      
%      Lfe(n) = n;
%      
%      lsp_str_1(n) = 2.*(Lfe(n) + bd + 2*diz*10^-3);                         
%      lsp_str_2(n) = 2.*(Lfe(n) + bd + 6*diz*10^-3);                         
%      lsp_str_3(n) = 2.*(Lfe(n) + bd + 10*diz*10^-3);
%  
%      Lsp_str_1(n) = lsp_str_1(n).*n_cond_str;                              
%      Lsp_str_2(n) = lsp_str_2(n).*n_cond_str;                              
%      Lsp_str_3(n) = lsp_str_3(n).*(Ncond_half-2*n_cond_str);               
%  
%      Lsp_total(n) = Lsp_str_1(n)+Lsp_str_2(n)+Lsp_str_3(n); 
%      
%      Rdinte(n) = (ro_cupru.* Lsp_total(n))./(sc*10^-6);
%      
%      Rph(n) = Ncond_half.*Rdinte(n) ;                                      
%  
%      Rl_l(n) = 2.*Rph(n);
%      
%      
%      figure(1)
%      plot(Lfe, Rl_l)
%      xlabel(' Lfe[mm]')
%      ylabel(' Rl_l [ohm]')
%      grid on
%      
%     for i = 1:1:5
%         bd(i)=i;
%         
%         lsp_str_1(i) = 2.*(Lfe + bd(i) + 2*diz*10^-3);                         
%         lsp_str_2(i) = 2.*(Lfe + bd(i) + 6*diz*10^-3);                         
%         lsp_str_3(i) = 2.*(Lfe + bd(i) + 10*diz*10^-3);
%         
%         Lsp_str_1(i) = lsp_str_1(i).*n_cond_str;                              
%         Lsp_str_2(i) = lsp_str_2(i).*n_cond_str;                              
%         Lsp_str_3(i) = lsp_str_3(i).*(Ncond_half-2*n_cond_str);               
% 
%         Lsp_total(i) = Lsp_str_1(i)+Lsp_str_2(i)+Lsp_str_3(i); 
%     
%         Rdinte(i) = (ro_cupru.* Lsp_total(i))./(sc*10^-6);
%     
%         Rph(i) = Ncond_half.*Rdinte(i) ;                                      
% 
%         Rl_l(i) = 2.*(Rph(i).*10^-3);
%     
%     
%     figure(2)
%     plot(bd, Rl_l)
%     xlabel(' bd [mm]')
%     ylabel(' R l_l [ohm]')
%     grid on
%         
%     end
%     
%end
%-------------------------------------------------------------------------------------------------------------------------
% 
% 
% for i = 1:1:5
%     
%     bd(i) = i;
%     
%     lsp_str_1(i) = 2.*(Lfe + bd(i) + 2*diz*10^-3);                         
%     lsp_str_2(i) = 2.*(Lfe + bd(i) + 6*diz*10^-3);                         
%     lsp_str_3(i) = 2.*(Lfe + bd(i) + 10*diz*10^-3);
% 
%     Lsp_str_1(i) = lsp_str_1(i).*n_cond_str;                              
%     Lsp_str_2(i) = lsp_str_2(i).*n_cond_str;                              
%     Lsp_str_3(i) = lsp_str_3(i).*(Ncond_half-2*n_cond_str);               
% 
%     Lsp_total(i) = Lsp_str_1(i)+Lsp_str_2(i)+Lsp_str_3(i); 
%     
%     Rdinte(i) = (ro_cupru.* Lsp_total(i))./(sc*10^-6);
%     
%     Rph(i) = Ncond_half.*Rdinte(i) ;                                      
% 
%     Rl_l(i) = 2.*(Rph(i).*10^-3);
%     
%     
%     figure(2)
%     plot(bd, Rl_l)
%     xlabel(' bd [mm]')
%     ylabel(' R l_l [ohm]')
%     grid on
%     
%     
% end
% legatura dintre curentul sin si cel drept. este data de sqrt(3/2)



