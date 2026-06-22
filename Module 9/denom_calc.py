from tkinter import *


def calculate():
    amount = int(amount_entry.get())

    notes_2000 = amount // 2000
    amount %= 2000

    notes_500 = amount // 500
    amount %= 500

    notes_100 = amount // 100

    result_label.config(
        text=f"2000 Notes: {notes_2000}\n500 Notes: {notes_500}\n100 Notes: {notes_100}"
    )


root = Tk()
root.title("Denomination Calculator")
root.geometry("350x250")

Label(root, text="Enter Amount:", font=("Arial", 12)).pack(pady=10)

amount_entry = Entry(root, font=("Arial", 12))
amount_entry.pack(pady=5)

Button(root, text="Calculate", command=calculate).pack(pady=10)

result_label = Label(root, text="", font=("Arial", 12))
result_label.pack(pady=10)

root.mainloop()
