# ======================================
# MY RUNNING LAP TRACKER
# ======================================
# Topics:
# Algorithm | Pseudocode | Time Complexity | Space Complexity
# One Problem, Three Solutions | Comparing Algorithm Efficiency

# Problem:
# A runner earns points equal to the lap number.
# Find the total running points after n laps.

laps = 5

print("================================")
print("MY RUNNING LAP TRACKER")
print("================================")
print("Number of laps:", laps)
print()

# ------------------------------------------------
# SOLUTION 1 - FORMULA METHOD
# ------------------------------------------------
# Algorithm:
# Calculate total directly using the mathematical formula.
#
# Pseudocode:
# START
#   total = laps × (laps + 1) / 2
#   Display total
# END
#
# Time Complexity: O(1)
# Space Complexity: O(1)

total_formula = (laps * (laps + 1)) // 2

print("Solution 1: Formula Method")
print("Total Running Points:", total_formula)
print("Time Complexity: O(1)")
print("Space Complexity: O(1)")
print()

# ------------------------------------------------
# SOLUTION 2 - LOOP METHOD
# ------------------------------------------------
# Algorithm:
# Add every lap value one at a time.
#
# Pseudocode:
# START
#   total = 0
#   Repeat from 1 to laps
#       total = total + current lap
#   Display total
# END
#
# Time Complexity: O(n)
# Space Complexity: O(1)

total_loop = 0
loop_counter = 0

for i in range(laps):
    total_loop += (i + 1)
    loop_counter += 1

print("Solution 2: Loop Method")
print("Total Running Points:", total_loop)
print("Steps Taken:", loop_counter)
print("Time Complexity: O(n)")
print("Space Complexity: O(1)")
print()

# ------------------------------------------------
# SOLUTION 3 - NESTED LOOP METHOD
# ------------------------------------------------
# Algorithm:
# Count every point individually using nested loops.
#
# Pseudocode:
# START
#   total = 0
#   Repeat for every lap
#       Repeat for each point in that lap
#           total = total + 1
#   Display total
# END
#
# Time Complexity: O(n²)
# Space Complexity: O(1)

total_nested = 0
nested_counter = 0

for outer in range(1, laps + 1):
    count = 1
    while count <= outer:
        total_nested += 1
        nested_counter += 1
        count += 1

print("Solution 3: Nested Loop Method")
print("Total Running Points:", total_nested)
print("Steps Taken:", nested_counter)
print("Time Complexity: O(n^2)")
print("Space Complexity: O(1)")
print()

# ------------------------------------------------
# COMPARING ALGORITHM EFFICIENCY
# ------------------------------------------------

print("================================")
print("ALGORITHM EFFICIENCY COMPARISON")
print("================================")
print("Formula Method: Fastest because it uses only 1 calculation.")
print("Loop Method: Slower because it repeats once for every lap.")
print("Nested Loop Method: Slowest because it uses a loop inside another loop.")
print()
print("Best Method: Formula Method")
print("Reason: It has O(1) time complexity, so it stays fast even when laps increase.")
print("================================")
