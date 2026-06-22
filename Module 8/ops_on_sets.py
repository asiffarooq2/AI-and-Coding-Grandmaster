fruits = {"Apple", "Mango", "Banana", "Orange"}

print("Original Set:", fruits)

fruits.add("Grapes")
print("After Adding Grapes:", fruits)

fruits.remove("Banana")
print("After Removing Banana:", fruits)

print("Number of Elements:", len(fruits))

print("Is Mango Present?", "Mango" in fruits)

more_fruits = {"Pineapple", "Apple", "Kiwi"}

print("Union:", fruits.union(more_fruits))

print("Intersection:", fruits.intersection(more_fruits))

print("Difference:", fruits.difference(more_fruits))
