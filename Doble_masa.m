% AN�LISIS DE DOBLE MASA

% Importar datos de excel "Doble_masa"

Precipitaciones_acu_chosica = Doblemasa(:,2)
Precipitaciones_acu_santa = Doblemasa(:,4)

plot(Precipitaciones_acu_santa,Precipitaciones_acu_chosica,'-o')
lgd = legend('Estaci�n Chosica','Location','northwest');
title(lgd,'Leyenda')
grid on
axis([780,1620,300,800])

% Gr�fica 
title('Diagrama de doble masa de las precipitaciones anuales')
xlabel('Precipitaciones Acumuladas de la Estaci�n Santa Eulalia (mm)')
ylabel('Precipitaciones Acumuladas de la Estaci�n Chosica (mm)')
grid on 

