def factors(num):
    print("The factors of", num, "are:")

    for value in range(1, num + 1):
        if num % value == 0:
            print(value)


number = int(input("Enter your number to find it's factors: "))

factors(number)
