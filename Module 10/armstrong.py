number = int(input("Enter a number: "))

power = len(str(number))
total = 0
temp = number

while temp > 0:
    digit = temp % 10
    total += digit ** power
    temp //= 10

if total == number:
    print(number, "is an Armstrong number")
else:
    print(number, "is not an Armstrong number")
