values = ["A", "B", "C"]
length = len(values)
count = 2 ** length

print("================================")
print("BINARY SUBSET BUILDER")
print("================================")

print("Items:", values)
print("Number of items:", length)
print("Total subsets: 2 ^", length, "=", count)

print()
print("PART 1: Power Set")
print("For", length, "items, we can create", count, "subsets.")

print()
print("PART 2: Binary Mask Table")

current = 0

while current < count:
    third = (current // 4) % 2
    second = (current // 2) % 2
    first = current % 2

    print("Mask", current, "-> [C][B][A] =", third, second, first)

    current += 1

print()
print("PART 3: Bit Probe")

sample = 5

print("Sample Mask:", sample)
print("Binary:", bin(sample))

position = 0

while position < length:
    if sample & (2 ** position):
        print("Bit", position, "is set, so item",
              values[position], "is selected.")
    else:
        print("Bit", position, "is not set, so item",
              values[position], "is not selected.")

    position += 1

print()
print("PART 4: All Subsets")

current = 0

while current < count:
    group = []

    position = 0

    while position < length:
        if current & (2 ** position):
            group.append(values[position])

        position += 1

    print("Mask", current, "->", group)

    current += 1


def count_bits_difference(first, second):
    total = 0

    while first > 0 or second > 0:
        if first % 2 != second % 2:
            total += 1

        first //= 2
        second //= 2

    return total


print()
print("PART 5: Bit Difference")
print("Difference between 12 and 15:", count_bits_difference(12, 15))
print("12 =", bin(12), "15 =", bin(15))

print("Difference between 21 and 24:", count_bits_difference(21, 24))
print("21 =", bin(21), "24 =", bin(24))

print("Difference between 8 and 8:", count_bits_difference(8, 8))
print("8 =", bin(8), "8 =", bin(8))

print()
print("================================")
print("BINARY SUBSET BUILDER SUMMARY")
print("================================")
print("Power Set: All possible subsets of a set.")
print("Binary Mask: A number that selects items using bits.")
print("Bit Probe: Uses 1 << j to check a specific bit.")
print("Two Loops: One loop for masks, one loop for items.")
print("Bit Difference: Counts different bit positions.")
print("================================")
