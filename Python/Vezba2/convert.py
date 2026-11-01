# convert.py
# Konverzija temperature iz Celzijusa u Farenhajte

print("Ovaj program konvertuje temperaturu iz C -> F")
celsius = eval(input("Unesite temperaturu u C >> "))
fahrenheit = 9/5 * celsius + 32
print("Temperatura je", fahrenheit, "stepeni Farenhajta.")

for i in range(0, 101, 10):
    print(f"Celsius: {i}C | Fahrenheit: {9/5 * i + 32}F")

print("\nSad, program konvertuje Fahrenheit do Celsius.")
f = eval(input("Unesite temperaturu u Fahrenheit: "))
c = (5 * f - 160) / 9
print(f"Fahrenheit: {f}F -> Celsius: {c}C")