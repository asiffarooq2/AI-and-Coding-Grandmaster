x = 10
y = 6

def binary(value, size=4):
    return format(value & ((1 << size) - 1), f"0{size}b")

print("=== Bit Explorer ===")
print("a =", x, "->", binary(x))
print("b =", y, "->", binary(y))
print()

print("AND  a & b =", x & y, "->", binary(x & y))
print("OR   a | b =", x | y, "->", binary(x | y))
print()

print("NOT  ~a    =", (~x) & 255, "->", binary(~x, 8))
print("XOR  a ^ b =", x ^ y, "->", binary(x ^ y))
print()

left = x << 1
right = x >> 1

print("LEFT  a << 1 =", left, " (a x 2)")
print("RIGHT a >> 1 =", right, " (a / 2)")
print()

print("Odd or Even:")

numbers = [7, 10, 15, 4]

for value in numbers:
    if value ^ 1 == value + 1:
        print(value, "->", "Even")
    else:
        print(value, "->", "Odd")

print()

def bit_length(value):
    total = 0

    while value:
        total += 1
        value //= 2

    return total

print("Bit count:")

for value in [x, y, 255]:
    length = bit_length(value)
    print(value, "->", length, "bits |", binary(value, length))