from graphics import *;
import time;

class MyPoint():
    """
    A class to represent a point in on the graphics window.
    A point has an `x` and `y` coordinate and can be moved
    or drawn on the graphics window.    
    """

    def __init__(self, x, y):
        self.x = x
        self.y = y

    def getX(self):
        """
        Returns the value of the instance variable `x`.
        """
        return self.x

    def getY(self):
        """
        Returns the value of the instance variable `y`.
        """
        return self.y

    def move(self, dx, dy):
        """
        Moves the point by `dx` units in the x direction
        and `dy` units in the y direction.
        """
        self.x = self.x + dx
        self.y = self.y + dy

    def __str__(self):
        output = "MyPoint({0}, {1})".format(self.x, self.y)
        return output

    def draw(self, win):
        """
        Draws the point on a given graphics window `win`.
        """
        point = Point(self.x, self.y)
        point.draw(win)


class Square():
    """
    A class to represent a square on the graphics window.
    A square has a top left point, a side length.
    Also a fill colour which is black by default.
    A square can be moved, drawn and filled with a colour.
    """

    def __init__(self, topLeftPoint, sideLength):
        self.fillColour = "black"
        self.outlineColour = "black"
        self.p1 = topLeftPoint
        self.side = sideLength
        p2x = self.p1.getX() + sideLength
        p2y = self.p1.getY() + sideLength
        self.p2 = MyPoint(p2x, p2y)

    def getSide(self):
        """
        Returns the value of the instance variable `side`.
        """
        return self.side

    def getP1(self):
        """
        Returns the value of the top left point (instance variable `p1`)
        """
        return self.p1

    def getP2(self):
        """
        Returns the value of the bottom right point (instance variable `p2`)
        """
        return self.p2
    
    def getCenter(self):
        return Point(self.p1.getX() + self.side / 2, self.p1.getY() + self.side / 2)

    def move(self, dx, dy):
        """
        Moves the square by `dx` units in the x direction
        and `dy` units in the y direction.
        """
        self.p1.move(dx, dy)
        self.p2.move(dx, dy)

    def __str__(self):
        output = "Square({0}, {1})".format(self.p1, self.side)
        return output

    def setFill(self, colour):
        """
        Sets the fill colour of the square to `colour`.
        """
        self.fillColour = colour

    def setOutline(self, colour):
        self.outlineColour = colour

    def draw(self, win):
        """
        Draws the square on a given graphics window `win`.
        It also fills the square with the fill colour.
        """
        p1 = Point(self.p1.getX(), self.p1.getY())
        p2 = Point(self.p2.getX(), self.p2.getY())
        square = Rectangle(p1, p2)
        square.setFill(self.fillColour)
        square.setOutline(self.outlineColour)
        square.draw(win)

class MyCircle():
    def __init__(self, centre: MyPoint, radius: int):
        self.fillColour = "white"
        self.outlineColour = "black"
        self.centre = centre
        self.radius = radius

        self.circle = Circle(Point(centre.getX(), centre.getY()), radius)
        self.circle.setFill(self.fillColour)
        self.circle.setOutline(self.outlineColour)

    def __str__(self):
        return f"MyCircle(MyPoint({self.centre.getX()}, {self.centre.getY()}), {self.radius})"

    def getCenter(self):
        return self.centre
    
    def getRadius(self):
        return self.radius
    
    def move(self, x, y):
        self.circle.move(x, y)
        self.centre = MyPoint(self.centre.getX() + x, self.centre.getY() + y)

    def draw(self, win):
        self.circle.draw(win)

class StickFigure():
    def __init__(self, centreOfHead: MyPoint, size: int):
        self.centre = centreOfHead
        self.colour = "black"
        self.size = size
        
        self.head = Circle(Point(self.centre.getX(), self.centre.getY()), size)
        self.body = Line(Point(self.centre.getX(), self.centre.getY() + size), Point(self.centre.getX(), self.centre.getY() + 3 * size))
        self.arms = Line(Point(self.centre.getX() - size, self.centre.getY() + 2 * size), Point(self.centre.getX() + size, self.centre.getY() + 2 * size))
        self.leftLeg = Line(Point(self.centre.getX(), self.centre.getY() + 3 * size), Point(self.centre.getX() - size, self.centre.getY() + 4 * size))
        self.rightLeg = Line(Point(self.centre.getX(), self.centre.getY() + 3 * size), Point(self.centre.getX() + size, self.centre.getY() + 4 * size))

        self.setColour(self.colour)

    def __str__(self):
        return f"StickFigure(MyPoint({self.centre.getX()}, {self.centre.getY()}), {self.size}"
    
    def setColour(self, colour):
        self.colour = colour

        self.head.setFill(self.colour)
        self.head.setOutline(self.colour)
        self.body.setFill(self.colour)
        self.arms.setFill(self.colour)
        self.leftLeg.setFill(self.colour)
        self.rightLeg.setFill(self.colour)

    def move(self, x, y):
        self.head.move(x, y)
        self.body.move(x, y)
        self.arms.move(x, y)
        self.leftLeg.move(x, y)
        self.rightLeg.move(x, y)

    def draw(self, win: GraphWin):
        self.head.draw(win)
        self.body.draw(win)
        self.arms.draw(win)
        self.leftLeg.draw(win)
        self.rightLeg.draw(win)

class DigitalClock():
    def __init__(self, tlPoint: Point, fill = "white", outline = "orange", size = 1):
        self.tlPoint = tlPoint
        self.size = size
        self.brPoint = Point(tlPoint.getX() + 70 * self.size, tlPoint.getY() + 20 * self.size)

        self.box = Rectangle(self.tlPoint, self.brPoint)
        self.box.setFill(fill)
        self.box.setOutline(outline)
        self.box.setWidth(3 * size)
        self.timeText = Text(Point(tlPoint.getX() + 35 * self.size, tlPoint.getY() + 12 * self.size), "00:00:00")
        self.timeText.setSize(12 * self.size)
        self.updateTime()

    def updateTime(self):
        self.timeText.setText(time.strftime("%H:%M:%S"))

    def animate(self, win):
        self.box.draw(win)
        self.timeText.draw(win)

        while True:
            time.sleep(1)
            self.updateTime()

def testSquare():
    """
    Tests the `Square` class we have created.
    """
    win = GraphWin()
    p1 = MyPoint(100, 50)
    square = Square(p1, 50)
    print(square.getSide())  # 50
    print(square.getP1())  # MyPoint(100, 50)
    print(square.getP2())  # MyPoint(150, 100)
    # Moves the square by 10 units in the x and 20 units in the y direction.
    square.move(10, 20)
    print(square.getP1())  # MyPoint(110, 70)
    print(square.getP2())  # MyPoint(160, 120)
    print(square)  # Square(MyPoint(100, 50), 50)

    print(square.getCenter()) # Q3

    square.setFill("red")

    square.setOutline("blue") # Q2

    square.draw(win)
    win.mainloop()


def testPoint():
    """
    Tests the `Point` class from the graphics module.
    """
    win = GraphWin()
    point = Point(100, 50)
    print(point.getX())  # 100.0
    print(point.getY())  # 50.0
    # Moves the point by 10 units in the x and 20 units in the y direction.
    point.move(10, 20)
    print(point.getX())  # 110.0
    print(point.getY())  # 70.0
    print(point)  # Point(100.0, 50.0)
    point.draw(win)
    print(type(point))
    win.mainloop()


def testMyPoint():
    """
    Tests the `MyPoint` class we have created.
    """
    win = GraphWin()
    myPoint = MyPoint(100, 50)
    print(myPoint.getX())  # 100
    print(myPoint.getY())  # 50
    # Moves the point by 10 units in the x and 20 units in the y direction.
    myPoint.move(10, 20)
    print(myPoint.getX())  # 110
    print(myPoint.getY())  # 70
    print(myPoint)  # MyPoint(110, 70)
    myPoint.draw(win)
    win.mainloop()

def testCircle():
    win = GraphWin()
    circle = MyCircle(MyPoint(100, 50), 50)
    print(circle.getCenter()) # MyPoint(100, 50)
    print(circle.getRadius()) # 50
    circle.move(10, 20)
    print(circle.getCenter()) # MyPoint(110, 70)
    print(circle) # MyCircle(MyPoint(100, 50), 50)
    circle.draw(win) # Optional!
    win.mainloop()

def testStickFigure():
    win = GraphWin()
    stickFigure = StickFigure(MyPoint(100, 50), 30)
    print(stickFigure)
    stickFigure.move(10, 10)
    print(stickFigure)
    stickFigure.draw(win)
    stickFigure.setColour("red")

    win.getMouse()

def testClock():
    size = 20

    win = GraphWin("Clock", 20 + 70 * size, 20 + 20 * size)

    clock = DigitalClock(Point(10, 10), size=size, outline=color_rgb(134, 53, 227))

    clock.animate(win)

testClock()