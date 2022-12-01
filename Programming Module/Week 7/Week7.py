from graphics import *

# FUNCTIONS


def myCircle(win,centre,radius,colour):
    c = Circle(centre,radius)
    c.setFill(colour)
    c.draw(win)


def myRect(win, tlPoint, brPoint, colour):
    r = Rectangle(tlPoint,brPoint)
    r.setFill(colour)
    r.draw(win)

def myLine(win, tlPoint, brPoint, colour):
    l = Line(tlPoint, brPoint)
    l.setFill(colour)
    l.draw(win)
    
def myText(win, point, text):
    t = Text(point, text)
    t.draw(win)

def myPolygon(win, listOfPoints, colour):
    p = Polygon(listOfPoints)
    p.setFill(colour)
    p.draw(win)

def print10():
    print("-" * 10)


def menu():
    print10()
    print("-- MENU --")
    print10()
    print("Select an option")
    print("1 - circle")
    print("2 - rect")
    print("3 - line")
    print("4 - text")
    print("5 - polygon")
    print("6 - exit")
    print10()
    return int(input("please select an option: "))

# ENTRY POINT
def main():
    while True:
        selection = menu()
        if selection == 1:
            x = int(input("Please enter x position: "))
            y = int(input("Please enter y position: "))
            radius = int(input("Please enter the radius: "))
            colour = input("Please enter a colour: ")

            myCircle(win, Point(x, y), radius, colour)
        elif selection == 2:
            x1 = int(input("Please enter x1: "))
            y1 = int(input("Please enter y1: "))
            x2 = int(input("Please enter x2: "))
            y2 = int(input("Please enter y2: "))
            colour = input("Please enter a colour: ")

            myRect(win, Point(x1, y1), Point(x2, y2), colour)
        elif selection == 3:
            x1 = int(input("Please enter x1: "))
            y1 = int(input("Please enter y1: "))
            x2 = int(input("Please enter x2: "))
            y2 = int(input("Please enter y2: "))
            colour = input("Please enter a colour: ")

            myLine(win, Point(x1, y1), Point(x2, y2), colour)
        elif selection == 4:
            x = int(input("Please enter x position: "))
            y = int(input("Please enter y position: "))
            text = input("Please enter a message: ")

            myText(win, Point(x, y), text)
        elif selection == 5:
            finished = False
            points = []
            
            while not finished: 
                x = int(input("Please enter an x position: "))
                y = int(input("Please enter a y position: "))

                if x == -1 or y == -1:
                    finished = True
                else:
                    points.append(Point(x, y))
            
            colour = input("Please enter a colour: ")

            myPolygon(win, points, colour)
        elif selection == 6:
            win.close()
            return 0
        else:
            print("Invalid option")

# EXEC (ENTRY POINT)
win = GraphWin("Shapes", 800, 600)
main()