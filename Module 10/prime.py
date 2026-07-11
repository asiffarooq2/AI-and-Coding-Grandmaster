from math import sqrt

value = int(input("Enter a number: "))

if value <= 1:
    print(value, "is not a prime number")
else:
    prime = True

    for divisor in range(2, int(sqrt(value)) + 1):
        if value % divisor == 0:
            prime = False
            break

    if prime:
        print(value, "is a prime number")
    else:
        print(value, "is not a prime number")
