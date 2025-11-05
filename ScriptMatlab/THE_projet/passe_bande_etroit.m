%% Test pour comprendre Antoniou
R1 = 5.6e3; R2 = 1e3; R3 = 5.6e3; R4 = 2e3;
CA = 0.047e-6; % fixe C_Antonio
L = (R1 * R3 * R4 * CA) / R2;

%% Test pour comprendre resonateur :

w_o = 2 * pi * 97.5e3;
C = 0.1e-6; % fixe C
R = 1000e3;

L = 1 / (C * w_o);
Q = R * C * w_o;


L = 1.6;
R4 = L * R2 / (R1 * R3 * CA); % calcul pour R4 de Antonio

%%% Conclusion, c'est tres envisageable, mais Antonio fuck tout

%% Test pour multiple feedback
w_o = 2 * pi * 97.5e3;
R =270; % R1 = R2 = R qu'on fixe
C = 470e-12; % C1 = C2 = C qu'on fixe

R3 = 2 / (R * C^2 * w_o^2);
Q = sqrt((2 * R3) / R) / 2; 
% pas ça 

%% Recommence : 
w_o = 2 * pi * 97.5e3;
Amin = 20; % truc standard
Amax = 3;  % ``
Dw_max = 5e3 * 2 * pi;
Dw_min = 1.5 * Dw_max;
k = Dw_max / Dw_min;

n = acosh(sqrt((10^(Amin/10) - 1)/(10^(Amax/10) - 1))) / (acosh(1 / k));

% FONCTION DE TRANSFERE
% s = ((s^2 + w_o^2) / Dw_max)
% (s2 + 0.626456s + 1.142448)(s + 0.626456)
s = tf('s');
r = (s^2 + w_o^2) / (s * Dw_max);
H = 1 / ((r^2 + 0.626456 * r + 1.142448) * (r + 0.626456));
zpk(H);
bode(H);

% etage 1 : 
% (s^2 + 9583s + 3.561e11)
a1 = 9583;
b1 = 3.561e11;
w_o1 = sqrt(b1);
Q1 = w_o1 / a1;
R1 = 1e3; % R11 = R21
C1 = 470e-12;
R31 = 2 / (R11 * C1^2 * w_o^2);

% etage 2 :
% (s^2 + 1.968e04s + 3.753e11)
a2 = 1.968e04;
b2 = 3.753e11;
w_o1 = sqrt(b2);
Q2 = w_o1 / a2;
R2 = 1e3;
C2 = 330e-12;
R32 = 2 / (R2 * C2^2 * w_o^2);

% etage 3 :
% (s^2 + 1.01e04s + 3.955e11)
a3 = 1.01e04;
b3 = 3.955e11;
w_o1 = sqrt(b3);
Q3 = w_o1 / a3;
R3 = 1e3;
C3 = 220e-12;
R33 = 2 / (R3 * C3^2 * w_o^2);

