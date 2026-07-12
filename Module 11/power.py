value = 12

print("=== Power Surge ===")
print("n       =", value, "->", bin(value))
print("n - 1   =", value - 1, "->", bin(value - 1))
print("n&(n-1) =", value & (value - 1), "->", bin(value & (value - 1)))
print()

print("Power of 2 check:")

for number in [1, 4, 6, 16, 18, 64]:
    check = number > 0 and (number & (number - 1)) == 0
    print(" ", number, "->", bin(number), "->", check)

print()


def is_power_four(number):
    if number <= 0:
        return False

    if number & (number - 1):
        return False

    shifts = 0

    while number != 1:
        number //= 2
        shifts += 1

    return shifts % 2 == 0


print("Power of 4 check:")

for number in [1, 4, 8, 16, 32, 64]:
    print(" ", number, "->", is_power_four(number))

print()


def is_power_eight(number):
    if number <= 0:
        return False

    if number & (number - 1):
        return False

    shifts = 0

    while number != 1:
        number //= 2
        shifts += 1

    return shifts % 3 == 0


print("Power of 8 check:")

for number in [1, 8, 16, 64, 32, 512]:
    print(" ", number, "->", is_power_eight(number))

print()


def power(base, exponent):
    answer = 1

    while exponent > 0:
        if exponent % 2 == 1:
            answer *= base

        base *= base
        exponent //= 2

    return answer


print("Binary exponentiation:")
print("  6 ^ 5  =", power(6, 5))
print("  2 ^ 10 =", power(2, 10))
print("  3 ^ 8  =", power(3, 8))
