#!/bin/bash

# Read input from the user
read -p "Enter a string: " str

# Extract vowels using grep and tr
vowels_found=$(echo "$str" | grep -o -i '[aeiou]')

# Count vowels
vowel_count=$(echo "$vowels_found" | wc -l)

# Display results
if [[ -n "$vowels_found" ]]; then
    echo "Vowels found: $vowels_found"
    echo "Total number of vowels: $vowel_count"
else
    echo "No vowels found."
fi

# -n STRING → True if STRING is not empty (length > 0).
# -z STRING → True if STRING is empty (length = 0).
# wc -l is used because each vowel is printed on a separate line, making it easy to count vowels.