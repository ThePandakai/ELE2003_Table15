import math

NT=15
fc= 40 + 0.5*NT * 1000 #Fréquence porteuse
wc = fc*math.pi*2 #Fréquence angulaire de la porteuse

vG=-3 # Pris à partir du modèle dans LTSPICE de 2N3819

Vcc=-15 #Poser
Vjfet=vG/2
R1=1000 # Poser

R2= R1*(Vcc-Vjfet)/Vjfet

print(R2)

Reon = R2 #Car la tension du noeud G est égale a 0
Reoff = math.pow((1/R2 +1/R1),-1) # Car R2 et R1 sont en //
print(Reoff)
print(1/wc)

Rb=5000

Vmax=1 + Rb/Reon
Vmin=1 + Rb/Reoff

m=(Vmax-Vmin)/(Vmax+Vmin)
print(m)