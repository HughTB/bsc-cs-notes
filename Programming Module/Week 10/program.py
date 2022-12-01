from patches import *


def main():
    screenSize = 700
    win = GraphWin("Test", screenSize, screenSize)
    colours = ["blue", "orange", "red", "white"]
    alternateFlag = True

    # STEP 3
    for y in range(0, screenSize, 100):
        for x in range(0, screenSize, 100):
            tlPoint = Point(x, y)
            if y == 0 or x == 0 or y == screenSize - 100 or x == screenSize - 100:  # if alternateFlag:  #if y  == 0 or x == 0   #or x == 400 or y == 400:
                colour = colours[0]
                patchF(win, colour, tlPoint)
            elif y == x:
                colour = colours[1]
                patchB(win, colour, tlPoint)
            else:
                colour = colours[2]
                patchP(win, colour, tlPoint)
            alternateFlag = not alternateFlag
    win.getMouse()


main()
