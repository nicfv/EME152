/* * * * * * * *
 * student.cpp *
 * * * * * * * */

#include <iostream>
#include <string.h>
#include "02_student.h"

using namespace std;

void Student::setDetails(int newId, const char *newName)
{
    id = newId;
    strcpy(name, newName);
}

void Student::getDetails(void)
{
    cout << "My ID is " << id << endl;
    cout << "My name is " << name << endl;
}