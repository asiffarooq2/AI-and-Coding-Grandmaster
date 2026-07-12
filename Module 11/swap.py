print("================================")
print("BITWISE SWAP CHALLENGE")
print("================================")

first = 56
second = 12

print()
print("PART 1: Swap Without a Third Variable")
print("Before Swap:")
print("a =", first)
print("b =", second)

first += second
second = first - second
first -= second

print("After Swap:")
print("a =", first)
print("b =", second)

num_a = 45
num_b = 18

print()
print("PART 2: XOR Swap")
print("Before XOR Swap:")
print("x =", num_a)
print("y =", num_b)

num_a ^= num_b
num_b ^= num_a
num_a ^= num_b

print("After XOR Swap:")
print("x =", num_a)
print("y =", num_b)

value = 3

print()
print("PART 3: Left Shift Doubles the Number")
print("Original Number:", value)

for shift in range(1, 5):
    print(f"{value} << {shift} =", value * (2 ** shift))

print("Each left shift multiplies the number by 2.")

number1 = -10
number2 = 5

print()
print("PART 4: XOR for Sign Detection")
print("num1 =", number1)
print("num2 =", number2)

if (number1 < 0) != (number2 < 0):
    print("The numbers have different signs.")
else:
    print("The numbers have the same sign.")

total = 25
part = 4

answer = 0
left = total

while left >= part:
    left -= part
    answer += 1

print()
print("PART 5: Divide Without /")
print("Dividend:", total)
print("Divisor:", part)
print("Quotient:", answer)
print("Remainder:", left)

print()
print("================================")
print("BITWISE SWAP CHALLENGE SUMMARY")
print("================================")
print("Swap without third variable uses addition and subtraction.")
print("XOR swap uses the ^ operator to swap values.")
print("Left shift doubles a number.")
print("XOR can help detect different signs.")
print("Division can be done using repeated subtraction.")
print("================================")
