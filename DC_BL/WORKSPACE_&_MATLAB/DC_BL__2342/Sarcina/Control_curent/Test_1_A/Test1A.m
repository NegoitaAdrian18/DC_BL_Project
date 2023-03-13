t=Elmotxtchartver20; % time t[s]
A=VarName2; % Phase A
B=VarName3; % Phase B
C=VarName4; % Phase C
ia=VarName5; % Active Current
Hall=VarName6; % Hall Sensor

figure
plot(t, A)
hold on
plot(t, B)
hold on
plot(t, C)
hold off
xlabel(' time t[s]')
ylabel(' Phase A')
legend('Phase A ','Phase B','Phase C')

figure 
plot(t, ia)
xlabel(' time t [s]')
ylabel(' Active Current [A]')
legend(' Active Current [A]')

figure
plot(t, Hall)
xlabel(' time t [s]')
ylabel(' Hall sensor')
legend(' Hall sensor')

mu=mean(ia);
s=std(ia);
x=mu-3*s:0.01:mu+3*s;
f=normpdf(x,mu,s);
F=normcdf(x,mu,s);

figure
subplot(1,2,1);
plot(x,f,'k')
grid on
title('Densitatea de probabilitate')
subplot(1,2,2)
plot(x,F,'k-')
grid on
title('Functia de repartitie')
