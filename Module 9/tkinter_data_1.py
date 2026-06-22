from tkinter import *

root = Tk()
root.title("My Profile Card")
root.geometry("400x380")

title_label = Label(
    root,
    text="My Profile Card",
    bg="purple",
    fg="white",
    font=("Arial", 16, "bold"),
    pady=10
)
title_label.grid(row=0, column=0, columnspan=2, sticky="ew")

name_label = Label(root, text="Name:")
name_label.grid(row=1, column=0, padx=10, pady=10, sticky="w")

name_entry = Entry(root, width=30)
name_entry.grid(row=1, column=1, padx=10, pady=10)

hobby_label = Label(root, text="Hobby:")
hobby_label.grid(row=2, column=0, padx=10, pady=10, sticky="w")

hobby_entry = Entry(root, width=30)
hobby_entry.grid(row=2, column=1, padx=10, pady=10)

about_frame = LabelFrame(root, text="About Me", padx=10, pady=10)
about_frame.grid(row=3, column=0, columnspan=2, padx=10, pady=10)

about_text = Text(about_frame, width=35, height=6)
about_text.pack()

show_button = Button(root, text="Show My Card")
show_button.grid(row=4, column=0, columnspan=2, pady=20)

root.mainloop()
