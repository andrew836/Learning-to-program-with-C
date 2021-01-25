#include <stdio.h>


/* Exercise 1-8 from K&R: The C Programming Language. Write a program to count spaces, tabs, and newlines. Use ctrl+d to terminate the program and show 
 * results.
 */

int main(void) {

    int c, x, y, z;
    c = x = y = z = 0;

    while ((c = getchar()) != EOF) {
        if (c == '\n')
            x++;
        if (c == ' ')
            y++;
        if (c == '\t')
            z++;
    }

    printf("\n%d newlines, %d spaces, %d tabs\n\n", x,y,z);

    return 0;

}
