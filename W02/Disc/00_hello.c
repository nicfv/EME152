#include <stdio.h>

void sayHello(char *name) {
    printf("Hello, %s!\n", name);
}

int main(void) {
    sayHello("there");
    sayHello("world");
    sayHello("everyone");
    return 0;
}
