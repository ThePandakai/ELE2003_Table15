syms s

% Constantes
w0 = 90000*pi;
K = 12000*pi;

% Expression originale
X = (s^2 + w0^2)/(K*s);
H = 1/(X^2 + 0.6449*X + 0.0707948);

% Développer et réduire
H_simplified = expand(H);
[Num, Den] = numden(H_simplified);
Num_poly = collect(Num, s);
Den_poly = collect(Den, s);
disp(H_simplified);
disp(Num_poly);
disp(Den_poly);

% Convertir en vecteurs de coefficients
num_coeffs = sym2poly(Num_poly);
den_coeffs = sym2poly(Den_poly);

% Trouver le PGCD de tous les coefficients
all_coeffs = [num_coeffs den_coeffs];       % regroupe tous les coefficients
pgcd_coeffs = gcd(sym(all_coeffs));         % calcule le PGCD symbolique

% Diviser tous les coefficients par le PGCD
num_coeffs_simplified = double(num_coeffs / pgcd_coeffs);
den_coeffs_simplified = double(den_coeffs / pgcd_coeffs);

% Affichage
disp('PGCD des coefficients :');
disp(pgcd_coeffs);
disp('Numérateur simplifié :');
disp(num_coeffs_simplified);
disp('Dénominateur simplifié :');
disp(den_coeffs_simplified);

% Créer la fonction de transfert irréductible
H_tf = tf(num_coeffs_simplified, den_coeffs_simplified);
disp('Fonction de transfert irréductible :');
disp(H_tf);


p = den_coeffs_simplified(1)*s^4 + den_coeffs_simplified(2)*s^3 + den_coeffs_simplified(3)*s^2 + den_coeffs_simplified(4)*s + den_coeffs_simplified(5);
f = factor(p, 'FactorMode', 'real');
disp(f);

% Faire un graph de Bode ici (run pas, pas grave):

% grid on
% hold on
% 
% % Ajout des lignes pour voir notre bande-passante
% xline(w0,'r--','LineWidth',1.5);
% %Traçage du diagrame
% bode(H)
% 
% [mag, ~] = bode(H,w0);
% mag = squeeze(mag);
% mag_db = 20*log10(mag);