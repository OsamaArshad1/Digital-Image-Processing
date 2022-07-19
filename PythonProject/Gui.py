from tkinter import *
from Face import *
from Sample import *
from Model import *

window = Tk()
window.title("Face Detection System")
window.minsize(width=500, height=500)

mylabel = Label(text="Face Detection Login/Register", font=("Arial", 24, "bold"))
mylabel.grid(column=2, row=1)

login_button = Button(text="Login", width=20, height=4, command=myface)
login_button.grid(column=2, row=6, pady=30, padx=2)

register_button = Button(text="Register", width=20, height=4, command=sample)
register_button.grid(column=2, row=7, pady=10, padx=2 )

window.mainloop()
