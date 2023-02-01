from Laptop import *;
from GamingLaptop import *;
from ShoppingCart import *;

def testLaptop():
    laptop = Laptop("Dell", "XPS", 999.99)
    print("price: £{:.2f}".format(laptop.getPrice()))
    print("brand:", laptop.getBrand())
    print(laptop)
    laptop.setRam(16)
    print(laptop)
    laptop.setRam(32)
    print(laptop)

def testShoppingCart():
    cart = ShoppingCart()
    laptop1 = Laptop("Dell", "XPS", 999.99)
    laptop2 = Laptop("Lenovo", "ThinkPad", 799.99)
    cart.addItem(laptop1)
    cart.addItem(laptop2)
    cart.addLaptop("Apple", "MacBook Pro", 1299.99)
    print("getTotal method returns: £{:.2f}".format(cart.getTotal()))
    print(cart)
    items = cart.getItems()
    laptop = items[1]
    laptop.setRam(32)
    print(cart)

def testGamingLaptop():
    gamingLaptop = GamingLaptop("Alienware", "m15", 1999.99)
    print("price: £{:.2f}".format(gamingLaptop.getPrice()))
    print(gamingLaptop)
    gamingLaptop.setRam(32)
    print(gamingLaptop)
    gamingLaptop.setGpu("AMD Radeon 12GB")
    print(gamingLaptop)

testLaptop()