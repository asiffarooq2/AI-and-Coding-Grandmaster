print("================================")
print("POWER OF TWO SCANNER")
print("================================")

value = 16

print()
print("PART 1: The n & (n-1) Trick")
print("n       =", value, "->", bin(value))
print("n - 1   =", value - 1, "->", bin(value - 1))
print("n&(n-1) =", value & (value - 1), "->", bin(value & (value - 1)))

print()
print("This trick removes the rightmost set bit.")


def power_two(number):
    return number > 0 and (number & (number - 1)) == 0


print()
print("PART 2: Power of 2 Check")

values = [1, 2, 4, 6, 8, 12, 16, 18, 32]

for item in values:
    print(item, "->", bin(item), "->", power_two(item))


def power_four(number):
    if not power_two(number):
        return False

    shifts = 0

    while number > 1:
        number //= 2
        shifts += 1

    return shifts % 2 == 0


print()
print("PART 3: Power of 4 Check")

for item in values:
    print(item, "->", power_four(item))


def power_eight(number):
    if not power_two(number):
        return False

    shifts = 0

    while number > 1:
        number //= 2
        shifts += 1

    return shifts % 3 == 0


print()
print("PART 4: Power of 8 Check")

for item in values:
    print(item, "->", power_eight(item))


def fast_power(base, exponent):
    result = 1

    while exponent > 0:
        if exponent % 2 == 1:
            result *= base

        base *= base
        exponent //= 2

    return result


print()
print("PART 5: Binary Exponentiation")
print("2^5 =", fast_power(2, 5))
print("3^4 =", fast_power(3, 4))
print("5^3 =", fast_power(5, 3))

print()
print("================================")
print("POWER SCANNER SUMMARY")
print("================================")
print("Power of 2: only one bit is set.")
print("Power of 4: set-bit position is even.")
print("Power of 8: set-bit position is divisible by 3.")
print("Binary exponentiation calculates powers quickly.")
print("================================")
