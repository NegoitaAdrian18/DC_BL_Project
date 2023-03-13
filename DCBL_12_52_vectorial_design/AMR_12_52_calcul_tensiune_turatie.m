
%ke = 2; % constanta B_emf
ke = 0.27; % constanta B_emf


%Ip=6.5; % [A]
Ip=16; % [A]

%U = 43 ; % [V]
U = 24 ; % [V]

%pp = 28; % numar de poli 
pp = 28; % numar de poli 

p = pp/2; % perechi de poli

%n = 250; % [rpm]  turatie
n = 300; % [rpm]  turatie

%fe_1=p*n/60; % [Hz_el]
%fm_1=fe_1/p; % [Hz_mec]



for i=1:1:n
    
    n(i)=i;
    
    fe(i)=p*(n(i)./60);
    fm(i)=fe(i)/p;
    OMEGA(i) = 2*pi*fm(i);
    U_alim(i) = ke*OMEGA(i);
    
    for j=1:1:7
        
        Ip(j)=j;
        
        r(j) = U*1/Ip(j);
        
    end
        
    
end

figure(1)
plot(U_alim, n)
xlabel(' U_alim [V] ')
ylabel(' n [rpm] ')
grid on

figure(2)
plot(Ip, r)
xlabel(' Ip [A] ')
ylabel(' r [ohm] ')
grid on

    

%OMEGA = 2*pi*fm_1; % [rad/s]

%U_alim = ke*OMEGA; % [V] tensiunea de alimentare
 
 
