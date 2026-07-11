number = int(input("Enter a number: "))

original = number
reverse = 0

while number > 0:
    digit = number % 10
    reverse = reverse * 10 + digit
    number //= 10

if original == reverse:
    print(original, "is a Palindrome Number")
else:
    print(original, "is not a Palindrome Number")
