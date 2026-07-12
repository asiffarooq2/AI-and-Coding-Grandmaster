elements = ["A", "B", "C"]
size = len(elements)
subsets = 2 ** size

print("=== Power Map ===")
print("Items:", elements)
print("Elements:", size, "  Total subsets: 2 ^", size, "=", subsets)
print()

print("Mask table (n =", size, "):")

value = 0
while value < subsets:
    c = (value // 4) % 2
    b = (value // 2) % 2
    a = value % 2

    print("  mask", value, "-> [C][B][A] =", c, b, a)
    value += 1

print()

print("All subsets (bit probe):")

value = 0

while value < subsets:
    current = []

    index = 0
    while index < size:
        if value & (2 ** index):
            current.append(elements[index])

        index += 1

    print("  mask", value, "->", current)
    value += 1

print()


def count_difference(first, second):
    count = 0

    while first > 0 or second > 0:
        if first % 2 != second % 2:
            count += 1

        first //= 2
        second //= 2

    return count


print("Bit difference:")
print("  diff(12, 15) =", count_difference(12, 15), "  (12=1100,  15=1111)")
print("  diff(21, 24) =", count_difference(21, 24), "  (21=10101, 24=11000)")
print("  diff( 8,  8) =", count_difference(8, 8), "  (same -> 0)")
