% ANÁLISIS VISUAL DE HIDROGRAMAS

% Importamos los datos de excel "Caudal"
% Creamos una varialble con el nombre Qdisponible
disp('Importación de excel el caudal disponible')
Qdisponible = Caudales
disp('Promedio del caudal disponible')
Prom = mean(Qdisponible)

% Qdemanda
disp('Cálculo del caudal de demanda')
Factor = input(['Valor del factor para multiplicar el promedio del caudal disponible',':'])
Qdemanda = Prom*Factor

% Diferencia entre Qdisponible - Qdemanda
disp('Diferencia entre el caudal disponible y el caudal de demanda')
Diferencia = Qdisponible - Qdemanda

% Importamos los datos de los días de excel "Days" para calcular el volumen
% Cálculo del Volumen (MM3)
disp('Importación de los días de cada mes')
Dias = Days 
disp('Cálculo del volumen en Mm^3')
Vol = Diferencia*3600*24.*Dias/1000000

% Acumulado
disp('Suma de los volumenes acumulados en Mm^3, comenzando con un valor inicial de 100')
Vol2 = cumsum(Vol)
Vol3 = Vol2 + 100

% Gráfica 1
disp('Gráficas')
Datos = [1972:21/252:1993-21/252]
y = Vol3
subplot(2,1,2)
plot(Datos,y)
title('Volúmenes medios mensuales acumulados - Estación Santa Eulalia (1972-1992)')
xlabel('Tiempo (mes)')
ylabel('Volumen potencial acumulado mensual (Mm^3)')
grid on 
lgd = legend('Vpotencial (Mm^3)','Location','southeast');
title(lgd,'Leyenda')
axis([1972-21/252,1993,0,800])
%axis([0,255,0,800])

% Gráfica 2
Datos = [1972:21/252:1993-21/252]
subplot(2,1,1)
plot(Datos,Qdisponible)
hold on;
y = Qdemanda
x1 = 1972-21/252
x2 = 1993
plot([x1, x2], [y, y])
title('Comparación entre Qdisponible y Qdemanda (1972-1992)')
xlabel('Tiempo (mes)')
ylabel('Qdisponible y Qdemanda (m^3/s)')
grid on 
lgd = legend('Qdisponible (m^3/s)','Qdemanda (m^3/s)');
title(lgd,'Leyenda')
axis([1972-21/252,1993,0,35])

% Picos
disp('Obtención de los picos:')
Picos = findpeaks(Vol3)

% Bajos
Vol3_inv = -Vol3
Bajos0 = findpeaks(Vol3_inv)
disp('Obtención de los bajos:')
Bajos = -Bajos0
%Diferencia de picos y bajos
disp('Diferencia de picos y bajos:')
Almacenamiento = Picos(1:22) - Bajos 

% Máximo almacenamiento
disp('CAPACIDAD HIDROLÓGICA')
Max_Almacenamiento = max(Almacenamiento)
