# Practical Worksheet 6: if statements and for loops
# your name, your number


from graphics import *
import math
import random

# For exercises 8 & 11
def drawCircle(win, centre, radius, colour):
    circle = Circle(centre, radius)
    circle.setFill(colour)
    circle.setWidth(2)
    circle.draw(win)


# For exercise 8
def drawColouredEye(win, centre, radius, colour):
    drawCircle(win, centre, radius, "white")
    drawCircle(win, centre, radius / 2, colour)
    drawCircle(win, centre, radius / 4, "black")

def fastFoodOrderPrice():
    price = float(input("Enter the price of your takeaway: "))

    if price >= 10.0:
        print("The total price of your order is: {:.2f}".format(price))
    elif price < 10.0:
        print("The total price of your order is: {:.2f}".format(price + 1.5))

def whatToDoToday():
    temp = int(input("Enter the current temperature: "))

    if temp > 25:
        print("Swim in the sea!")
    elif temp <= 25 and temp >= 10:
        print("Shopping in Gunwharf Quays is a good idea!")
    else:
        print("Watch a film at home!")

def displaySquareRoots(lower, upper):
    for i in range(lower, upper + 1):
        print("The square root of {} is {:.3f}".format(i, math.sqrt(i)))

def calculateGrade(marks):
    if marks < 0 or marks > 20:
        return "X"
    if marks >= 16 and marks <= 20:
        return "A"
    elif marks >= 12:
        return "B"
    elif marks >= 8:
        return "C"
    elif marks >= 0:
        return "F"

def peasInAPod():
    num = int(input("How many peas to draw: "))

    win = GraphWin("Peas in a Pod", 100 * num, 100)
    
    for i in range(0, num):
        pea = Circle(Point(50 + 100 * i, 50), 50)
        pea.setFill("lime")
        pea.draw(win)

    win.getMouse()
    win.close()

def ticketPrice(distance, age):
    price = 3
    price += distance * 0.15

    if age >= 60 or age <= 15:
        price *= 0.6

    return price

def numberedSquare(num): 
    for i in range(num, 0, -1):
        line = ""
        for j in range(0, num):
            line += " {}".format(i + j)
        print(line)

def eyePicker():
    validColours = ["blue", "grey", "green", "brown"]

    x = int(input("Enter the x position: "))
    y = int(input("Enter the y position: "))
    centre = Point(x, y)
    radius = int(input("Enter the radius: "))
    colour = input("Enter the colour: ")

    if colour in validColours:
        win = GraphWin("Eye", 400, 400)
        drawColouredEye(win, centre, radius, colour)
        win.getMouse()
        win.close()
    else:
        print("Not a valid eye colour")

def drawPatchWindow():
    win = GraphWin("Patch window", 200, 200)

    topLeftCorner = Point(0, 0)
    colour = "red"

    for i in range(0, 10):
        rect = Rectangle(Point(topLeftCorner.getX() + 5 * i, topLeftCorner.getY() + 5 * i), Point(topLeftCorner.getX() + 100 - 5 * i, topLeftCorner.getY() + 100 - 5 * i))
        rect.setFill(colour if i % 2 == 0 else "white")
        rect.setOutline(colour if i % 2 == 0 else "white")
        rect.draw(win)

    win.getMouse()
    win.close()

def drawPatch(win, x, y, colour):
    topLeftCorner = Point(x, y)

    for i in range(0, 10):
        rect = Rectangle(Point(topLeftCorner.getX() + 5 * i, topLeftCorner.getY() + 5 * i), Point(topLeftCorner.getX() + 100 - 5 * i, topLeftCorner.getY() + 100 - 5 * i))
        rect.setFill(colour if i % 2 == 0 else "white")
        rect.setOutline(colour if i % 2 == 0 else "white")
        rect.draw(win)

def drawPatchWork():
    win = GraphWin("Patchwork", 300, 200)

    for i in range(0, 6):
        drawPatch(win, 0 + 100 * (i % 3), 0 if i < 3 else 100, "blue")

    win.getMouse()
    win.close()

def eyesAllAround():
    win = GraphWin("Eyes all around", 500, 500)
    colours = ["blue", "grey", "green", "brown"]

    for i in range(0, 30):
        centre = win.getMouse()
        drawColouredEye(win, centre, 30, colours[i % len(colours)])

def distanceBetweenPoints(p1, p2):
    xDist = p2.getX() - p1.getX()
    yDist = p2.getY() - p2.getY()

    distance = math.sqrt((xDist ** 2) + (yDist ** 2))
    return distance

def archeryGame():
    win = GraphWin("Archery Game", 400, 400)

    drawCircle(win, Point(200, 200), 150, "blue")
    drawCircle(win, Point(200, 200), 100, "red")
    drawCircle(win, Point(200, 200), 50, "yellow")

    score = 0

    for i in range(0, 5):
        hitPoint = win.getMouse()
        hitPoint = Point(hitPoint.getX() + random.randint(1, 5), hitPoint.getY() + random.randint(1, 5))

        distance = distanceBetweenPoints(hitPoint, Point(200, 200))

        if distance <= 50:
            score += 10
        elif distance <= 100:
            score += 5
        elif distance <= 150:
            score += 2

        drawCircle(win, hitPoint, 5, "black")

    scoreText = Text(Point(200, 200), "Final score: {}".format(score))
    scoreText.setSize(20)
    scoreText.draw(win)
    win.getMouse()
    win.close()

def drawPatch2(win, x, y, colour):
    for i in range(0, 10):
        line = Line(Point(x, y + (i * 10)), Point(x + (i * 10) + 10, y + 100))
        line.setFill(colour)
        line.draw(win)
        line2 = Line(Point(x + (i * 10), y), Point(x + 100, y + (i * 10) + 10))
        line2.setFill(colour)
        line2.draw(win)

def drawPatchWork2():
    win = GraphWin("Patchwork", 300, 200)

    for i in range(0, 6):
        drawPatch2(win, 0 + 100 * (i % 3), 0 if i < 3 else 100, "blue")

    win.getMouse()
    win.close()

drawPatchWork2()