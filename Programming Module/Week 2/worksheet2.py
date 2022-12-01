import math;

def circumferenceOfCircle():
    radius = float(input("Please enter the radius of the circle in cm: "))
    circumference = 2 * math.pi * radius

    print(f"The circumference of the circle is {circumference}cm")

def areaOfCircle():
    radius = float(input("Enter the radius of the circle in cm: "))
    area = math.pi * (radius**2)

    print(f"The area of the circle is {area}cm^2")

def costOfPizza():
    diameter = float(input("Enter the diameter of the pizza in cm: "))
    radius = diameter / 2
    area = math.pi * (radius**2)
    costOfIngredients = 1.5
    costOfPizza = area * costOfIngredients

    print(f"That pizza would cost {costOfPizza}p")

def slopeOfLine():
    x1 = float(input("Please enter x1: "))
    y1 = float(input("Please enter y1: "))
    x2 = float(input("Please enter x2: "))
    y2 = float(input("Please enter y2: "))

    gradient = (y2 - y1) / (x2 - x1)

    print(f"The gradient of that line is {gradient}")

def distanceBetweenPoints():
    x1 = float(input("Please enter x1: "))
    y1 = float(input("Please enter y1: "))
    x2 = float(input("Please enter x2: "))
    y2 = float(input("Please enter y2: "))

    xDiff = x2 - x1
    yDiff = y2 - y1
    distance = math.sqrt((xDiff ** 2) + (yDiff ** 2))

    print(f"The distance between those points is {distance}")

def travelStatistics():
    speed = float(input("Enter the average speed of your journey (km/h): "))
    hours = float(input("Enter the number of hours spent travelling: "))
    fuelEfficiency = 5

    distance = speed * hours
    fuelUsed = distance / fuelEfficiency

    print(f"You travelled {distance}km in {hours}hr and used {fuelUsed}litres of fuel")

def sumOfSquares():
    n = int(input("How many squares? "))
    total = 0

    for i in range(0, n):
        total += (i + 1)**2

    print(f"The sum of the first {n} squares is {total}")

def averageOfNumbers():
    n = int(input("Enter the number of numbers to average: "))
    total = 0

    for i in range(0, n):
        total += int(input(f"Enter number {i + 1}: "))

    average = total / n

    print(f"The average of those {n} numbers is {average}")

def fibonacci():
    n = int(input("Enter which fibonacci number you would like: "))
    count = 0

    n1 = 0
    n2 = 1

    while count < n:
        current = n1 + n2
        n1 = n2
        n2 = current
        count += 1

    print(f"Fibonacci number {n} is {n1}")

def selectCoins():
    total = int(input("Enter an amount of money in pence: "))
    value = total
    #       £2,£1,50,20,10,5p,2p,1p
    coins = [0, 0, 0, 0, 0, 0, 0, 0]

    coins[0] = total // 200
    total %= 200
    coins[1] = total // 100
    total %= 100
    coins[2] = total // 50
    total %= 50
    coins[3] = total // 20
    total %= 20
    coins[4] = total // 10
    total %= 10
    coins[5] = total // 5
    total %= 5
    coins[6] = total // 2
    total %= 2
    coins[7] = total

    print(f"You can make {value}p with £2 x {coins[0]}, £1 x {coins[1]}, 50p x {coins[2]}, 20p x {coins[3]}, 10p x {coins[4]}, 5p x {coins[5]}, 2p x {coins[6]}, 1p x {coins[7]}")
