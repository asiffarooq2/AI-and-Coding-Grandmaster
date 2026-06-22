from tkinter import *
from tkinter import messagebox
from PIL import Image, ImageTk

root = Tk()
root.title("Photo Viewer")
root.geometry("500x500")

image = Image.open("photo.jpg")
image = image.resize((250, 250))
photo = ImageTk.PhotoImage(image)

image_label = Label(root, image=photo)
image_label.pack(pady=20)


def show_info():
    messagebox.showinfo(
        "Photo Info", "This is a resized photo displayed in the application.")


def open_details():
    top = Toplevel(root)
    top.title("Photo Details")
    top.geometry("300x200")

    Label(top, text="Photo Details", font=("Arial", 14, "bold")).pack(pady=10)
    Label(top, text="File Name: photo.jpg").pack(pady=5)
    Label(top, text="Size: 250 x 250 pixels").pack(pady=5)


info_button = Button(root, text="Show Info", command=show_info)
info_button.pack(pady=10)

details_button = Button(root, text="Open Details", command=open_details)
details_button.pack(pady=10)

root.mainloop()
