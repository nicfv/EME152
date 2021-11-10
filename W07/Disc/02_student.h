/* * * * * * *
 * student.h *
 * * * * * * */

#ifndef STUDENT_H
#define STUDENT_H

enum Gender
{
    MALE = 1,
    FEMALE = 2,
    OTHER = 3,
};

class Student
{
private:
    int id;
    char name[32];
    enum Gender gender;

public:
    void setDetails(int newId, const char *newName, enum Gender newGender);
    void getDetails(void);
};

#endif
