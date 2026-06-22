class Parrot:
    def __init__(self, name):
        self.name = name
        print(self.name, "is created.")

    def __del__(self):
        print(self.name, "is destroyed.")


bird = Parrot("Mithu")

del bird
