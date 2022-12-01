from graphics import *



def brPoint(tlPoint, width, height):
    x = tlPoint.getX() + width
    y = tlPoint.getY() + height
    brPoint = Point(x, y)
    return brPoint


def centrePoint(tlPoint, radius):
    x = tlPoint.getX() + radius
    y = tlPoint.getY() + radius
    centre = Point(x, y)
    return centre



def text(win, tlPoint, text, colour):
    p = centrePoint(tlPoint,5)
    t = Text(p, text)
    t.setOutline(colour)
    t.draw(win)
    return t


def circlefromTL(win, tlPoint, radius, colour):
    centre = centrePoint(tlPoint, radius)
    circle(win, centre, radius, colour)


def circle(win, centre, radius, colour):
    c = Circle(centre, radius)
    c.setFill(colour)
    c.draw(win)
    return c


def rectangle(win, tlPoint, brPoint, colour):
    r = Rectangle(tlPoint, brPoint)
    r.setFill(colour)
    r.draw(win)
    return r


def line(win, point1, point2, colour):
    l = Line(point1, point2)
    l.setOutline(colour)
    l.draw(win)
    return l


