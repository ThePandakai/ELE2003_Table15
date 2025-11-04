%% Constantes
A_max=3;
A_min=20;
fc=(40+0.5*15)*1e3
w_max_sup=(fc+10000)*2*pi;
w_max_inf=(fc-10000)*2*pi;
w_min_sup=(fc+20000)*2*pi;
w_min_inf=(fc-20000)*2*pi;
%% Ordre du Filtre
k=(w_max_sup-w_max_inf)/(w_min_sup-w_min_inf)
termeHautLog = 10^(A_max/10) -1;
termeBasLog = 10^(A_min/10) -1;
n=ceil(log(termeHautLog/termeBasLog)/(2*log(k)))
%% Polynome et Bode
% N est égale à 4, alors:
s=tf('s');
bw = 20*1e3;
b=bw*2*pi;
wc = fc*2*pi;
r = (s^2 +wc^2)/(b*s);
hold on
xline(fc, 'r--', 'LineWidth', 1.5);  % red dashed line at x = fc
xline(37500, 'b--', 'LineWidth', 1.5);  % red dashed line at x = fc
xline(57500, 'b--', 'LineWidth', 1.5);  % red dashed line at x = fc
H=1/((r^2+(sqrt(2-sqrt(2)))*r+1)*(r^2+(sqrt(2+sqrt(2)))*r+1))
options = bodeoptions;options.FreqUnits = 'Hz';
bode(H,options)
zpk(H)

% Frequency vector (in Hz)
f = logspace(0, 6, 2000);     % 1 Hz → 1 MHz
w = 2*pi*f;                   % rad/s

% Compute frequency response
[mag, ~] = bode(H, w);
mag_db = 20*log10(squeeze(mag));

% Find maximum magnitude
[mag_max_db, idx_max] = max(mag_db);
f_max = f(idx_max);

% Find -3 dB cutoff points (band edges)
cross_idx = find(diff(mag_db > (mag_max_db - 3)) ~= 0);
f_3db_points = f(cross_idx);
mag_3db_points = mag_db(cross_idx);

% Create results table
T = table( ...
    ["f_max (Hz)"; "f_-3dB_1 (Hz)"; "f_-3dB_2 (Hz)"], ...
    [f_max; f_3db_points(:)], ...
    [mag_max_db; mag_3db_points(:)], ...
    'VariableNames', {'Parameter', 'Frequency_Hz', 'Magnitude_dB'} );

disp(T);



param = zeros(4,2);

H1 = [1 3.888e04 6.044e10];
H1s=(2.50e20^(1/4))*s/(s^2+7417*s+8.373e10);
bode(H1s);
param(1,1) = sqrt(H1(3))/(2*pi);
param(1,2) = param(1,1)*(2*pi)/H1(2);
H2 = [1 1.066e05 7.56e10];
H2s=(2.5e20^(1/4))*s/(s^2+1.824e04*s+8.682e10);
bode(H2s);
param(2,1) = sqrt(H2(3))/(2*pi);
param(2,2) = param(1,1)*(2*pi)/H2(2);
H3 = [1 1.256e05 1.05e11];
H3s=(2.5e20^(1/4))*s/(s^2+1.871e04*s+9.139e10);
bode(H3s)
param(3,1) = sqrt(H3(3))/(2*pi);
param(3,2) = param(1,1)*(2*pi)/H3(2);
H4 = [1 5.73e04 1.313e11];
H4s=(2.5e20^(1/4))*s/(s^2+7890*s+9.476e10);
bode(H4s)
param(4,1) = sqrt(H4(3))/(2*pi);
param(4,2) = param(1,1)*(2*pi)/H4(2);

param
%% Calcul H1
bw = 2*pi*20*1e3;
Q=param(1,2);
F0=param(1,1);
c = 2.2*1e-9;
k=2*pi*F0*c;
R1=1/(k);
R5 = 2*Q/k;
R2 =1/((2*Q-1)*k);
comp = [R1 R2 c c R5];
fprintf(' H1 \nR1 : %.0f R2 : %.0f C3 : %.2e C4 : %.2e R5 : %.0f\n ', comp);
%% Calcul H2
bw = 2*pi*20*1e3;
Q=param(2,2);
F0=param(2,1);
c = 2.2*1e-9;
k=2*pi*F0*c;
R1=1/(k);
R5 = 2*Q/k;
R2 =1/((2*Q-1)*k);
comp = [R1 R2 c c R5];
fprintf(' H2 \nR1 : %.0f R2 : %.0f C3 : %.2e C4 : %.2e R5 : %.0f\n ', comp);
%% Calcul H3
bw = 2*pi*20*1e3;
Q=param(3,2);
F0=param(3,1);
c = 2.2*1e-9;
k=2*pi*F0*c;
R1=1/(k);
R5 = 2*Q/k;
R2 =1/((2*Q-1)*k);
comp = [R1 R2 c c R5];
fprintf(' H3 \nR1 : %.0f R2 : %.0f C3 : %.2e C4 : %.2e R5 : %.0f\n ', comp);
%% Calcul H4
bw = 2*pi*20*1e3;
Q=param(4,2);
F0=param(4,1);
c = 2.2*1e-9;
k=2*pi*F0*c;
R1=1/(k);
R5 = 2*Q/k;
R2 =1/((2*Q-1)*k);
comp = [R1 R2 c c R5];
fprintf(' H4 \nR1 : %.0f R2 : %.0f C3 : %.2e C4 : %.2e R5 : %.0f\n ', comp);