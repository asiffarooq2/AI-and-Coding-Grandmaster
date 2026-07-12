print("================================")
print("BINARY CLUE INVESTIGATOR")
print("================================")

value1 = 7
value2 = 7

print()
print("PART 1: XOR Identity and Equality")
print("a =", value1)
print("b =", value2)
print("a ^ a =", value1 ^ value1)
print("a ^ 0 =", value1 ^ 0)

if value1 ^ value2 == 0:
    print("Both numbers are equal")
else:
    print("Both numbers are different")

data = [3, 5, 3, 5, 9]

answer = 0

for item in data:
    answer ^= item

print()
print("PART 2: XOR Cancellation")
print("Clues:", data)
print("Final XOR Result:", answer)
print("Repeated clues cancel out, so the remaining clue is:", answer)

values = [4, 7, 4, 2, 7, 2, 9]

single = 0

for item in values:
    single ^= item

print()
print("PART 3: One Odd-Occurring Number")
print("Numbers:", values)
print("Odd-occurring number:", single)

elements = [3, 9, 3, 5, 5, 7]

combined = 0

for item in elements:
    combined ^= item

print()
print("PART 4: XOR of Two Odd-Occurring Numbers")
print("Numbers:", elements)
print("XOR of two odd-occurring numbers:", combined)

mask = combined & (~(combined - 1))

odd_one = 0
odd_two = 0

for item in elements:
    if item & mask:
        odd_one ^= item
    else:
        odd_two ^= item

print()
print("PART 5: Splitting by the Rightmost Set Bit")
print("Rightmost set bit:", mask)
print("First odd-occurring number:", odd_one)
print("Second odd-occurring number:", odd_two)

print()
print("================================")
print("BINARY CLUE INVESTIGATION SUMMARY")
print("================================")
print("XOR Identity: a ^ a = 0")
print("XOR with zero: a ^ 0 = a")
print("XOR Cancellation removes repeated pairs")
print("One odd-occurring number found:", single)
print("Two odd-occurring numbers found:", odd_one, "and", odd_two)
print("================================")
