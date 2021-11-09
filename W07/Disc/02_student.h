/* * * * * * *
 * student.h *
 * * * * * * */

#ifndef STUDENT_H
#define STUDENT_H

class Student
{
    private:
        int id;
        char name[32];

    public:
        void setDetails(int newId, const char *newName);
        void getDetails(void);
};

#endif
