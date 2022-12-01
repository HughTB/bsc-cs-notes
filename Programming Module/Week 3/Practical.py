from graphics import *;
from random import randint;

def main():
    win = GraphWin("Hello Graphics", 800, 600)
    win.setBackground("black")
    
    elCircle = Circle(Point(400, 300), 200)
    elCircle.draw(win)
    elCircle.setOutline("white")
    elCircle.setFill("white")

    win.getMouse()

main()