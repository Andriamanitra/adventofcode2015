#include <stdio.h>
#include <stdlib.h>

int main() {
    FILE* fp = fopen("input.txt", "r");
    char ch;

    int i = 0;
    int step = 0;
    int part2 = 0;
    while ((ch = fgetc(fp)) != EOF) {
        if (ch == '(') {
            i += 1;
        } else if (ch == ')') {
            i -= 1;
        }
        step += 1;
        if (!part2 && i == -1) {
            part2 = step;
        }
    }
    printf("Part 1: %d\nPart 2: %d", i, part2);
}
