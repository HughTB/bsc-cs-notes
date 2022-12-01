# Practical Worksheet 5: Using functions
# your name, our number


from turtle import distance
from graphics import *
import math


# For exercises 1 and 2
def areaOfCircle(radius):
    return math.pi * radius ** 2


# For exercise 3
def drawCircle(win, centre, radius, colour):
    circle = Circle(centre, radius)
    circle.setFill(colour)
    circle.setWidth(2)
    circle.draw(win)


def drawBrownEyeInCentre():
    window = GraphWin(width=400, height=400)
    # Add your code here
    drawCircle(window, Point(200, 200), 60, "white")
    drawCircle(window, Point(200, 200), 30, "brown")
    drawCircle(window, Point(200, 200), 15, "black")
    window.getMouse()


# For exercise 5
def drawBrownEye(win, centre, radius):
    drawCircle(win, centre, radius, "white")
    drawCircle(win, centre, radius / 2, "brown")
    drawCircle(win, centre, radius / 4, "black")

def drawPairOfBrownEyes():
    win = GraphWin(width=400, height=400)
    drawBrownEye(win, Point(150, 200), 50)
    drawBrownEye(win, Point(250, 200), 50)
    win.getMouse()

def circumferenceOfCircle(radius):
    diameter = radius * 2
    circumference = diameter * math.pi
    return circumference

def circleInfo():
    radius = float(input("Enter a radius: "))

    print(f"The area of that circle is {areaOfCircle(radius):.3f}cm^2, and the circumference {circumferenceOfCircle(radius):.3f}cm")

def drawBlockOfStars(width, height):
    for i in range(0, height):
        print("*" * width)

def drawLetterE():
    drawBlockOfStars(8, 2)
    drawBlockOfStars(2, 2)
    drawBlockOfStars(5, 2)
    drawBlockOfStars(2, 2)
    drawBlockOfStars(8, 2)

def distanceBetweenPoints(p1, p2):
    xDist = p2.getX() - p1.getX()
    yDist = p2.getY() - p1.getY()

    distance = math.sqrt((xDist ** 2) + (yDist ** 2))
    return distance

def drawBlocksOfStars(gap1, block1, gap2, block2, gap3):
    print("{}{}{}{}{}".format(" " * gap1, "*" * block1, " " * gap2, "*" * block2, " " * gap3))

def drawLetterA():
    drawBlocksOfStars(1, 4, 0, 4, 1)
    drawBlocksOfStars(1, 4, 0, 4, 1)
    drawBlocksOfStars(0, 2, 6, 2, 0)
    drawBlocksOfStars(0, 2, 6, 2, 0)
    drawBlocksOfStars(0, 5, 0, 5, 0)
    drawBlocksOfStars(0, 5, 0, 5, 0)
    drawBlocksOfStars(0, 2, 6, 2, 0)
    drawBlocksOfStars(0, 2, 6, 2, 0)
    drawBlocksOfStars(0, 2, 6, 2, 0)

def drawFourPairsOfBrownEyes():
    win = GraphWin("Eyes", 800, 600)

    for i in range(0, 4):
        point1 = win.getMouse()
        point2 = win.getMouse()
        radius = distanceBetweenPoints(point1, point2)

        drawBrownEye(win, point1, radius)
        drawBrownEye(win, Point(point1.getX() + radius * 2, point1.getY()), radius)

    win.getMouse()

def displayTextWithSpaces(text, pos, window, fontSize):
    spacedText = ""

    for i in range(0, len(text)):
        spacedText += text[i] + " "

    message = Text(pos, spacedText)
    message.setSize(fontSize)
    message.draw(window)

def constructVisionChart():
    win = GraphWin("Vision Chart", 800, 600)

    stringOne = input("Enter the first line: ").upper()
    displayTextWithSpaces(stringOne, Point(400, 40), win, 30)
    stringTwo = input("Enter the two line: ").upper()
    displayTextWithSpaces(stringTwo, Point(400, 80), win, 25)
    stringThree = input("Enter the three line: ").upper()
    displayTextWithSpaces(stringThree, Point(400, 110), win, 20)
    stringFour = input("Enter the four line: ").upper()
    displayTextWithSpaces(stringFour, Point(400, 130), win, 15)
    stringFive = input("Enter the five line: ").upper()
    displayTextWithSpaces(stringFive, Point(400, 145), win, 10)
    stringSix = input("Enter the six line: ").upper()
    displayTextWithSpaces(stringSix, Point(400, 155), win, 5)

    win.getMouse()

def drawStickFigure(win, pos, size):
    head = Circle(pos, size)
    head.draw(win)
    body = Line(Point(pos.getX(), pos.getY() + size), Point(pos.getX(), pos.getY() + size * 4))
    body.draw(win)
    legL = Line(Point(pos.getX(), pos.getY() + size * 4), Point(pos.getX() - size, pos.getY() + size * 5))
    legL.draw(win)
    legR = Line(Point(pos.getX(), pos.getY() + size * 4), Point(pos.getX() + size, pos.getY() + size * 5))
    legR.draw(win)
    arms = Line(Point(pos.getX() - size, pos.getY() + size * 2), Point(pos.getX() + size, pos.getY() + size * 2))
    arms.draw(win)

def drawStickFigureFamily():
    win = GraphWin("Stick figure family", 800, 600)
    
    drawStickFigure(win, Point(200, 200), 20)
    drawStickFigure(win, Point(300, 200), 30)
    drawStickFigure(win, Point(400, 200), 10)
    drawStickFigure(win, Point(500, 200), 15)

    win.getMouse()