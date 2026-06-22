import os

with open("science-notes.txt", "r") as f:
    print("Science Notes:")
    print(f.read())

with open("maths-notes.txt", "r") as f:
    print("\nMaths Notes Word Count:")
    for line in f:
        words = line.split()
        print(f"'{line.strip()}' -> {len(words)} words")

if not os.path.exists("all-notes.txt"):
    with open("science-notes.txt", "r") as science, \
            open("maths-notes.txt", "r") as maths, \
            open("all-notes.txt", "w") as merged:
        merged.write(science.read())
        merged.write("\n")
        merged.write(maths.read())
    print("\nFiles merged into all-notes.txt")

if os.path.exists("all-notes.txt"):
    os.remove("all-notes.txt")
    print("all-notes.txt has been deleted")
