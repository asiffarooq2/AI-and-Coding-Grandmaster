limit = 3000

for number in range(2, limit + 1):

    factors = 0

    for divisor in range(1, number + 1):
        if number % divisor == 0:
            factors += 1

    if factors == 2:
        original = number
        reverse = 0

        while original > 0:
            digit = original % 10
            reverse = reverse * 10 + digit
            original //= 10

        if reverse == number:
            print(number)
