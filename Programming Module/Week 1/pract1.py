# Practical Worksheet P1: Getting started with Python
# Hugh Baldwin, up2157117


def sayHello():
    print("Hello world")


def count():
    for i in range(10):
        print(i)


def double():
    # here we use the built-in function int since we expect a whole number
    number = int(input("Enter a whole number: "))
    doubled = 2 * number
    print("If you double", number, "you get", doubled)


def kilos2pounds():
    # here we use float since a non-whole number is an acceptable input
    kilos = float(input("Enter a weight in kilograms: "))
    pounds = 2.2 * kilos
    print("The weight in pounds is", pounds)

def sayName():
    print("Hugh Baldwin")

def sayHello2():
    print("Hello\nWorld")

def euros2pounds():
    eur = float(input("Enter a number of euro: "))
    exchange = 1.17
    print(f"€{eur} is equivalent to £{eur / exchange}")

def sumDifference():
    x = int(input("Enter a whole number: "))
    y = int(input("Enter another whole number: "))

    print(f"The sum of {x} and {y} is {x + y}, and the difference is {x - y}")

def changeCounter():
    ones = int(input("Enter how many 1p coins you have: "))
    twos = int(input("Enter how many 2p coins you have: "))
    fives = int(input("Enter how many 5p coins you have: "))

    print(f"You have {ones + twos * 2 + fives * 5} pence")

def tenHellos():
    for i in range(10):
        print("Hello, world!")

def countTo():
    x = int(input("Enter a whole number to count to: "))

    for i in range(1, x + 1):
        print(i)

def zoomZoom():
    x = int(input("Enter a whole number of zooms: "))

    for i in range(1, x + 1):
        print(f"zoom {i}")

def kilos2pounds(kilos):
    return 2.2 * kilos

def weightsTable():
    print("Kilos | Pounds")
    print("--------------")

    for i in range(1, 11):
        print("{:>5.5} |  {:>5.5}".format(str(i * 10), str(kilos2pounds(i * 10))))

def futureValue():
    origval = float(input("Enter the initial value in GBP: "))
    years = int(input("Enter a whole number of years: "))

    oldval = origval
    val = origval

    for i in range(years):
        val *= 1.035
        print("Value after {} year(s): £{:.2f}; having gained £{:.2f} in interest".format(i + 1, val, val - oldval))
        oldval = val

    print("Final value after {} years: £{:.2f}; having gained £{:.2f} total interest".format(years, val, val - origval))

def mult(x, y):
    result = 0
    for i in range(y):
        result += x

    print(f"{x} * {y} = {result}")

def div(x, y):
    tmp = x
    quotient = 0
    remainder = 0

    while tmp >= y:
        tmp -= y
        quotient += 1
    
    remainder = tmp
    
    print(f"{x} / {y} = {quotient}, remainder: {remainder}")

def binConvert():
    binary = input("Enter the value in binary: ")
    decimal = 0

    i = 0
    while i < len(binary):
        if binary[i] == "1":
            decimal += 2 ** (len(binary) - i - 1)
        i += 1

    print(f"{binary}b = {decimal}d")

def div2(x, y):
    quotient = 0

    while x >= y:
        x -= y
        quotient += 1
    
    return (quotient, x)

def decConvert():
    decimal = int(input("Enter a whole number in base 10: "))
    binary = ""

    remainders = []
    quot = decimal

    while quot > 0:
        z = div2(quot, 2)
        quot = z[0]
        remainders.append(z[1])

    for i in range(0, len(remainders)):
        binary = binary + str(remainders[len(remainders) - i - 1])

    print(f"{decimal}d = {binary}b")