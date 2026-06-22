import os

with open("science-notes.txt", "r") as f:
    print("Science Notes:")
    print(f.read())

print("\nMaths Notes Word Count:")
with open("maths-notes.txt", "r") as f:
    for line in f:
        words = line.split()
        print(line.strip(), "-", len(words), "words")

if not os.path.exists("all-notes.txt"):
    with open("science-notes.txt", "r") as science:
        science_content = science.read()

    with open("maths-notes.txt", "r") as maths:
        maths_content = maths.read()

    with open("all-notes.txt", "w") as merged:
        merged.write(science_content)
        merged.write("\n")
        merged.write(maths_content)

    print("\nFiles merged into all-notes.txt")

if os.path.exists("all-notes.txt"):
    os.remove("all-notes.txt")
    print("all-notes.txt deleted successfully")
