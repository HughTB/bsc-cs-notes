from Laptop import *;

gpuOptions = {
    "NVIDIA GeForce 4GB": 0.00,
    "NVIDIA GeForce 8GB": 199.99,
    "AMD Radeon 12GB": 299.99,
}

class GamingLaptop(Laptop):
    def __init__(self, brand, model, basePrice):
        super().__init__(brand, model, basePrice)
        self.gpu = "NVIDIA GeForce 4GB"

    def setGpu(self, newGpu):
        if newGpu in gpuOptions:
            self.gpu = newGpu
            self.price += gpuOptions[newGpu]

    def __str__(self):
        return f"{self.brand} {self.model} {self.ram}GB {self.gpu} £{self.price:.2f}"