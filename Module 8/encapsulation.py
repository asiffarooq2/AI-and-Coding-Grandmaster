class Student:
    def __init__(self, name, marks):
        self.name = name
        self.__marks = marks

    def get_marks(self):
        return self.__marks

    def set_marks(self, marks):
        self.__marks = marks


student = Student("Asif", 85)

print("Name:", student.name)
print("Marks:", student.get_marks())

student.set_marks(90)

print("Updated Marks:", student.get_marks())
