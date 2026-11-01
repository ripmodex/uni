import math
import random

vreme = eval(input("Daj mi vreme u sekundima: "))
ubrzanje = eval(input("Daj mi ubrizanje u metrima po sekundi kvadratnom: "))
krajna_brzina = ubrzanje*vreme
print(f"Krajna brizana je: {krajna_brzina}m/s^2")

visina = eval(input("Daj mi visina, kod objekat pada u metrima: "))
masa = eval(input("Daj mi masu objekta u kg: "))
potencijalna_energia = masa*9.81*visina
brzina = math.sqrt((2*potencijalna_energia)/masa) #csak figyelj oda a keplet atalakitasra, inkabb ird le papirra es ne fejbol, mert aztan hibas lesz
print(f"Brzina objekat pada do tlo je: {brzina}m/s")


donji = eval(input("Daj mi donji granice: "))
gornji = eval(input("Daj mi gornji granice: "))

if donji > gornji:
    temp = donji
    donji = gornji
    gornji = temp
    print("Podatki su bili pogresan, ali, ja sam menjao gornji i donji sa tebe. :D")
elif donji == gornji:
    donji -= 1
    gornji += 1
    print("Gornji i donji vrednosti su jednake, ja sam zauzela 1 od donji, i dao sam 1 do gornji")

broj = random.randint(donji, gornji)
print(broj)
counter = 1
pogoditi = False
while pogoditi == False:
    tip = eval(input(f"Probaj da pokusavas random broj od {donji} do {gornji}: "))
    if tip == broj:
        print("Pogodilo si broj, bravo")
        pogoditi = True
    elif tip < broj:
        print("Sledeci put trebas da tipovas visi broj")
        counter += 1
    elif tip > broj:
        print("Sledeci put trebas da tipovas manji broj")
        counter += 1
    else:
        print("greska")
print(f"Svaka cast, pogodilo si broj, trebao {counter} puta.")
#nincs meg kesz de majd kovinek fejezd be ezt is, meg csinald meg ami alatta, van meg gyakorold at a mait is meg, menni fog Boti!




