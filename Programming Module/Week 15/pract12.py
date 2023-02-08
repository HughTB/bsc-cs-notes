from tkinter import *;
import tkinter.font as tkFont;

loginDetails = {
    "YousefD": "VenterboSS",
    "SergeiT": "25Operyu",
    "YemiO ": "Idec704",
    "WernerS": "IAmMel12",
}

font = None

def loginApp():
    """
    The function creates a window, and sets its title, size, and column widths.
    It then calls the createWidgets function to create the widgets on this window.
    Finally, it calls the mainloop method on the window to start the event loop.
    """
    width = 300
    height = 150

    win = Tk()
    win.title("Welcome")
    win.geometry(f"{width}x{height}+{int((win.winfo_screenwidth() - width) / 2)}+{int((win.winfo_screenheight() - height) / 2)}")
    win.resizable(width=False, height=False)
    win.columnconfigure(index=0, weight=1)
    win.columnconfigure(index=1, weight=3)
    win.rowconfigure(index=0, weight=1)
    win.rowconfigure(index=1, weight=1)
    win.rowconfigure(index=2, weight=1)
    win.rowconfigure(index=3, weight=1)

    font = tkFont.Font(family="Segoe UI", size=11)

    createWidgets(win, font)

    font.configure(size=20)

    win.mainloop()


def createWidgets(win, font: tkFont.Font):
    """
    Given an Tk window, win, the function creates and populates the widgets needed
    for the application
    """
    outputText = Text(win, height=1, width=30)
    outputText.insert("1.0", "Please login to continue:")
    outputText.grid(row=0, column=0, columnspan=2)
    outputText.configure(font=font)

    userNameLabel = Label(win, text="Username")
    userNameLabel.grid(row=1, column=0)
    userNameLabel.configure(font=font)

    passwordLabel = Label(win, text="Password")
    passwordLabel.grid(row=2, column=0)
    passwordLabel.configure(font=font)

    userNameEntry = Entry(win)
    userNameEntry.grid(row=1, column=1)
    userNameEntry.configure(font=font)

    passwordEntry = Entry(win, show="*")
    passwordEntry.grid(row=2, column=1)
    passwordEntry.configure(font=font)

    def signInCommand():
        signIn(userNameEntry, passwordEntry, outputText, win)

    signInButton = Button(win, text="Sign in", command=signInCommand)
    signInButton.grid(row=3, column=1)

    cancelButton = Button(win, text="Cancel", command=win.destroy)
    cancelButton.grid(row=3, column=0)


def signIn(userNameEntry, passwordEntry, outputText, win: Tk):
    """
    Given the widgets for the text entry fields for the username and password, as well as the output
    text, check if the credentials in the entry fields are valid, and display the result in outputText
    """
    userName = userNameEntry.get()
    password = passwordEntry.get()
    outputText.delete("1.0", "2.0")
    if userName in loginDetails:
        if loginDetails[userName] == password:
            outputText.insert("1.0", "Welcome {}!".format(userName))
            win.configure(background="#00ff00")
        else:
            outputText.insert("1.0", "Wrong password, try again.")
            win.configure(background="#ffff00")
    else:
        outputText.insert("1.0", "Username not found, try again.")
        win.configure(background="#FF0000")

loginApp()