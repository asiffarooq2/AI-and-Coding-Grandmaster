class Student:
    def __init__(self, name, age, grade):
        self.name = name
        self.age = age
        self.grade = grade
        print("Student Record Created")

    def display(self):
        print("Name:", self.name)
        print("Age:", self.age)
        print("Grade:", self.grade)

    def __del__(self):
        print("Student Record Deleted")


student1 = Student("Asif", 16, "A")

student1.display()

del student1
