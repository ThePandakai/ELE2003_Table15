import math

NT=15
fc= 40 + 0.5*NT * 1000 #Fréquence porteuse
wc = fc*math.pi*2 #Fréquence angulaire de la porteuse

vG=-6.7# Pris à partir du modèle dans LTSPICE de 2N3819

Vcc=-15 #Poser
Vjfet=vG/2
R1=1000 # Poser

R2= R1*(Vcc-Vjfet)/Vjfet

print(R2)

