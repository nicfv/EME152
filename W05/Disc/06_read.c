#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    FILE *fp; /* This is a file pointer */
    char c;   /* This is the current charater being read */

    /* Open a file for reading. The file must exist already. */
    fp = fopen("alphabet.txt", "r");

    /* Check to see if it opened correctly. */
    if (fp == NULL)
    {
        /* File did not open correctly! */
        printf("File did not open correctly. Aborting...\n");
        exit(1); /* Return with error code 1 */
    }

    /* Loop while we are not at the end of the file */
    while (!feof(fp))
    {
        /* For each iteration of the loop, grab a single character */
        fscanf(fp, "%c", &c);
        /* Now print the character. */
        printf("(%c)", c);
    }

    /* It is good programming practice
     * to ALWAYS close a file when you
     * are done with it.
     */
    fclose(fp);
    return 0;
}
