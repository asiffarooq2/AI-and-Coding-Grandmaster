code = 13
key = 9


def binary(value, size=4):
    return format(value & ((1 << size) - 1), f"0{size}b")


print("================================")
print("MY SECRET CODE BIT SCANNER")
print("================================")
print("Secret Code:", code, "Binary:", binary(code))
print("Access Key:", key, "Binary:", binary(key))

print()
print("PART 1: Bits and Binary")
print("Binary numbers use only 0 and 1.")
print("Secret Code Binary:", binary(code))
print("Access Key Binary:", binary(key))

and_value = code & key
or_value = code | key

print()
print("PART 2: AND and OR")
print("AND Result:", and_value, "Binary:", binary(and_value))
print("OR Result:", or_value, "Binary:", binary(or_value))
print("AND keeps only positions where both bits are 1.")
print("OR keeps positions where at least one bit is 1.")

inverse = (~code) & 15
difference = code ^ key

print()
print("PART 3: NOT and XOR")
print("NOT Secret Code within 4 bits:", inverse, "Binary:", binary(inverse))
print("XOR Result:", difference, "Binary:", binary(difference))
print("XOR gives 1 when the compared bits are different.")

shift_left = code * 2
shift_right = code // 2

print()
print("PART 4: Left Shift and Right Shift")
print("Left Shift Result:", shift_left, "Binary:", binary(shift_left, 5))
print("Right Shift Result:", shift_right, "Binary:", binary(shift_right))
print("Left shift moves bits left. Right shift moves bits right.")

check = code ^ 1

print()
print("PART 5: Odd or Even with XOR")
print("Secret Code XOR 1:", check)

if check == code - 1:
    print("Secret Code is Odd because XOR with 1 reduced it by 1.")
else:
    print("Secret Code is Even because XOR with 1 increased it by 1.")

ones = 0
temp = code

while temp > 0:
    if temp % 2 == 1:
        ones += 1
    temp //= 2

print()
print("PART 6: Counting Bits")
print("Number of 1 bits in Secret Code:", ones)

print()
print("================================")
print("SECRET CODE SCAN SUMMARY")
print("================================")
print("Secret Code:", code, "Binary:", binary(code))
print("Access Key:", key, "Binary:", binary(key))
print("AND:", and_value)
print("OR:", or_value)
print("NOT within 4 bits:", inverse)
print("XOR:", difference)
print("Left Shift:", shift_left)
print("Right Shift:", shift_right)
print("1 Bits Count:", ones)
print("================================")
