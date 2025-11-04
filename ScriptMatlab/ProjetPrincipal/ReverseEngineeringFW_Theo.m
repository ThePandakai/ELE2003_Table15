function H = calculH(R1,R2,R5,C)
    s=tf('s');
    H= (-s * (1/(R1*C)))/(s^2 +(2*C)/(C^2*R5)*s+ 1/(C^2* R5) *(1/R1 + 1/R2));
end
%% H1
R1 = 2980;
R2 = 341;
R5 = 6400;
C = 2.2 *1e-9;
H1 = calculH(R1,R2,R5,C)

%% H2 
R1 = 3530;
R2 = 404;
R5 = 7580;
C = 2.2 *1e-9;
H2 = calculH(R1,R2,R5,C)
%% H3 
R1 = 2530;
R2 = 142;
R5 = 11200;
C = 2.2 *1e-9;
H3 = calculH(R1,R2,R5,C)

%% H4 
R1 = 3890;
R2 = 218;
R5 = 17300;
C = 2.2 *1e-9;
H4 = calculH(R1,R2,R5,C)

%% H total
H = H1*H2*H3*H4
bode(H);