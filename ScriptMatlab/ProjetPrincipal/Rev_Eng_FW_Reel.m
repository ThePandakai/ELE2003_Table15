
function H = calculH(R1,R2,R5,C3,C4)
    s=tf('s');
    H= (-s * (1/(R1*C4)))/(s^2 +(C3+C4)/(C3*C4*R5)*s+ 1/(C3*C4* R5) *(1/R1 + 1/R2));
end

%% H1
R1 = 3250;
R2 = 327;
R5 = 5500;
C3 = 2.33 *1e-9;
C4 = 2.04*1e-9;
H1 = calculH(R1,R2,R5,C3,C4)



%% H2
R1 = 3850;
R2 = 385;
R5 = 9500;
C3 = 2.01 *1e-9;
C4 = 1.97*1e-9;
H2 = calculH(R1,R2,R5,C3,C4)

%% H3
R1 = 2650;
R2 = 149;
R5 = 11000;
C3 = 2.2 *1e-9;
C4 = 2.05*1e-9;
H3 = calculH(R1,R2,R5,C3,C4)
%% H4
R1 = 3830;
R2 = 218;
R5 = 17000;
C3 = 2.2 *1e-9;
C4 = 2.2*1e-9;
H4 = calculH(R1,R2,R5,C3,C4)

%% H
H=H1*H2*H3*H4
hold on
xline(47500*2*pi, 'r--', 'LineWidth', 1.5);  % red dashed line at x = fc
xline(37500*2*pi, 'b--', 'LineWidth', 1.5);  % red dashed line at x = fc
xline(57500*2*pi, 'b--', 'LineWidth', 1.5);  % red dashed line at x = fc
bode(H);

hold off