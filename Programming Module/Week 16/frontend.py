from tkinter import *
from backend import ShoppingCart

mainWin = Tk()
cart = ShoppingCart()


def setupCart():
    """
    Add some products to the cart.
    """
    cart.addLaptop("Apple", "MacBook Air", 999.99)
    cart.addLaptop("Razer", "Blade", 1799.99)
    cart.addLaptop("Microsoft", "Surface", 900.00)


def setupMainWin():
    """
    Setup `mainWin` to display the cart.
    Display a button that lists all products and a button that closes `mainWin`.
    """
    mainWin.title("Cart")
    mainWin.geometry("300x50")
    mainWin.resizable(False, False)
    # The first column (list of products) needs to be bigger than the other
    mainWin.columnconfigure(index=0, weight=4)

    listBtn = Button(mainWin, text="List all products", command=listProducts)
    listBtn.grid(row=0, column=0, padx=15, pady=10, sticky="w")

    quitBtn = Button(mainWin, text="Quit", command=mainWin.destroy)
    quitBtn.grid(row=0, column=1, padx=15, pady=10, sticky="e")

    mainWin.mainloop()


def listProducts():
    """
    For each product in `cart`, create a text and a button on the `mainWin`.
    The text contains the product's information.
    The button is used to configure the product.
    Also display the total price of the cart at the bottom of `mainWin`.
    """
    numberOfProds = cart.getCartLength()
    # 50px per product + 1 row of buttons + 1 row for the total
    height = 50 * (numberOfProds + 2)
    mainWin.geometry("400x{}".format(height))

    for productIndex in range(numberOfProds):
        mainWin.rowconfigure(index=productIndex+1, weight=1)

        product = cart.getItemAt(productIndex)
        productTxt = Text(mainWin, height=2, width=50)
        productTxt.insert("1.0", str(product))
        # Add the text to row `productIndex` + 1 (first row is for the buttons)
        productTxt.grid(row=productIndex + 1, column=0,
                        padx=10, pady=5, sticky="w")

        def configCmd(i=productIndex):
            configWindow(i)

        configBtn = Button(mainWin, text="Configure", command=configCmd)
        configBtn.grid(row=productIndex + 1, column=1, padx=10, pady=5)

    totalLabel = Label(mainWin, text="Total: £{:.2f}".format(cart.getTotal()))
    totalLabel.grid(row=numberOfProds + 1, column=0,
                    padx=15, pady=10, sticky="w")
    totalLabel.config(font=("TkDefaultFont", 12, "bold"))


def configWindow(productIndex):
    """
    Create a new window to configure the product at `productIndex` of `cart`.
    The window will contain a text, showing the product's information,
    The window will also contain an entry to change the RAM capacity.
    When the change is submitted, the list of products in `mainWin` will update.
    """
    configWin = Toplevel()
    configWin.geometry("400x150")
    configWin.resizable(False, False)

    product = cart.getItemAt(productIndex)
    configWin.title("Configure {} {}".format(
        product.getBrand(), product.getModel()))

    prodTxt = Text(configWin, height=2, width=45)
    prodTxt.insert("1.0", "Configure {}".format(product))
    prodTxt.grid(row=0, column=0, padx=15, pady=5, columnspan=2)

    ramLabel = Label(configWin, text="Enter RAM capacity (GB):")
    ramLabel.grid(row=1, column=0, padx=10, pady=10)

    ramEntry = Entry(configWin)
    # Default value is the current RAM
    ramEntry.insert(0, str(product.getRam()))
    ramEntry.grid(row=1, column=1, padx=10, pady=10)

    cancelBtn = Button(configWin, text="Cancel", command=configWin.destroy)
    cancelBtn.grid(row=2, column=0, padx=10, pady=10)

    def submitCmd():
        newRam = int(ramEntry.get())
        cart.setRamOfItem(productIndex, newRam)
        listProducts()  # Refresh the list of products
        configWin.destroy()  # Close the config window

    submitBtn = Button(configWin, text="Submit", command=submitCmd)
    submitBtn.grid(row=2, column=1, padx=10, pady=2)

    configWin.mainloop()  # Start the event loop for the config window


def main():
    setupCart()
    setupMainWin()
    print("Cart is closed, the total price is : £{:.2f}".format(
        cart.getTotal()))

main()