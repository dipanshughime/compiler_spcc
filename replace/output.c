#include <stdio.h>

int main() {
    int num;
    write("Enter a number: ");
    readf("%d", &num);
    write("You entered: %d\n", num);
    return 0;
}