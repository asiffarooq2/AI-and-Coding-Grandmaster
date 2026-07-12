first = 7
second = 7

print("=== Odd Hunt ===")
print("a ^ a =", first ^ first)
print("a ^ 0 =", first ^ 0)
print("Equal (XOR):", (first ^ second) == 0)
print()

numbers = [3, 5, 3, 5, 9]

xor_value = 0

for value in numbers:
    xor_value ^= value

print("XOR of", numbers, "=", xor_value)
print()

values = [4, 7, 4, 2, 7, 2, 9]

odd_number = 0

for value in values:
    odd_number ^= value

print("Odd occurring:", odd_number)
print()

data = [3, 9, 3, 5, 5, 7]

combined = 0

for value in data:
    combined ^= value

print("XOR of two odds:", combined, "->", bin(combined))
print()

mask = combined & (~(combined - 1))

odd1 = 0
odd2 = 0

for value in data:
    if value & mask:
        odd1 ^= value
    else:
        odd2 ^= value

print("Two odd-occurring:", odd1, "and", odd2)
