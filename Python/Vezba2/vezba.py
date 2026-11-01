#n = eval(input("Koliko brojeva zelite: "))
broj = []
#for i in range(n):
#    broj.append(eval(input("Unesite broj: ")))

#while True:
#    broj.append(eval(input("Unseite broj: ")))
#    jos = input("Jos (da/ne): ")
#    if(jos == "ne" or jos == "Ne"):
#        break

while True:
    temp = input("Unesite broj ili 'x' za kraj: ")
    if temp == 'x' or temp =='X':
        break
    broj.append(int(temp))


b_n = len(broj)
summa = 0
for i in range(b_n):
    summa += broj[i]

prosek = summa / b_n
print(f"Prosek: {prosek}")