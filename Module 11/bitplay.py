value = 52


def binary(number):
    return format(number, "b")


print("=== Bit Play ===")
print("n =", value, "->", binary(value))
print("Set bits  (1s):", binary(value).count("1"))
print("Zero bits (0s):", binary(value).count("0"))
print()

ones = 0
copy = value

while copy > 0:
    ones += copy % 2
    copy //= 2

print("Set bits in", value, ":", ones)
print()

position = 1
copy = value

while copy > 0:
    if copy % 2 == 1:
        break
    position += 1
    copy //= 2

print("First set bit of", value, "-> position", position)
print()

print("Bit masks (1 << i):")

for index in range(6):
    mask = 2 ** index
    print(f"  1 << {index} = {mask:2d} -> {binary(mask)}")

print()

print("Bits of", value, "->", binary(value) + ":")

for index in range(6):
    if value & (2 ** index):
        status = "SET"
    else:
        status = "NOT SET"

    print(f"  bit {index + 1}:", status)
