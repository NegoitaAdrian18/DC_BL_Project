                        % Pentru a achizitiona un semnal:
                        %> y_(t) = semnalul analogic;
                        %> f_y(t) = frecventa cu care este achizitionat semnalul analogic y_t
                        %> intr-un sistem de calcul in timp real (numeric/discret), este nevoie 
                        %> de un numar "N" de masuratori, ce sunt achizitionate in timpul 
                        %> T_sample(t). 

                        % Exemplu
N=100; %............... numar de masuratorice sunt achizitionate
T_sample_t = 2;%........[s] timpul in care sunt achizitionate cele N masuratori
                %.......Acest timp se mai numeste si Timp de esantionare (sample time )
                %.......sau timpul in care sistemul preia masuratorile 
                
fs = N/T_sample_t;  %...Frecventa astfel obtinuta se numeste frecventa de esantionare
                    %...sau de achizitie (sample frequency)
                    
                        % OBS|| Pentru o achizitie corecta (adica semnalul achizitionat sa fie 
                        %       cat mai apropiat sau chiar asemanator cu cel original duapa reconstruirea 
                        %       lui din datele achizitionate), se recomanda
                        %       ca frecventa de esantionare / achizitie sa
                        %       fie mai mare decat frecventa maxima
                        %       vehiculata a fundamentalei din sistem
                        % Altfel apare fenomenul de ALIAS
                        
                        % Prevenirea fenomenului de ALIAS
                        
f_nyquist = 2*fs;       % Frecventa de preag impusa peste care fenomenul de Alias se reduce
                        % Aceasta se exprima ca fiind dublul frecventei
                        % vechiculate in sistem :
                        %  f_nyquist = 2 * f_y(t)
                        
                        % Enunt Teorema ||
                        %   Pentru a preveni fenomenul de ALIAS in procesul
                        %   de achizitie sau generare numerica / discreta
                        %   de semnal, se recomanda ca frecventa de
                        %   achizitie a semnalului sa fie mult mai amre
                        %   decat frecventa Nyquist (mai mare decat dublul frecventei fundamentale maxime 
                        %   vechiculate in sistem).
                        
                        % In cazul perioadei de esantionare (sample time),
                        % aceasta trebuie sa fie mult mai mica decat
                        % perdioada Nyquist.
                        % 
                
