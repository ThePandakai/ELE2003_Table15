% Définition de H1
H1 = 1.78e-2;

% Création du système de transfert
sys1 = tf(H1);

% Diagramme de Bode
figure;
bode(sys1)
grid on
title('Diagramme de Bode de H1')

% Définition de s
s = tf('s');

% Définition de H2
H2 = 1 / (1.25e-11*s^2 + 2.42e-7*s + 1);

% Diagramme de Bode
figure;
bode(H2)
grid on
title('Diagramme de Bode de H2')

% Définition de H3
H3 = (1.25e-11*s^2) / (1.25e-11*s^2 + 6.3e-8*s + 1);

% Diagramme de Bode
figure;
bode(H3)
grid on
title('Diagramme de Bode de H3')

% Définition de H
H = H1 * H2 * H3;

% Diagramme de Bode
figure;
bode(H)
grid on
title('Diagramme de Bode de H')
