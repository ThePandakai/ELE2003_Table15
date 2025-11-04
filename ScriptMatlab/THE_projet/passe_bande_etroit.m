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

R4 = L * R2 / (R1 * R3 * CA); % calcul pour R4 de Antonio

%%% Conclusion, c'est tres envisageable

%% Test pour multiple feedback

R =270; % R1 = R2 = R qu'on fixe
C = 470e-12; % C1 = C2 = C qu'on fixe

R3 = 2 / (R * C^2 * w_o^2);
Q = sqrt((2 * R3) / R) / 2;

