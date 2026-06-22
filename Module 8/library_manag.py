class Library:
    def __init__(self, book):
        self.book = book
        print("Book Added:", self.book)

    def display(self):
        print("Available Book:", self.book)

    def __del__(self):
        print("Book Removed:", self.book)


book1 = Library("Python Programming")

book1.display()

del book1
