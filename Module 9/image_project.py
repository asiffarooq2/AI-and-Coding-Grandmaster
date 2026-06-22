from tkinter import *
from tkinter import messagebox
from PIL import Image, ImageTk

root = Tk()
root.title("Photo Album")
root.geometry("500x500")

image = Image.open("photo.jpg")
image = image.resize((250, 250))
photo = ImageTk.PhotoImage(image)

photo_label = Label(root, image=photo)
photo_label.pack(pady=20)


def show_message():
    messagebox.showinfo("Photo Album", "Welcome to the Photo Album!")


def show_details():
    details = Toplevel(root)
    details.title("Photo Details")
    details.geometry("300x200")

    Label(details, text="Photo Details", font=(
        "Arial", 14, "bold")).pack(pady=10)
    Label(details, text="File Name: photo.jpg").pack(pady=5)
    Label(details, text="Displayed Size: 250 x 250").pack(pady=5)


message_btn = Button(root, text="Show Message", command=show_message)
message_btn.pack(pady=10)

details_btn = Button(root, text="View Details", command=show_details)
details_btn.pack(pady=10)

root.mainloop()
