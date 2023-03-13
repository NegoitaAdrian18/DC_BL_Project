t=DisplayNo; % time [s]
A=XNo; % Phase A
B=YNo; % Phase B
C=ZNo; % Phase C
ia=XUnit; % Active Current [A]
Hall=YUnit; % Hall Sensor

mu=mean(ia);
sigma=std(ia);

x=mu-3*sigma:0.001:mu+3*sigma;
f=normpdf(x,mu,sigma);
F=normcdf(x,mu,sigma);
subplot(1,2,1);
plot(x,f,'k-')
grid on
title('Densitatea de probabilitate')
subplot(1,2,2)
plot(x,F,'k-')
grid on
title('Functia de repartitie')

figure
plot(t, A)
hold on
plot(t, B)
hold on
plot(t, C)
hold off
xlabel(' time t[s]')
ylabel(' Phase A, Phase B, Phase C')

figure, plot(t, ia)
xlabel(' time t[s]')
ylabel(' ia [A]')

figure, plot(t, Hall)
xlabel(' time t[s]')
ylabel(' Hall Sensor')

