%Génération de la sinusoide%
duree = 4 %définition de la durée du signal
nbEchantillon = 101; %nombre échantillon
t = linspace (0,duree ,nbEchantillon) ;% Calcul  des  instants d’échantillonnage
s = sin(2*pi*t) 
figure (1) ;
subplot(2,1,1),plot(t,s),title('Signal émis')


%Génération du signal reçue sans attenuation
indice1 = 400
indice2 = 500
tps = [0:0.04:40]
signal_attenue = zeros(1,length(tps))
signal_attenue(indice1:indice2) = s
figure (2) ;
subplot(2,1,1),plot(tps,signal_attenue),title('Signal reçu sans attenuation')

%Génération du signal reçue avec attenuation
A1 =  0.5
tps1 = [0:0.04:25]
signal_attenue1 = zeros(1,length(tps1))
signal_attenue1(indice1:indice2) = A1*s
subplot(2,1,2),plot(tps1,signal_attenue1),title('Signal reçu avec attenuation')

%Gnération du signal reçue attenué et bruité
bruit1 = random('Normal',0,0.1,1,length(tps1))
signal_bruite = signal_attenue1 + bruit1
figure(3)
subplot(2,1,1),plot(tps1,signal_bruite),title('Signal reçu bruité')

%Gnération du signal reçue plus attenué et plus bruité
A2 = 0.3
tps1 = [0:0.04:25]
bruit2 = random('Normal',0,0.3,1,length(tps1))
signal_attenue2 = zeros(1,length(tps1))
signal_attenue2(indice1:indice2) = A2*s
signal_bruite = signal_attenue2 + bruit2
subplot(2,1,2),plot(tps1,signal_bruite),title('Signal reçu plus bruité')

%Filtre adapté%
%On cherche le max du signal pour ensuite retrouver la durée entre
%l'émission et la réception du signal
%Pour cela on fait l'autocorrélation avec du signal reçue avec le 
%le filtre
%on a comme filtre h(t) = x(t)