def find_primes(limit):
    is_prime = [True] * (limit + 1)

    current = 2

    while current * current <= limit:
        if is_prime[current]:
            multiple = current * current

            while multiple <= limit:
                is_prime[multiple] = False
                multiple += current

        current += 1

    for number in range(2, limit + 1):
        if is_prime[number]:
            print(number)


value = int(input("Enter a number: "))

print("Following are the prime numbers smaller")
print("than or equal to", value)

find_primes(value)
