t=Elmotxtchartver20; % time t [s]
A=VarName2; % Phase A
B=VarName3; % Phase B
C=VarName4; % Phase C
ia=VarName5; % Active Current;
Hall=VarName6; % Hall Sensor

figure
plot(t, A)
hold on
plot(t, B)
hold on
plot(t, C)
hold off
xlabel(' Time t [s]')
ylabel(' Phase A, Phase B, Phase C')
legend('Phase A','Phase B','Phase C')

figure
plot(t, ia)
xlabel(' time t [s]')
ylabel(' Active Current [A]')
legend('Active Currnet [A]')

figure
plot(t, Hall)
xlabel(' time t [s]')
ylabel(' Hall Sensor')
legend(' Active Current [A]')

