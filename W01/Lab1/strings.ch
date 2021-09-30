
char s[4];

s[0] = 'c';
s[1] = 'a';
s[2] = 't';
s[3] = 0;

printf("%s\n", s);


s[0] = 'h';
s[1] = 'i';
s[2] = 0;
s[3] = 0;

printf("%s\n", s);

char *j = "hello";
printf("%s\n", j);

char first = j[5];

printf("%c %hhd\n", first, first);
