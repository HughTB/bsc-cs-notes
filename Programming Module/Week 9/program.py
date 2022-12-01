from graphics import *
from patches import *
import math


def main():
    screenSize = 800
    win = GraphWin("Test", screenSize, screenSize)
    colours = ["blue", "green", "orange", "white"]
    alternateFlag = True
    for y in range(0, screenSize, 100):
        for x in range(0, screenSize, 100):
            tlPoint = Point(x, y)
            if alternateFlag:
                patch2(win,colours,tlPoint)
            else:
                patch1(win,colours,tlPoint)
            alternateFlag = not alternateFlag
    win.getMouse()

main()