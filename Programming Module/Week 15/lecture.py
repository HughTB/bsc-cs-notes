from tkinter import *;

def createWidgets(win):
    outputText = Text(win, height=1, width=30)
    outputText.insert("1.0", "Please login to continue:")
    outputText.grid(row=0, column=0, columnspan=2)

    usernameLabel = Label(win, text="Username:")
    usernameLabel.grid(row=1, column=0)
    passwordLabel = Label(win, text="Password:")
    passwordLabel.grid(row=2, column=0)

    usernameEntry = Entry(win)
    usernameEntry.grid(row=1, column=1)
    passwordEntry = Entry(win)
    passwordEntry.grid(row=2, column=1)

    signInButton = Button(win, text="Sign In")
    signInButton.grid(row=3, column=1)
    cancelButton = Button(win, text="Cancel", command=win.destroy)
    cancelButton.grid(row=3, column=0)

def main():
    win = Tk()

    win.title("Login")
    win.geometry("300x150")

    win.columnconfigure(index=0, weight=1)
    win.columnconfigure(index=1, weight=2)

    createWidgets(win)

    win.mainloop()

main()