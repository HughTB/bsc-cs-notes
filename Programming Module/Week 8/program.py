import utils
from graphics import *
from utils import *
import random


def main():

    win = GraphWin("Test", 400, 400)

    pause(win)

    for i in range(0, 4):
        for j in range(0, 4):
            tl = Point(100 * j, 100 * i)
            br = Point(tl.x + 100, tl.y + 100)

            colour = "blue"

            if j > 1:
                colour = "red"
            if i > 1:
                colour = "orange"
            if j > 1 and i > 1:
                colour = "purple"

            rectangle(win, tl, br, colour)
            
            pause(win)

def main2():
    
    win = GraphWin("Test", 400, 400)

    pause(win)

    squares = range(0, 16)

    for i in range(0, len(squares)):
        rand = random.randint(0, len(squares) - 1)
        x = rand % 4
        y = rand / 4

        tl = Point(100 * x, 100 * y)
        br = Point(tl.x + 100, tl.y + 100)

        colour = "blue"

        if x > 1:
            colour = "red"
        if y > 1:
            colour = "orange"
        if y > 1 and x > 1:
            colour = "purple"

        rectangle(win, tl, br, colour)
        
        pause(win)

#blue   red
#orange purple

# EXEC (ENTRY POINT)
main2()
