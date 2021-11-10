/* * * * * * * *
 * student.cpp *
 * * * * * * * */

#include <iostream>
#include <string.h>
#include "02_student.h"

using namespace std;

void Student::setDetails(int newId, const char *newName, enum Gender newGender)
{
    id = newId;
    strcpy(name, newName);
    gender = newGender;
}

void Student::getDetails(void)
{
    cout << "My ID is " << id << endl;
    cout << "My name is " << name << endl;
    cout << "I am (" << gender << ") ";
    switch (gender)
    {
    case MALE:
        cout << "male" << endl;
        break;
    case FEMALE:
        cout << "female" << endl;
        break;
    case OTHER:
        cout << "other" << endl;
        break;
    default:
        break;
    }
}