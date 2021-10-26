#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    FILE *fp; /* This is a file pointer */
    char c;   /* This is the current charater being read */

    /* Open a file for writing. If the file already exists,
     * it will be overwritten. */
    fp = fopen("out.dat", "w");

    /* Check to see if it opened correctly. */
    if (fp == NULL)
    {
        printf("File did not open correctly. Aborting...\n");
        exit(1);
    }

    /* Let us print the alphabet reversed into the file. */
    for (c = 'z'; c >= 'a'; c--)
    {
        fprintf(fp, "%c", c);
    }
    /* Put a newline at the end */
    fprintf(fp, "\n");
    fprintf(fp, "Hello there, how are you.\n");
    fprintf(fp, "I'm fine, thanks.\n");

    /* It is good programming practice
     * to ALWAYS close a file when you
     * are done with it.
     */
    fclose(fp);
    return 0;
}
