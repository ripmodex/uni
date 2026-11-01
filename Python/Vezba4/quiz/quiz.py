import random as rnd

if __name__ == '__main__':
    pitanja = []
    odgovori = []
    with open("quiz.txt", "r", encoding="utf-8") as file:
        for line in file:
            p, o = line.split("?", 1)
            pitanja.append(p)
            odgovori.append(o)
file.close()

for i in range(len(pitanja)):
    pitanja[i] += "?"
    odgovori[i] = odgovori[i].lstrip()

print("Unesi broj ispred odgovora koji mislis je tacno:")
print("-"*40)
bodovi = 0
for i in range(len(pitanja)):
    #i = rnd.randint(0, len(pitanja)-1)
    print(pitanja[i]) 

    odgovor = odgovori[i].split("|")
    tacan_odgovor = 0
    for ind in range(1,len(odgovor)):
        if odgovor[ind].find("!") == 0:
            tacan_odgovor = ind
            print(f"{ind}.)",odgovor[ind][1:])
        else:
            print(f"{ind}.)",odgovor[ind])
    ans = int(input(">>"))
    if ans == tacan_odgovor:
        print("Bravo!")
        bodovi += 1
    else:
        print("Oppa!?")
    folyt = int(input("Da li zelis da nastavis (Da - 1, Ne - 0) >>"))
    if folyt == 0:
        break
    print("\n","-"*40)

print(f"Izlazio si iz quiz. Bodovi: {bodovi}")
