class Parrot:
    def __init__(self, name, color):
        self.name = name
        self.color = color

    def display(self):
        print("Name:", self.name)
        print("Color:", self.color)


bird = Parrot("Mithu", "Green")

bird.display()
