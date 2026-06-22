from tkinter import *

root = Tk()
root.title("Main Window")
root.geometry("300x200")


def open_window():
    top = Toplevel(root)
    top.title("Toplevel Window")
    top.geometry("250x150")

    Label(top, text="Welcome to the Toplevel Window").pack(pady=20)


Button(root, text="Open Window", command=open_window).pack(pady=50)

root.mainloop()
