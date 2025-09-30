%% Shit pour le passe-bande Tcheby

%% Pour le H1, donc le passe-bas
% valeurs feuille Allan (vérifiées)
cste_s2 = 1.38e-11;
cste_s = 1.6e-7;

% trucs posé 
q = 1;
C = 100e-12;


r=cste_s/(2*C)
m3=cste_s2/(C^2*r^2*q)

m = 30; % posé pour avoir un C qui est dans notre kit 

% Calculs des valeurs
R = sqrt(cste_s2/(C^2 * m * q)) % donne environ 1.19k
C2=m3*C



%% Pour le H2, donc le passe-haut
%valeur feuille Allan (vérifiées)
numerateur = 1.13e-11;
cste2_s2 = 1.13e-11;
cste2_s = 1.43e-7;

% trucs posés
C2 = 1e-9;

% calculs des valeurs
R2 = sqrt(numerateur)/C2 % donne environ 15.28
q2 = cste2_s/(R2*C2*2)
m2 = 1/q2

R_du_haut = R2/m2 %environ 39.9 MOhm
R_du_bas = R2/q2 %environ 1.16 MOhm

%% Faire un graph aussi pcq je suis le seul à ne pas en avoir fait :(

H_1 = 1/(s^2 * 1.38e-11 + s * 1.6e-7 + 1);
H_2 = s^2 * 1.13e-11/(s^2 * 1.13e-11 + s * 1.43e-7 + 1);
H = H_1*H_2;

xline(45e3*2*pi, 'r--');
yline(0,'g--');
hold on;
bode(H);
zpk(H);

% Trouver max pour ajouter circuit diviseur de tension 
[mag,~,w] = bode(H);
mag = squeeze(mag);
magdB = 20*log10(mag);

[picDeBode, idx] = max(magdB);
freqMax = w(idx);
fprintf('Maximum du Bode = %.2f dB\n', picDeBode);
H_3 = 10^(-picDeBode/20);

Hcorr = H_3 * H;
bode(Hcorr)

%% Calcul valeur du corrigeur (diviseur de tension)
Rc1 = 1e3; %posé
Rc2 = Rc1*(1-H_3)/H_3; % Donne 103k

