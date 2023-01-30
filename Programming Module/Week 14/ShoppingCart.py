from Laptop import *;

class ShoppingCart():
    def __init__(self):
        self.items = []
        self.total = 0

    def getItems(self):
        return self.items
    
    def addItem(self, item):
        self.items.append(item)
        self.total += item.getPrice()

    def addLaptop(self, brand, model, price): # From Nad's lecture
        laptop = Laptop(brand, model, price)
        self.items.append(laptop)
        self.total += laptop.getPrice()

    def getTotal(self):
        return self.total
    
    def __str__(self):
        output = "Shopping cart contains:\n"

        for item in self.items:
            output += f"    {item}\n"

        output += f"Total: {self.total:.2f}"
        return output