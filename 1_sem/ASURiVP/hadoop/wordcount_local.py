from collections import Counter

with open("input.txt", "r", encoding="utf-8") as f:
    words = f.read().split()

counts = Counter(words)

for word, count in counts.items():
    print(f"{word}\t{count}")
