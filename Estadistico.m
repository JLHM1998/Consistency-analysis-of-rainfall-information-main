% ANÁLISIS ESTADÍSTICO

disp('Valores de nuestra muestra muestra N1')
N1 = Qdisponible(1:168)
disp('Valores de nuestra muestra muestra N2')
N2 = Qdisponible(169:252)

% Gráfica N1 y N2
disp('Gráficas')
Datos = [1972:21/252:1993-21/252]
y = Vol3
subplot(2,1,2)
plot(Datos(1:168),y(1:168))
hold on;
plot(Datos(169:252),y(169:252))
title('Volumenes medios mensuales acumulados - Estación Santa Eulalia (1972-1992)')
xlabel('Tiempo (mes)')
ylabel('Volumen potencial acumulado mensual (Mm^3)')
grid on 
lgd = legend('N1','N2','Location','southeast');
title(lgd,'Leyenda')
axis([1972-21/252,1993,0,800])

% Gráfica N1 Y N2
Datos = [1972:21/252:1993-21/252]
subplot(2,1,1)
plot(Datos(1:168),Qdisponible(1:168))
hold on;
plot(Datos(169:252),Qdisponible(169:252))
title('Comparación entre Qdisponible y Qdemanda (1972-1992)')
xlabel('Tiempo (mes)')
ylabel('Qdisponible y Qdemanda (m^3/s)')
grid on 
lgd = legend('N1','N2');
title(lgd,'Leyenda')
axis([1972-21/252,1993,0,35])

% Número de datos
n1 = length(N1)
n2 = length(N2)

% Promedio de N1 y N2
PromedioN1= mean(N1)
PromedioN2= mean(N2)

% Varianza de N1
Desv_estandarN1 = std(N1)
VarianzaN1 = Desv_estandarN1^2

% Varianza de N2
Desv_estandarN2 = std(N2)
VarianzaN2 = Desv_estandarN2^2

% PRUEBAS ESTADÍSTICAS

% PRUEBA DE FISHER:

% Hipótesis nula -> Ho : Varianza N1 = Varianza N2
% Hipótesis alterna -> Ha : Varianza N1 ~= Varianza N2 

% F calculado
disp('Prueba de Fisher')
F_calculado =  VarianzaN1/VarianzaN2

% F Teórico
Alpha = input(['Ingrese el nivel de significación (alpha)',':']) 
P_valor = fcdf(F_calculado, n1-1, n2-1)
F1 = finv(Alpha/2,n1-1,n2-1)
F2 = finv(1-Alpha/2,n1-1,n2-1)

% Rechazo o aceptación de la muestra
if F1 < F_calculado < F2
    disp('HIPÓTESIS ACEPTADA')
elseif F_calculado < F1 | F_calculado > F2
    disp('HIPÓTESIS RECHAZADA')
elseif P_valor > Alpha
    disp('HIPÓTESIS ACEPTADA')
elseif P_valor < Alpha
    disp('HIPÓTESIS RECHAZADA')
end

% Sí, la hipótesis de la prueba de Fisher es aceptada, podremos realizar la
% prueba T-student

% PRUEBA T-STUDENT:

% Hipótesis nula -> Ho : Promedio N1 = Promedio N2
% Hipótesis alterna -> Ha : Promedio N1 <> Promedio N2 

% Cálculo de T calculado
disp('Prueba T-student')
T_calculado = (PromedioN1-PromedioN2)/(((n1-1)*VarianzaN1+(n2-1)*VarianzaN2)*((1/n1)+(1/n2)/(n1+n2-2)))^(1/2)

% T teórico
GD = min(n1-1,n2-1)
disp('T teórico')
T1 = tinv(Alpha/2, GD)
T2 = tinv(1-Alpha/2,GD)

% Rechazo o aceptación de la muestra
if T1 < T_calculado < T2
    disp('HIPÓTESIS ACEPTADA')
elseif T_calculado < T1 | T_calculado > T2
    disp('HIPÓTESIS RECHAZADA')
end



