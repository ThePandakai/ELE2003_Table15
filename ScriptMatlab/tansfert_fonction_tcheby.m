sym s

% Constantes
w0 = 90000*pi;
K = 6000*2*pi;

s = tf('s');

% Expression originale
X = (s^2 + w0^2)/(b*s);
H = 1/(X^2 + 0.6449*X + 0.707948);
H1 = 1/((1.38*10^-11)*s^2 +(1.6*10^-7)*s +1)
H2= (1.13*10^-11)*s^2/((1.13*10^-11)*s^2 +(1.43*10^-7)*s +1)
H3=tf(0.297)
figure();
xline(45000*2*pi,'r--','LineWidth',1.5);
xline(fmin1,'r--','LineWidth',1.5);
xline(fmin2,'r--','LineWidth',1.5);
xline(fmax1,'r--','LineWidth',1.5);
xline(fmax2,'r--','LineWidth',1.5);
yline(0,'g--','LineWidth',1.5);
yline(-3,'g--','LineWidth',1.5);
yline(-30,'g--','LineWidth',1.5);
hold on
bode(H)
bode(H1)
bode(H2)
bode(H3)
zpk(H)


[mag, ~] = bode(H, [fmin1 fmin2 fmax1 fmax2]);
mag = squeeze(mag);
mag_db = 20*log10(mag);

fprintf('fmin1 %.2f dB\nfmin2 %.2f dB\nfmax1 %.2f dB\nfmax2 %.2f dB\n',mag_db.')