print("================================")
print("RECURSION TIME COMPLEXITY DEMO")
print("================================")

# -------------------------------
# Factorial - O(n)
# -------------------------------

factorial_calls = 0


def factorial(n):
    global factorial_calls
    factorial_calls += 1

    if n == 0:
        return 1

    return n * factorial(n - 1)


number = 5
fact = factorial(number)

print()
print("Factorial")
print("Number:", number)
print("Result:", fact)
print("Recursive Calls:", factorial_calls)
print("Time Complexity: O(n)")
print("Space Complexity: O(n)")

# -------------------------------
# Recursive Binary Search - O(log n)
# -------------------------------

binary_calls = 0


def binary_search(arr, target, low, high):
    global binary_calls
    binary_calls += 1

    if low > high:
        return -1

    mid = (low + high) // 2
    print("Checking:", arr[mid])

    if arr[mid] == target:
        return mid
    elif target < arr[mid]:
        return binary_search(arr, target, low, mid - 1)
    else:
        return binary_search(arr, target, mid + 1, high)


numbers = [5, 10, 15, 20, 25, 30, 35, 40, 45]
target = 35

position = binary_search(numbers, target, 0, len(numbers) - 1)

print()
print("Recursive Binary Search")
print("Target:", target)
print("Found at Index:", position)
print("Recursive Calls:", binary_calls)
print("Time Complexity: O(log n)")
print("Space Complexity: O(log n)")

# -------------------------------
# Recursive Fibonacci - O(2^n)
# -------------------------------

fibonacci_calls = 0


def fibonacci(n):
    global fibonacci_calls
    fibonacci_calls += 1

    if n <= 1:
        return n

    return fibonacci(n - 1) + fibonacci(n - 2)


term = 6
answer = fibonacci(term)

print()
print("Recursive Fibonacci")
print("Term:", term)
print("Result:", answer)
print("Recursive Calls:", fibonacci_calls)
print("Time Complexity: O(2^n)")
print("Space Complexity: O(n)")

# -------------------------------
# Summary
# -------------------------------

print()
print("================================")
print("SUMMARY")
print("================================")
print("Factorial: O(n)")
print("Recursive Binary Search: O(log n)")
print("Recursive Fibonacci: O(2^n)")
print("Factorial makes one recursive call each time.")
print("Binary Search halves the search space every call.")
print("Fibonacci makes two recursive calls each time.")
print("================================")
