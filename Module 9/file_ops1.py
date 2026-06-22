with open("bucket-list.txt", "w") as file:
    file.write("Visit Kashmir\n")
    file.write("Learn Python\n")
    file.write("Travel Abroad\n")

with open("bucket-list.txt", "r") as file:
    content = file.read()
    print("Initial File Content:")
    print(content)

with open("bucket-list.txt", "r") as file:
    items = file.readlines()
    print("Number of Items:", len(items))

with open("bucket-list.txt", "a") as file:
    file.write("Start a Business\n")
    file.write("Buy a Car\n")

with open("bucket-list.txt", "r") as file:
    print("Final File Content:")
    print(file.read())
