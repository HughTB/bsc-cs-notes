# Practical Worksheet P3: Graphical Programming
# your name, your number
from graphics import *;
import math;

def drawStickFigure():
    win = GraphWin("Stick figure")
    head = Circle(Point(100, 60), 20)
    head.draw(win)
    body = Line(Point(100, 80), Point(100, 120))
    body.draw(win)
    legL = Line(Point(100, 120), Point(80, 140))
    legL.draw(win)
    legR = Line(Point(100, 120), Point(120, 140))
    legR.draw(win)
    arms = Line(Point(80, 90), Point(120, 90))
    arms.draw(win)

def drawLine():
    win = GraphWin("Line drawer")
    message = Text(Point(100,100), "Click on first point")
    message.draw(win)
    p1 = win.getMouse()
    message.setText("Click on second point")
    p2 = win.getMouse()
    line = Line(p1, p2)
    line.draw(win)
    message.setText("")

def drawCircle():
    radius = int(input("Enter the radius of the circle: "))
    win = GraphWin("Circle", 300, 300)
    circle = Circle(Point(150, 150), radius)
    circle.draw(win)

def drawArcheryTarget():
    win = GraphWin("Archery Target", 400, 400)
    innerCircle = Circle(Point(200, 200), 50)
    middleCircle = Circle(Point(200, 200), 100)
    outerCircle = Circle(Point(200, 200), 150)

    innerCircle.setFill("yellow")
    innerCircle.setOutline("yellow")
    middleCircle.setFill("red")
    middleCircle.setOutline("red")
    outerCircle.setFill("blue")
    outerCircle.setOutline("blue")

    outerCircle.draw(win)
    middleCircle.draw(win)
    innerCircle.draw(win)

def drawRectangle():
    width = int(input("Enter the width of the rectangle: "))
    height = int(input("Enter the height of the rectangle: "))

    win = GraphWin("Rectangle", 200, 200)

    rectangle = Rectangle(Point(100 - width / 2, 100 - height / 2), Point(100 + width / 2, 100 + height / 2))
    rectangle.draw(win)

def getMousePos():
    win = GraphWin("Click me!", 400, 400)

    for i in range(5):
        p = win.getMouse()
        print(p.getX(), p.getY())
        p.draw(win)
    
def greetings():
    win = GraphWin("Greeter", 400, 400)

    message = Text(Point(200, 100), "Enter your name and click the mouse")
    message.draw(win)
    inputBox = Entry(Point(200, 200), 10)
    inputBox.draw(win)
    
    win.getMouse()

    message.setText(f"Hello, {inputBox.getText()}")

def blueCircle():
    win = GraphWin("Blue Circles", 400, 400)

    while True:
        centre = win.getMouse()

        circle = Circle(centre, 50)
        circle.setFill("blue")
        circle.setOutline("blue")
        circle.draw(win)

def tenLines():
    for i in range(10):
        drawLine()

def tenStrings():
    win = GraphWin("Ten Strings", 400, 400)

    instructions = Text(Point(200, 20), "Enter a string and click where it should appear:")
    instructions.draw(win)
    inputBox = Entry(Point(200, 40), 25)
    inputBox.draw(win)

    for i in range(10):
        p = win.getMouse()
        message = Text(p, inputBox.getText())
        message.draw(win)

def tenColouredRectangles():
    win = GraphWin("Ten Coloured Rectangles", 400, 400)

    instructions = Text(Point(200, 20), "Enter a colour and click the corners of the rectangle:")
    instructions.draw(win)
    colourBox = Entry(Point(200, 40), 25)
    colourBox.draw(win)
    colourBox.setText("blue")

    for i in range(10):
        p1 = win.getMouse()
        p2 = win.getMouse()
        colour = colourBox.getText()

        rectangle = Rectangle(p1, p2)
        rectangle.setFill(colour)
        rectangle.setOutline(colour)
        rectangle.draw(win)

def fiveClickStickFigure():
    win = GraphWin("Five click stick figure", 800, 600)

    centre = win.getMouse()
    edge = win.getMouse()

    xDiff = edge.x - centre.x
    yDiff = edge.y - centre.y
    radius = math.sqrt((xDiff ** 2) + (yDiff ** 2))

    head = Circle(centre, radius)
    head.draw(win)

    bodyPoint = win.getMouse()
    body = Line(Point(centre.x, bodyPoint.y), Point(centre.x, centre.y + radius))
    body.draw(win)

    armPoint = win.getMouse()
    armLength = 2 * (centre.x - armPoint.x)
    armPoint2 = Point(armPoint.x + armLength, armPoint.y)
    arms = Line(armPoint, armPoint2)
    arms.draw(win)

    drawLeg(win, centre, bodyPoint)

    win.getMouse()

def drawLeg(win, centre, bodyPoint):
    """draws the leg"""
    legPoint = win.getMouse()
    leg1 = Line(legPoint, bodyPoint)
    legDiff = centre.x - legPoint.x
    legPoint2 = Point(centre.x + legDiff, legPoint.y)
    leg2 = Line(legPoint2, bodyPoint)
    leg1.draw(win)
    leg2.draw(win)