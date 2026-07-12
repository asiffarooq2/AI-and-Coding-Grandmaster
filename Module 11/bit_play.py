first = 56
second = 12

print("=== Bitplay 3 ===")
print("Before: a =", first, "  b =", second)

first += second
second = first - second
first -= second

print("Swapped: a =", first, "  b =", second)
print()

first = 56
second = 12

first ^= second
second ^= first
first ^= second

print("XOR swap: a =", first, "  b =", second)
print()

print("Left shift:")
value = 3

for shift in range(1, 6):
    print(f"  3 << {shift} =", value * (2 ** shift))

print()


def divide_numbers(num1, num2):
    sign = (num1 < 0) != (num2 < 0)

    dividend = abs(num1)
    divisor = abs(num2)
    quotient = 0

    while dividend >= divisor:
        dividend -= divisor
        quotient += 1

    if sign:
        quotient = -quotient

    return quotient


print("Divide without /:")
print("  50 / 2  =", divide_numbers(50, 2))
print("  72 / 3  =", divide_numbers(72, 3))
print(" -50 / 2  =", divide_numbers(-50, 2))
print("  50 / -2 =", divide_numbers(50, -2))
