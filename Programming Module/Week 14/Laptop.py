ramOptions = {
    8: 0.00,
    16: 59.99,
    32: 92.50,
}

ssdOptions = {
    "256GB": 0.00,
    "512GB": 30.00,
    "1TB": 100.00
}

class Laptop:
    def __init__(self, brand, model, basePrice):
        self.brand = brand
        self.model = model
        self.price = basePrice
        self.ram = 8
        self.ssd = "256GB"

    def getPrice(self):
        return self.price
    
    def setRam(self, newRam):
        if newRam in ramOptions:
            self.price -= ramOptions[self.ram]
            self.ram = newRam
            self.price += ramOptions[newRam]

    def getSsd(self):
        return self.ssd

    def setSsd(self, newSsd):
        if newSsd in ssdOptions:
            self.price -= ssdOptions[self.ssd]
            self.ssd = newSsd
            self.price += ssdOptions[newSsd]

    def getBrand(self):
        return self.brand

    def __str__(self):
        return f"{self.brand} {self.model} {self.ram}GB {self.ssd} £{self.price:.2f}"