student = {
    "name": "Asif",
    "age": 25,
    "city": "Srinagar"
}

print("Original Dictionary:", student)

student["grade"] = "A"
print("After Adding Grade:", student)

student["age"] = 26
print("After Updating Age:", student)

del student["city"]
print("After Deleting City:", student)

print("Keys:", student.keys())
print("Values:", student.values())
print("Items:", student.items())

print("Name:", student.get("name"))

print("Total Number of Items:", len(student))
