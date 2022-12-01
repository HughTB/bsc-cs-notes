from wrapper import *


def patchB(win, colour, tlPoint):
    dimension = 100
    centre = centrePoint(tlPoint, 50)
    scale = 30
    r = rectangle(win,tlPoint,brPoint(tlPoint,dimension,dimension),colour)
    t = Text(centre,"")
    t.setSize(scale)
    t.setTextColor("white")
    t.draw(win)



def patchF(win, colour, tlPoint):
    dimension = 100
    centre = centrePoint(tlPoint, 50)
    scale = 30
    r = rectangle(win, tlPoint, brPoint(tlPoint, dimension, dimension), colour)
    t = Text(centre,"P")
    t.setSize(scale)
    t.setTextColor("white")
    t.draw(win)


def patchP(win, colour, tlPoint):
    dimension = 100
    centre = centrePoint(tlPoint, 50)
    scale = 30
    r = rectangle(win,tlPoint,brPoint(tlPoint,dimension,dimension),colour)
    t = Text(centre,"F")
    t.setSize(scale)
    t.setTextColor("white")
    t.draw(win)