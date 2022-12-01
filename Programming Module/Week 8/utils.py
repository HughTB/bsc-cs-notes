from graphics import *
import math


def pause(win):
    win.getMouse()




def circle(win,centre,radius,colour):
    c = Circle(centre,radius)
    c.setFill(colour)
    c.draw(win)
    return c


def rectangle(win, tlPoint, brPoint, colour):
    r = Rectangle(tlPoint,brPoint)
    r.setFill(colour)
    r.draw(win)
    return r



def line(win, point1, point2, colour):
    l = Line(point1,point2 )
    l.setOutline(colour)
    l.draw(win)
    return l



def text(win, point, text,colour):
    t = Text(point,text)
    t.setOutline(colour)
    t.draw(win)
    return t
