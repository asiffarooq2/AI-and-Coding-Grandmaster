scores = [45, 62, 78, 85, 91, 56, 73, 88]

print("================================")
print("MY QUIZ RESULT SEARCHER")
print("================================")
print("Quiz Scores:", scores)

first = scores[0]

print()
print("PART 1: Direct Access")
print("First Student Score:", first)
print("Time Complexity: O(1)")
print("Theta Notation: Theta(1)")
print("Reason: Direct access takes one step.")

target = 88
count = 0
status = False

print()
print("PART 2: Linear Search")
print("Searching for score:", target)

index = 0
while index < len(scores):
    count += 1
    if scores[index] == target:
        status = True
        print("Score found:", scores[index])
        print("Steps Taken:", count)
        break
    index += 1

if not status:
    print("Score not found.")
    print("Steps Taken:", count)

print("Best Case: Omega(1)")
print("Average Case: O(n)")
print("Worst Case: O(n)")
print("Reason: The program may need to check many scores.")

print()
print("PART 3: Pair Comparison")

checks = 0

for i in range(len(scores)):
    for j in range(len(scores)):
        checks += 1

print("Total Pair Checks:", checks)
print("Time Complexity: O(n^2)")
print("Reason: A nested loop compares every score with every other score.")

print()
print("PART 4: Case Comparison")

best = 45
average = 85
worst = 88

print("Best Case Target:", best, "- Found near the beginning")
print("Average Case Target:", average, "- Found around the middle")
print("Worst Case Target:", worst, "- Found near the end")

print()
print("================================")
print("ASYMPTOTIC ANALYSIS SUMMARY")
print("================================")
print("O(1): Direct access is fastest.")
print("O(n): Linear search grows with the number of scores.")
print("O(n^2): Nested loops grow much faster.")
print("Omega(1): Best case for search when the target is found first.")
print("Theta(1): Direct access always takes constant time.")
print("Big-O shows the upper/worst-case growth.")
print("================================")
