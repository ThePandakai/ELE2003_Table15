%%Fonction de transfert et diagramme de Bode

s=tf('s');%Déclaration de la variable

%Les fréquences et fonction de transfert
wc=15000 * 2 * pi;
w3=(15000+6750) * 2 *pi;
H = 1/(((s^2)/(wc^2) + s/wc + 1)*(s/wc+1));
zpk(H)

grid on
hold on

%Ajout des lignes pour voir notre bande-passante
xline(wc,'r--','LineWidth',1.5);
xline(w3,'r--','LineWidth',1.5);
%Traçage du diagrame
bode(H)

[mag, ~] = bode(H, [wc w3]);
mag = squeeze(mag);
mag_db = 20*log10(mag);



fprintf("À la fréquence de coupure, l'amplitude est %.2f.\nÀ la fin " + ...
    "de la bande passante, l'amplitude est %.2f.\n",mag_db);
