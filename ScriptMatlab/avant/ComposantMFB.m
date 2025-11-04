%Trouver facteur qualité, par https://www.analog.com/media/en/training-seminars/tutorials/MT-210.pdf?doc=mt-218.pdff
fc=45e3;
fmax1=fc+(.4*15*10^3)/2;
fmax2=fc-(.4*15*10^3)/2;
format short g
%Si Q <20, MFB est applicable, on continue
%Avec H=1,(H représente le gain, on en veux pas), on ajoutera un etage de
%gain
%l'aide de https://www.analog.com/media/en/training-seminars/tutorials/mt-218.pdf

%% Premier etage, premier pic
w0 = sqrt(7.174e10)/(2*pi)
f0=w0/(2*pi);
Q=f0/(fmax1-fmax2);
c3=330e-12;
k=2*pi*f0*c3;
c4=c3;
R1=1/k;
R2=1/((2*Q-1)*k);
R5=2*Q/k;
matComp=[c3 c4 R1 R2 R5]
Verif= 1/(2*pi*sqrt(R1*R2*c3*c4))
%% Deuxieme etage, deuxieme pic
w0 = sqrt(8.883e10);
f0=w0/(2*pi);

Q=f0/(fmax1-fmax2);
c3=330e-12;
k=2*pi*f0*c3;
c4=c3;
R1=1/k;
R2=1/((2*Q-1)*k);
R5=2*Q/k;
matComp=[c3 c4 R1 R2 R5]





