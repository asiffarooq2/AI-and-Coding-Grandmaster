fruits = ["Apple", "Mango", "Banana", "Orange", "Grapes"]

print("Original List:", fruits)

fruits.append("Pineapple")
print("After Adding Pineapple:", fruits)

fruits.remove("Banana")
print("After Removing Banana:", fruits)

print("First Fruit:", fruits[0])
print("Last Fruit:", fruits[-1])

print("Total Fruits:", len(fruits))

fruits.sort()
print("Sorted List:", fruits)

if "Mango" in fruits:
    print("Mango is present in the list.")
else:
    print("Mango is not present in the list.")