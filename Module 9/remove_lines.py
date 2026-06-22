with open("science-notes.txt", "r") as file:
    lines = file.readlines()

with open("science-notes.txt", "w") as file:
    for line in lines:
        if "Plants" not in line:
            file.write(line)

print("Line removed successfully.")
