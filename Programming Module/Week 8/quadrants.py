from graphics import *;
from utils import *;

def circle(win, centre, radius, colour, outline):
    c = Circle(centre, radius)
    c.setFill(colour)
    c.setOutline(outline)
    c.draw(win)
    return c

def drawCircleInQuad(win, centre, radius):
        # Set default colours for top left corner
        colour = "black"
        outline = "black"

        if centre.x > 200: # Set colours for top right corner
            colour = "purple"
            outline = "black"
        if centre.y > 200: # Set colours for bottom left corner
            colour = "white"
            outline = "black"
        if centre.x > 200 and centre.y > 200: # Set colours for bottom right corner
            colour = "purple"
            outline = "purple"

        circle(win, centre, radius, colour, outline)

def drawPattern():
    win = GraphWin("Quadrant Pattern", 400, 400)

    for j in range(0, 2):
        for i in range(0, 4):
            win.getMouse()
            drawCircleInQuad(win, Point(125 + 50 * i, 175 + 50 * j), 25)
    
    win.getMouse()

def main():
    win = GraphWin("Quadrants", 400, 400)
    win.setBackground("gray")

    for i in range(0, 10):
        centre = win.getMouse()

        drawCircleInQuad(win, centre, 25)

    win.getMouse()

drawPattern()