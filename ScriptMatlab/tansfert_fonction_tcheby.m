syms s

% Constantes
w0 = 90000*pi;
K = 6000*2*pi

s = tf('s');

% Expression originale
X = (s^2 + w0^2)/(K*s);
H = 1/(X^2 + 0.6449*X + 0.707948);

xline(45000*2*pi,'r--','LineWidth',1.5);
yline(0,'g--','LineWidth',1.5);
hold on
bode(H)
zpk(H)