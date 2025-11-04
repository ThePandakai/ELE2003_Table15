
% Constantes
w=2*pi;
kNT=15*1000;
fc = 3*kNT;
fmax1=(fc-(0.2*kNT));
fmax2=(fc+(0.2*kNT));
wmax1=fmax1*w;
wmax2=fmax2*w;
b = .4*kNT*w;
wc=sqrt(wmax1*wmax2);
s = tf('s');

% Expression originale
X = (s^2 + wc^2)/(b*s);
H = 1/(X^2 + 0.644900*X + 0.707948);

figure();
xline(fc*w,'r--','LineWidth',1.5);
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
e1=[1 1.153e04 7.174e10];
e2 =[1 1.279e04 8.883e10];
format short e
e1_norm = e1./(e1(3)/2);
e2_norm = e2./(e2(3)/2);
numerateur = 1.42e9/((e1(3)/2)*(e2(3)/2));

fprintf('Etage 1: %.2e %.2e %d\n',e1_norm.');
fprintf('Etage 2: %.2e %.2e %d\n',e2_norm.');
fprintf('Numerateur: %.2e \n',numerateur);