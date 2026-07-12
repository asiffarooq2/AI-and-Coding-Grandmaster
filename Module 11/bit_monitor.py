status = 45


def binary(number):
    return format(number, "b")


print("================================")
print("MY SMART SWITCH BIT MONITOR")
print("================================")

print("Switch Value:", status)
print("Binary Form:", binary(status))

binary_data = binary(status)

on_switches = binary_data.count("1")
off_switches = binary_data.count("0")

print()
print("PART 1: Set Bits and Zero Bits")
print("Set Bits / ON Switches:", on_switches)
print("Zero Bits / OFF Switches:", off_switches)

active = 0
copy = status

while copy > 0:
    active += copy % 2
    copy //= 2

print()
print("PART 2: Counting Set Bits")
print("Number of ON switches:", active)

first = 1
copy = status

while copy > 0:
    if copy % 2 == 1:
        break
    first += 1
    copy //= 2

print()
print("PART 3: The First Set Bit")
print("First ON switch is at position:", first)

print()
print("PART 4: Building a Bit Mask")

for index in range(6):
    value = 2 ** index
    print("Bit", index, "Mask:", value, "Binary:", binary(value))

devices = [
    "Living Room Light",
    "Fan",
    "Air Conditioner",
    "Door Lock",
    "Garden Light",
    "Security Camera"
]

print()
print("PART 5: Check if the Nth Bit is Set")

for index in range(6):
    if status & (2 ** index):
        print("Bit", index, "-", devices[index], "is ON")
    else:
        print("Bit", index, "-", devices[index], "is OFF")

print()
print("================================")
print("SMART SWITCH SUMMARY")
print("================================")
print("Switch Value:", status)
print("Binary Form:", binary(status))
print("Total ON Switches:", active)
print("First ON Switch Position:", first)
print("================================")
