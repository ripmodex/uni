import random as rnd

def print_list(n):
    for i in range(len(n)):
        print(n[i], end=" ")
    print("\n")

def print_vesela(n):
    vesela = [
    """
         ____
         |  |
         |  
         |  
         |
         |
        _|_

    """,
    """
         ____
         |  |
         |  O
         |  
         |
         |
        _|_

    """,
    """
         ____
         |  |
         |  O
         |  |
         |
         |
        _|_
    
    """,
    """
         ____
         |  |
         |  O
         | /|
         |
         |
        _|_
    
    """,
    """
         ____
         |  |
         |  O
         | /|\\
         |
         |
        _|_
    
    """,
    """
         ____
         |  |
         |  O
         | /|\\
         | /
         |
        _|_
    
    """,
    """
         ____
         |  |
         |  O
         | /|\\
         | / \\
         |
        _|_
    
    """
    ]
    print(vesela[n])

if __name__ == "__main__":
    reci = []
    with open("dictionary.txt", "r") as file:
        for line in file:
            reci.append(line[:len(line)-1])

    rnd_rec = rnd.randint(0, len(reci)-1)
    nepoznato_rec = reci[rnd_rec]
    #print(nepoznato_rec)

    #nez = "_ " * len(nepoznato_rec)
    #nez = nez.rstrip()
    #neznak = nez.split(" ")
    #print_list(neznak) -> ez is ugyanazt csinalja ami alatta van csak ez hosszabb, a masik meg joval rovidebb

    neznak = ["_"] * len(nepoznato_rec)

    tacno_rec = False
    greska = 0
    pogresan_slova = []
    print("Trebas da pogodis rec, koliko nepoznato slova ima je data.")
    while tacno_rec != True and greska < 6:
        print_vesela(greska)
        print(f"Daj mi a slovo, {greska} greska imas.")
        print("Pogresan slovi: ")
        print_list(pogresan_slova)
        print_list(neznak)
        tip = input(">>")
        tip = tip.upper()

        if len(tip) > 1 or tip == "":
            print("Samo 1 slovo molim vas!")
            continue
        else:
            ima = False
            for i in range(len(nepoznato_rec)):
                if tip == nepoznato_rec[i]:
                    neznak[i] = tip
                    ima = True

            if ima == False:
                greska += 1
                if len(pogresan_slova) == 0:
                    pogresan_slova.append(tip)
                else:
                    slovo_ima = False
                    for i in range(len(pogresan_slova)):
                        if pogresan_slova[i] == tip:
                            slovo_ima = True
                            break
                    if slovo_ima == False:
                        pogresan_slova.append(tip)

            # azert dobott ki mert nem lett at alitva tutira false-ra es csak utana lep ki, minden esetre nem biztos hogy mukszik
            for i in range(len(neznak)):
                if neznak[i] == "_":
                    tacno_rec = False
                    break
                else:
                    tacno_rec = True
            print("-"*40)

    if tacno_rec == True:
        print_list(neznak)
        print("Bravo, uspesan si, pogodilo si rec!")
        print("-"*40)
    else:
        print_vesela(6)
        print_list(neznak)
        print(f"Oppa, nisi pogodilo rec => {nepoznato_rec}, dobio si 6 greska, i vesela je zavrsen.")
        print("-"*40)

#asd