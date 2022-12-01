from graphics import *;

def drawCircles():
    win = GraphWin("Circles", 600, 600)
    win.setBackground("white")

    for i in range(0, 15):
        fillCol = "white"
        outlineCol = "white"

        centre = win.getMouse()

        if centre.x < 300 and centre.y < 300: #Top left
            outlineCol = "blue"
        if centre.x > 300 and centre.y < 300: #Top Right
            fillCol = "blue"
        if centre.x < 300 and centre.y > 300: #Bottom left
            outlineCol = "pink"
        if centre.x > 300 and centre.y > 300: #Bottom right
            fillCol = "pink"

        circle = Circle(centre, 30)
        circle.setFill(fillCol)
        circle.setOutline(outlineCol)
        circle.draw(win)

    win.getMouse()
    win.close()

def drawCircles2():
    win = GraphWin("Circles 2", 600, 600)
    win.setBackground("white")

    for i in range(0, 3):
        for j in range(0, 10):
            fillCol = "white"
            outlineCol = "white"

            clickPoint = win.getMouse()

            if clickPoint.x < 300 and clickPoint.y < 300: #Top left
                outlineCol = "blue"
            if clickPoint.x > 300 and clickPoint.y < 300: #Top Right
                fillCol = "blue"
            if clickPoint.x < 300 and clickPoint.y > 300: #Bottom left
                outlineCol = "pink"
            if clickPoint.x > 300 and clickPoint.y > 300: #Bottom right
                fillCol = "pink"

            circle = Circle(Point(30 + j * 60, 450 + i * 60), 30)
            circle.setFill(fillCol)
            circle.setOutline(outlineCol)
            circle.draw(win)

    win.getMouse()
    win.close()

drawCircles()
drawCircles2()