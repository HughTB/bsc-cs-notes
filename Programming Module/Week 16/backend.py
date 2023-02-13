ramOptions = {
    8: 0.00,
    16: 59.99,
    32: 92.50,
}


class Laptop():
    """
    A class to represent a laptop.
    A laptop has a brand, model, price and ram.
    The price is the base price plus the cost of the ram.
    The ram is 8GB by default.
    """

    def __init__(self, brand, model, basePrice):
        self.brand = brand
        self.model = model
        self.basePrice = basePrice
        self.price = basePrice
        self.ram = 8

    def getBrand(self):
        """
        Returns the brand of the laptop.
        """
        return self.brand

    def getModel(self):
        """
        Returns the model of the laptop.
        """
        return self.model

    def getPrice(self):
        """
        Returns the price of the laptop.
        """
        return self.price

    def getRam(self):
        """
        Returns the ram of the laptop.
        """
        return self.ram

    def setRam(self, newRam):
        """
        Sets the ram of the laptop to the given value.
        If newRam is not in the ramOptions dictionary, the ram is not changed.
        The price is updated to include the cost of the newRam.
        """
        if newRam in ramOptions:
            self.ram = newRam
            costOfRam = ramOptions[newRam]
            self.price = self.basePrice + costOfRam

    def __str__(self):
        output = "{} {}".format(self.brand, self.model)
        output += " {}GB".format(self.ram)
        output += " £{:.2f}".format(self.price)
        return output


class ShoppingCart():
    """
    A class to represent a shopping cart.
    A shopping cart has a list of items and a total price.
    The total price is the sum of the prices of the items.
    """

    def __init__(self):
        self.items = []
        self.total = 0

    def getItems(self):
        """
        Returns the list of items in the cart.
        """
        return self.items

    def getItemAt(self, index):
        """
        Return the item at the specified `index`.
        """
        return self.items[index]

    def getCartLength(self):
        """
        Return the count of products in `items`.
        """
        return len(self.items)

    def getTotal(self):
        """
        Returns the total price of the items in the cart.
        """
        return self.total

    def addItem(self, item):
        """
        Adds the given item to the cart.
        """
        self.items.append(item)
        self.total = self.total + item.getPrice()

    def addLaptop(self, brand, model, basePrice):
        """
        Adds a new laptop to the cart.
        The laptop is created using the given brand, model and base price.
        """
        newLaptop = Laptop(brand, model, basePrice)
        self.items.append(newLaptop)
        self.total = self.total + newLaptop.getPrice()

    def setRamOfItem(self, index, ram):
        """
        Sets the ram of the item at the given index to the given value.
        """
        item = self.items[index]
        oldPrice = item.getPrice()
        item.setRam(ram)
        newPrice = item.getPrice()
        self.total = self.total - oldPrice + newPrice

    def __str__(self):
        output = "Shopping cart contains:\n"
        for item in self.items:
            output += "{}\n".format(item)
        output += "Total: £{:.2f}".format(self.total)
        return output
