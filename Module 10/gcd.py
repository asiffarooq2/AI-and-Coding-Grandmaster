first = int(input("Enter the first number: "))
second = int(input("Enter the second number: "))

while second != 0:
    remainder = first % second
    first = second
    second = remainder

print("HCF is:", first)
