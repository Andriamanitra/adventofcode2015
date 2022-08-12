from collections import Counter


def main():
    with open("input.txt", "r") as f:
        parens = f.read()

    # Part 1
    counts = Counter(parens)
    destination = counts["("] - counts[")"]
    print("Part 1:", destination)

    # Part 2
    current_floor = 0
    for pos, ch in enumerate(parens, 1):
        if ch == "(":
            current_floor += 1
        elif ch == ")":
            current_floor -= 1
            if current_floor == -1:
                print("Part 2:", pos)
                break


if __name__ == "__main__":
    main()
