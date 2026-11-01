import math

print(4.0/10.0 + 3.5 * 2) #correct, float
print(10 % 4 + 6/2) #correct, float zato sto / je delenje, ne celo broj delenj sta je -> //
print(abs(4 - 20/3)**3) #correct, float
#print(math.sqrt(4.5-5.0)+7*3) #ako pod koren ce biti pozitiv onda ce biti float, ali ovo je incorrect
print(3*10/3+10%3) #correct, float
#print(3L**3) #incorrect, l nema vrednost, l je nista

print((3+4)*5)
print("\n")
#print((n*(n-1))/2)
#print(4!=r*r)
#print(math.sqrt((r*((math.cos(a)))**2) + (r*((math.sin(a))**2))
#print((y2-y1)/(x2-x1))

#range(5) -> 0,1,2,3,4
#range(3,10) -> 3,4,5,6,7,8,9
#range(4,13,2) -> 4,6,8,10,12
#range(15,5,-2) -> 15,13,11,9,7
#range(5,3) -> 5,4

for i in range(1,11):
    print(i*i)

for i in [1,3,5,7,9]:
    print(i, ":", i**3)
    print(i)

x = 2
y = 10
for j in range(0, y, x):
    print(j)
    print(x+y)
print("done")

ans = 0
for i in range(1, 11):
    ans = ans + i*i
    print(i)
print(ans)

r = eval(input("Unesite radius sfere: "))
zapreminu = 4/3 * math.pi * r**3
povrsinu = 4 * math.pi * r**2
print(f"Zapreminu sfere: {zapreminu}, povrsinu sfere: {povrsinu}")

pica_poluprecnik = eval(input("Unesite picom poluprecnika, i izracunavamo cenu: "))
cena = pica_poluprecnik**2 * math.pi
print(f"Cena pica {cena}din")

mol_masa_c = 12.001
mol_masa_h = 1.0079
broj_c = int(input("Unesite broj ugljenika [C]: "))
broj_h = int(input("Unesite broj vodonika [H]: "))
molarna_masa = (broj_c * mol_masa_c) + (broj_h * mol_masa_h)
print(f"Molarna masa ugljovodnika je {molarna_masa}mol")

#s=v*t
brzina_zvuka = 340*3.6
vremena = float(input("Unesite vremena izmedju munja i zvuka u sec: "))
udaljenost = brzina_zvuka*vremena
print(f"Udaljenost izmedju munja i tebe je {udaljenost}m ili {udaljenost/1000:.2f}km")