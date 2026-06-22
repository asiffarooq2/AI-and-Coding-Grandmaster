class Animal:
    def __init__(self, name, sound):
        self.name = name
        self.sound = sound
        print("Animal Created")

    def display(self):
        print("Name:", self.name)
        print("Sound:", self.sound)

    def __del__(self):
        print("Animal Record Deleted")


animal1 = Animal("Dog", "Bark")

animal1.display()

del animal1
