class Employee:
    def __init__(self, name, salary):
        self.name = name
        self.salary = salary
        print("Employee Created")

    def display(self):
        print("Name:", self.name)
        print("Salary:", self.salary)

    def __del__(self):
        print("Employee Record Deleted")


emp1 = Employee("Asif", 50000)

emp1.display()

del emp1
