
#include <iostream>
#include <string.h>

using namespace std;

class Student
{
    private:
        int id;
        char name[32];

    public:
        void setDetails(int newId, const char *newName);
        void getDetails(void);
};

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

int main(void)
{
    Student me;

    me.setDetails(4321, "Nicolas");
    me.getDetails();

    return 0;
}
