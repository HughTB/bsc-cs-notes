from graphics import *;
import random;
import math;

def distanceBetweenPoints(x1, y1, x2, y2):
    xDist = x2 - x1
    yDist = y2 - y1

    distance = math.sqrt((xDist ** 2) + (yDist ** 2))
    return distance

def getInputs():
    numWalks = int(input("How many random walks to take? "))
    distanceFromStart = int(input("How far should the walkers walk? "))

    return numWalks, distanceFromStart

def drawLine(win, p1, p2, colour):
    line = Line(p1, p2)
    line.setFill(colour)
    line.draw(win)

def drawCircleOutline(win, centre, radius, colour):
    circle = Circle(centre, radius)
    circle.setOutline(colour)
    circle.setFill("white")
    circle.draw(win)

def simulateWalk(win, centre, finishDistance):
    distance = 0
    pos = centre
    prevPos = centre
    steps = 0

    colour = color_rgb(random.randint(0, 255), random.randint(0, 255), random.randint(0, 255))
    
    while distance < finishDistance:
        rand = random.random()

        if rand < 0.25:
            pos = Point(pos.getX() + 5, pos.getY())
        elif rand < 0.5:
            pos = Point(pos.getX(), pos.getY() + 5)
        elif rand < 0.75:
            pos = Point(pos.getX() - 5, pos.getY())
        else:
            pos = Point(pos.getX(), pos.getY() - 5)

        drawLine(win, prevPos, pos, colour)
        distance = distanceBetweenPoints(centre.getX(), centre.getY(), pos.getX(), pos.getY())
        prevPos = pos
        steps += 1

    return steps

def simulateWalks(win, centre, finishDistance, numWalks):
    drawCircleOutline(win, centre, finishDistance, "red")
    totalSteps = 0

    walkNoText = Text(Point(centre.getX(), 10), "Walk number: {} / {} ({:.0f}%)".format(0, numWalks, (0 / numWalks) * 100))
    walkNoText.draw(win)

    for i in range(0, numWalks):
        walkNoText.setText("Walk number: {} / {} ({:.0f}%)".format(i, numWalks, (i / numWalks) * 100))
        totalSteps += simulateWalk(win, centre, finishDistance)

    return totalSteps

def displayAverage(win, pos, avg):
    avgText = Text(pos, "Average Steps: {:.2f}".format(avg))
    avgText.draw(win)

def main():
    numWalks, finishDistance = getInputs()

    windowSize = finishDistance * 2 + 40
    centrePoint = Point(windowSize / 2, windowSize / 2)

    win = GraphWin("Graphical Walks", windowSize, windowSize)
    win.setBackground("white")

    totalSteps = simulateWalks(win, centrePoint, finishDistance, numWalks)
    averageSteps = totalSteps / numWalks

    displayAverage(win, Point(centrePoint.getX(), windowSize - 10), averageSteps)

    win.getMouse()

main()