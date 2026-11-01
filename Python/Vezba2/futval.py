# futval.py
# Izracunava buduce stanje orocenog novca
# za rok od 10 godina

print("Ovaj program izracunava stanje stednog racuna")
godina = eval(input("Unesite koliko godina zelite: "))

principal = eval(input("Unesite pocetni ulog: "))
#apr = eval(input("Unesite godisnju kamatu: "))
inflation = eval(input("Unesite inflaciju: "))

for i in range(godina):
    principal = principal / (1 + inflation)

print(f"Stanje nakon {godina} godina: {principal}")
