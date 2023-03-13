t=Elmotxtchartver20;
A=VarName2;
B=VarName3;
C=VarName4;
ia=VarName5;
Hall=VarName6;

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
xlabel(' Time t [s]')
ylabel(' Active Current')
legend('Active Current')

figure
plot(t, Hall)
xlabel(' Time t [s]')
ylabel(' Hall Sensor')
legend('Hall sensor')

