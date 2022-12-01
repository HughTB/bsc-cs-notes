from graphics import *;
import random;

def drawRectangle(win, point1, point2, colour):
    rectangle = Rectangle(point1, point2)
    rectangle.setFill(colour)
    rectangle.setOutline(colour)
    rectangle.draw(win)

def drawText(win, pos, colour, text):
    text = Text(pos, text)
    text.setTextColor(colour)
    text.draw(win)

def drawHouse(win, doorColour, lightsProb, houseNo, offset):
    roof = Polygon(Point(2 + offset, 60), Point(42 + offset, 2),
                   Point(158 + offset, 2), Point(198 + offset,60))
    roof.setFill("pink")
    roof.draw(win)

    # draw wall and door
    drawRectangle(win, Point(2 + offset, 60), Point(198 + offset, 198), "brown")
    drawRectangle(win, Point(30 + offset, 110), Point(80 + offset, 198), doorColour)

    drawText(win, Point(55 + offset, 154), "black", str(houseNo))

    # draw window
    if random.random() < lightsProb:
        windowColour = "yellow"
    else:
        windowColour = "black"

    drawRectangle(win, Point(110 + offset, 110), Point(170 + offset, 170), windowColour)

def getInputs():
    windowSize = int(input("Enter the height of the window: "))
    doorColour = input("Enter door colour: ")
    numHouses = int(input("Enter the number of houses: "))
    lightsProb = float(input("Enter the probability that a house has it's lights on: "))
    return windowSize, doorColour, numHouses, lightsProb

def main():
    windowSize, doorColour, numHouses, lightsProb = getInputs()

    win = GraphWin("Street", windowSize * numHouses, windowSize)
    win.setCoords(0, 200, 200 * numHouses, 0)

    for i in range(0, numHouses):
        drawHouse(win, doorColour, lightsProb, i + 1, 200 * i)

    win.getMouse()

main()