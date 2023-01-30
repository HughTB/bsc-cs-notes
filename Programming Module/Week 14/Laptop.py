ramOptions = {
    8: 0.00,
    16: 59.99,
    32: 92.50,
}

class Laptop:
    def __init__(self, brand, model, basePrice):
        self.brand = brand
        self.model = model
        self.price = basePrice
        self.ram = 8

    def getPrice(self):
        return self.price
    
    def setRam(self, newRam):
        if newRam in ramOptions:
            self.ram = newRam
            self.price += ramOptions[newRam]

    def __str__(self):
        return f"{self.brand} {self.model} {self.ram}GB £{self.price:.2f}"