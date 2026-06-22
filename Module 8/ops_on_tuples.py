fruits = ("Apple", "Mango", "Banana", "Orange", "Grapes")

print("Tuple:", fruits)

print("First Fruit:", fruits[0])

print("Last Fruit:", fruits[-1])

print("Number of Fruits:", len(fruits))

print("Count of Mango:", fruits.count("Mango"))

print("Index of Banana:", fruits.index("Banana"))

print("Slice:", fruits[1:4])

new_fruits = fruits + ("Pineapple",)
print("After Concatenation:", new_fruits)
