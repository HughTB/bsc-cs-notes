from tkinter import *;
from backend import ShoppingCart, GamingLaptop;
import datetime;

mainWin = Tk()
cart = ShoppingCart()
vouchers = ["C3BSE2JaAmhlc", "f3gdqwMvX3o84", "JLjAws3didoq6"]

def setupCart():
    """
    Add some products to the cart.
    """
    cart.addLaptop("Apple", "MacBook Air", 999.99)
    cart.addLaptop("Razer", "Blade", 1799.99)
    cart.addLaptop("Microsoft", "Surface", 900.00)
    alien = GamingLaptop("Alienware", "m15", 1999.99)
    razer = GamingLaptop("Razer", "Blade", 2499.99)
    razer.setGpu("AMD Radeon 12GB")
    msi = GamingLaptop("MSI", "GS65", 1799.99)

    cart.addItem(alien)
    cart.addItem(razer)
    cart.addItem(msi)

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

    voucherBtn = Button(mainWin, text="Pay with Voucher", command=payVoucher)
    voucherBtn.grid(row=100, column=0, padx=15, pady=10, sticky="w")

    cardBtn = Button(mainWin, text="Pay with Card", command=payCard)
    cardBtn.grid(row=100, column=1, padx=15, pady=10, sticky="e")

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
    configWin.geometry("340x125")
    configWin.resizable(False, False)

    product = cart.getItemAt(productIndex)
    configWin.title("Configure {} {}".format(
        product.getBrand(), product.getModel()))

    prodLabel = Label(configWin, text=f"Configure {product.getBrand()} {product.getModel()}")
    prodLabel.grid(row=0, column=0, columnspan=2)

    brandLabel = Label(configWin, text="Brand: ", anchor="e", width=20)
    brandLabel.grid(row=1, column=0)

    brandEntry = Entry(configWin)
    brandEntry.insert(0, product.getBrand())
    brandEntry.grid(row=1, column=1)
    brandEntry.configure(state=DISABLED)

    modelLabel = Label(configWin, text="Model: ", anchor="e", width=20)
    modelLabel.grid(row=2, column=0)

    modelEntry = Entry(configWin)
    modelEntry.insert(0, product.getModel())
    modelEntry.grid(row=2, column=1)
    modelEntry.configure(state=DISABLED)

    ramLabel = Label(configWin, text="Enter RAM capacity (GB): ", anchor="e", width=20)
    ramLabel.grid(row=3, column=0)

    ramEntry = Entry(configWin)
    # Default value is the current RAM
    ramEntry.insert(0, str(product.getRam()))
    ramEntry.grid(row=3, column=1)

    if isinstance(product, GamingLaptop):
        configWin.geometry("340x140")

        gpuLabel = Label(configWin, text="Enter GPU: ", anchor="e", width=20)
        gpuLabel.grid(row=4, column=0)

        gpuEntry = Entry(configWin)
        # Default value is the current RAM
        gpuEntry.insert(0, str(product.getGpu()))
        gpuEntry.grid(row=4, column=1)

    cancelBtn = Button(configWin, text="Cancel", command=configWin.destroy)
    cancelBtn.grid(row=5, column=0)

    def submitCmd():
        newRam = int(ramEntry.get())
        cart.setRamOfItem(productIndex, newRam)
        product.setGpu(gpuEntry.get())
        listProducts()  # Refresh the list of products
        configWin.destroy()  # Close the config window

    submitBtn = Button(configWin, text="Submit", command=submitCmd)
    submitBtn.grid(row=5, column=1)

    configWin.mainloop()  # Start the event loop for the config window

def payVoucher():
    paymentWin = Toplevel()
    paymentWin.geometry("200x80")
    paymentWin.resizable(False, False)
    paymentWin.title("Checkout")

    paymentWin.columnconfigure(0, weight=1)
    paymentWin.columnconfigure(1, weight=1)

    instructionLabel = Label(paymentWin, text="Please enter your voucher")
    instructionLabel.grid(row=0, column=0, columnspan=2)

    voucherLabel = Label(paymentWin, text="Voucher: ")
    voucherLabel.grid(row=1, column=0)

    voucherEntry = Entry(paymentWin, width=13)
    voucherEntry.grid(row=1, column=1)

    cancelBtn = Button(paymentWin, text="Cancel", command=paymentWin.destroy)
    cancelBtn.grid(row=2, column=0)

    def submitCmd():
        if voucherEntry.get() in vouchers:
            paymentWin.destroy()
            mainWin.destroy()
        else:
            instructionLabel.configure(text="Invalid voucher, please try again")

    submitBtn = Button(paymentWin, text="Submit", command=submitCmd)
    submitBtn.grid(row=2, column=1)

    paymentWin.mainloop()

def payCard():
    paymentWin = Toplevel()
    paymentWin.geometry("200x180")
    paymentWin.resizable(False, False)
    paymentWin.title("Checkout")

    paymentWin.grid_columnconfigure(0, weight=1)
    paymentWin.grid_columnconfigure(1, weight=2)

    instructionLabel = Label(paymentWin, text="Please enter your card details")
    instructionLabel.grid(row=0, column=0, columnspan=2)

    cardHolderLabel = Label(paymentWin, text="Card Holder", anchor="w", width=20)
    cardHolderLabel.grid(row=1, column=0, columnspan=2)
    cardHolderEntry = Entry(paymentWin)
    cardHolderEntry.grid(row=2, column=0, columnspan=2)

    cardNoLabel = Label(paymentWin, text="Card Number", anchor="w", width=20)
    cardNoLabel.grid(row=3, column=0, columnspan=2)
    cardNoEntry = Entry(paymentWin)
    cardNoEntry.grid(row=4, column=0, columnspan=2)

    expiryLabel = Label(paymentWin, text="Expiry Date", anchor="w", width=12)
    expiryLabel.grid(row=5, column=0)
    expiryEntry = Entry(paymentWin)
    expiryEntry.grid(row=5, column=1)

    cvvLabel = Label(paymentWin, text="CVV", anchor="w", width=12)
    cvvLabel.grid(row=6, column=0)
    cvvEntry = Entry(paymentWin)
    cvvEntry.grid(row=6, column=1)

    cancelBtn = Button(paymentWin, text="Cancel", command=paymentWin.destroy)
    cancelBtn.grid(row=7, column=0)

    def submitCmd():
        today = datetime.date.today()
        expiry = expiryEntry.get()
        expiry = expiry.split("/")
        expiry = datetime.date(int(f"20{expiry[1]}"), int(expiry[0]), 1)
        success = True

        if len(cardNoEntry.get()) != 16:
            success = False
            instructionLabel.configure(text="Invalid Card Number")
        if len(cvvEntry.get()) != 3:
            success = False
            instructionLabel.configure(text="Invalid CVV")
        if expiry < today:
            success = False
            instructionLabel.configure(text="Invalid Expiry Date")

        if success:
            paymentWin.destroy()
            mainWin.destroy()

    submitBtn = Button(paymentWin, text="Submit", command=submitCmd)
    submitBtn.grid(row=7, column=1)

def main():
    setupCart()
    setupMainWin()
    print("Cart is closed, the total price is : £{:.2f}".format(
        cart.getTotal()))

main()