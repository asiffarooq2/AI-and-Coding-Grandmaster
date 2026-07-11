seats = [101, 104, 108, 112, 115, 120, 125, 130, 135, 140, 145, 150]
seat_to_find = 130

print("================================")
print("MY TRAIN SEAT FINDER")
print("================================")
print("Available Seats:", seats)
print("Seat to Find:", seat_to_find)


def search_seat(data, value):
    left = 0
    right = len(data) - 1
    count = 0

    while left <= right:
        count += 1
        middle = (left + right) // 2
        print("Checking middle seat:", data[middle])

        if data[middle] == value:
            return middle, count

        if value < data[middle]:
            right = middle - 1
        else:
            left = middle + 1

    return -1, count


position, total_steps = search_seat(seats, seat_to_find)

print()
print("Binary Search Result:")
if position >= 0:
    print("Seat found at index:", position)
else:
    print("Seat not found.")

print("Steps Taken:", total_steps)
print("Time Complexity: O(log n)")
print("Space Complexity: O(1)")


def recursive_search(data, value, start, end):
    if start > end:
        return -1

    middle = (start + end) // 2
    print("Recursive check:", data[middle])

    if data[middle] == value:
        return middle

    if value < data[middle]:
        return recursive_search(data, value, start, middle - 1)

    return recursive_search(data, value, middle + 1, end)


result = recursive_search(seats, seat_to_find, 0, len(seats) - 1)

print()
print("Recursive Binary Search Result:")
if result >= 0:
    print("Seat found at index:", result)
else:
    print("Seat not found.")

print("Recursive Time Complexity: O(log n)")
print("Space Complexity: O(log n) because of the call stack")

print()
print("================================")
print("COMPLEXITY LADDER")
print("================================")
print("O(1): Directly checking one fixed seat")
print("O(log n): Binary search by cutting the list in half")
print("O(n): Checking every seat one by one")
print("O(n²): Comparing every seat with every other seat")
print("================================")

print()
print("SUMMARY")
print("Binary search is faster than checking every seat one by one.")
print("It works only when the seat list is sorted.")
print("Recursive binary search also uses O(log n) time.")
print("However, recursion uses extra space in the call stack.")
