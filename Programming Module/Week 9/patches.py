from graphicalObjects import *


def patch2(win, colours, tlOffset):
    screenSize = 110
    scale = 20
    alternateFlag = True
    for y in range(0, screenSize, scale):
        for x in range(0, screenSize, scale):
            tl = Point(tlOffset.getX() + x, tlOffset.getY() + y)
            br = brPoint(tl, scale, scale)
            if alternateFlag:
                circlefromTL(win, tl, 10, colours[0])
            else:
                rectangle(win, tl, br, colours[2])

            alternateFlag = not alternateFlag


def patch1(win, colours, tlOffset):
    screenSize = 110
    scale = 20
    alternateFlag = True
    for y in range(0, screenSize, scale):
        for x in range(0, screenSize, scale):
            tl = Point(tlOffset.getX() + x, tlOffset.getY() + y)
            br = brPoint(tl, scale, scale)
            if alternateFlag:
                rectangle(win, tl, br, colours[1])
            else:
                circlefromTL(win, tl, 10, colours[3])
            alternateFlag = not alternateFlag
