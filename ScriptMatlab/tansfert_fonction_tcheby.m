
% Constantes
wc = 3000*15*2*pi;
wmin1=wc-(15*1e3*2*pi);
wmin2=wc+(15*1e3*2*pi);
b = 400*15*2*pi;
w0=sqrt(wmin1*wmin2);

s = tf('s');

% Expression originale
X = (s^2 + w0^2)/(b*s);
H = 1/(X^2 + 0.6449*X + 0.707948);

figure();
xline(wc,'r--','LineWidth',1.5);
yline(0,'g--','LineWidth',1.5);
yline(-3,'g--','LineWidth',1.5);
yline(-30,'g--','LineWidth',1.5);
hold on
bode(H)
zpk(H)


[mag, ~] = bode(H);
mag = squeeze(mag);
mag_db = 20*log10(mag);

%Calcul des étages
e1=[1 1.153e04 7.208e10];
e2 =[1 1.279e04 8.867e10];
format short e
e1_norm = e1./(e1(3)/2);
e2_norm = e2./(e2(3)/2);
numerateur = 1.42e9/(e1(3)/2*e2(3)/2);

fprintf('Etage 1: %.2e %.2e %d\n',e1_norm.');
fprintf('Etage 2: %.2e %.2e %d\n',e2_norm.');
fprintf('Numerateur: %.2e \n',numerateur);