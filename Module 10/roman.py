def convert_to_integer(symbol):
    values = {
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000
    }

    total = 0

    for index in range(len(symbol) - 1):
        if values[symbol[index]] < values[symbol[index + 1]]:
            total -= values[symbol[index]]
        else:
            total += values[symbol[index]]

    return total + values[symbol[-1]]


roman_number = input("Enter a Roman Numeral: ").upper()

print("Integer Value:", convert_to_integer(roman_number))
