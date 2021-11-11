
#include <stdio.h>
#include <string.h>

struct Student
{
    int id;
    char name[32];
};

int main(void)
{
    struct Student me;

    // equivalent of setDetails()
    me.id = 1234;
    strcpy(me.name, "Nicolas");

    // equivalent of getDetails()
    printf("My ID is %d\n", me.id);
    printf("My name is %s\n", me.name);

    return 0;
}
