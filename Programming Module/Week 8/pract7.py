from graphics import *
import math
import time
import random
import pract6
import pract5

def getName():
    name = input("Enter your name: ")

    while not name.isalpha():
        print("Name is invalid, please try again")
        name = input("Enter your name: ")

    return name

def trafficLights():
    win = GraphWin("Traffic Lights", 100, 300)

    redLight = Circle(Point(50, 50), 50)
    redLight.setFill("red")
    amberLight = Circle(Point(50, 150), 50)
    amberLight.setFill("black")
    greenLight = Circle(Point(50, 250), 50)
    greenLight.setFill("black")

    redLight.draw(win)
    amberLight.draw(win)
    greenLight.draw(win)

    while True:
        time.sleep(5)
        amberLight.setFill("yellow")
        time.sleep(2)
        redLight.setFill("black")
        amberLight.setFill("black")
        greenLight.setFill("green")
        time.sleep(10)
        greenLight.setFill("black")
        amberLight.setFill("yellow")
        time.sleep(2)
        amberLight.setFill("black")
        redLight.setFill("red")

def gradeCoursework():
    marks = int(input("Enter the number of marks: "))

    while not -1 < marks < 21:
        print("Invalid marks")
        marks = int(input("Enter the number of marks: "))

    print(f"The pupil scored {marks} and achieved a grade of {pract6.calculateGrade(marks)}")

def orderPrice():
    moreProducts = True
    totalPrice = 0.0

    while moreProducts:
        price = float(input("Enter the unit price of the product: "))
        quantity = int(input("Enter the quantity: "))
        totalPrice += price * quantity
        moreProducts = input("Are there more products? (y/n): ").lower() == "y"

    print("The total price of the order is £{:.2f}".format(totalPrice))

def clickableEye():
    win = GraphWin("Clickable Eye", 300, 300)
    
    message = Text(Point(150, 275), "")
    message.draw(win)

    pract5.drawBrownEye(win, Point(150, 150), 100)

    running = True
    
    while running:
        distance = pract5.distanceBetweenPoints(Point(150, 150), win.getMouse())

        if (distance <= 25):
            message.setText("Pupil")
        elif (distance <= 50):
            message.setText("Iris")
        elif (distance <= 100):
            message.setText("Sclera (White)")
        else:
            running = False

def fahrenheit2Celsius(temp):
    return (temp - 32) * 5/9

def celsius2Fahrenheit(temp):
    return (temp * 9/5) + 32

def tempMenu():
    print("1. Fahrenheit to Celsius")
    print("2. Celsius to Fahrenheit")
    print("3. Exit")
    return input("> ")
    
def temperatureConverter():
    running = True

    while running:
        choice = tempMenu()

        if choice == "1":
            temp = float(input("Enter the temperature in Fahrenheit: "))
            print("{:.2f}".format(fahrenheit2Celsius(temp)))
        elif choice == "2":
            temp = float(input("Enter the temperature in Celsius: "))
            print("{:.2f}".format(celsius2Fahrenheit(temp)))
        elif choice == "3":
            running = False
        else:
            print("Unknown option")

def guessTheNumber():
    guesses = 0
    guessed = False
    num = random.randint(0, 100)

    while not guessed and guesses < 7:
        guess = int(input("Enter your guess: "))

        if guess == num:
            guessed = True
        elif guess < num:
            print("Too low")
        elif guess > num:
            print("Too high")

        guesses += 1

    if guessed:
        print("You win! It took you {} guesses".format(guesses))
    else:
        print("You lose. The number was {}".format(num))

def tableTennisScorer():
    win = GraphWin("Tennis scorer", 400, 400)

    splitter = Line(Point(200, 0), Point(200, 400))
    splitter.draw(win)

    p1Score = 0
    p2Score = 0

    p1ScoreText = Text(Point(100, 200), "0")
    p2ScoreText = Text(Point(300, 200), "0")
    p1ScoreText.draw(win)
    p2ScoreText.draw(win)

    finished = False

    while not finished:
        clickPoint = win.getMouse()

        if clickPoint.x <= 200:
            p1Score += 1
        elif clickPoint.x > 200:
            p2Score += 1

        p1ScoreText.setText(p1Score)
        p2ScoreText.setText(p2Score)

        if p1Score >= 11 and p1Score - p2Score >= 2:
            finished = True
            Text(Point(100, 250), "Winner").draw(win)
        elif p2Score >= 11 and p2Score - p1Score >= 2:
            finished = True
            Text(Point(300, 250), "Winner").draw(win)

    win.getMouse()

def clickableBoxOfEyes(rows, columns):
    width = 100 + 100 * columns
    height = 100 + 100 * rows

    win = GraphWin("Box of eyes", width, height)
    Rectangle(Point(50, 50), Point(width - 50, height - 50)).draw(win)
    label = Text(Point(width / 2, height - 25), "")
    label.draw(win)

    for j in range(0, rows):
        for i in range(0, columns):
            pract6.drawColouredEye(win, Point(100 + i * 100, 100 + j * 100), 50, "deep sky blue")

    finished = False

    while not finished:
        clickPoint = win.getMouse()

        if clickPoint.getX() < 50 or clickPoint.getX() > width - 50 or clickPoint.getY() < 50 or clickPoint.getY() > height - 50:
            finished = True
        else:
            insideEye = False
            row = 0
            column = 0

            for j in range(0, rows):
                for i in range(0, columns):
                    centre = Point(100 + 100 * i, 100 + 100 * j)
                    dist = pract5.distanceBetweenPoints(centre, clickPoint)

                    if dist < 50:
                        insideEye = True
                        row = j + 1
                        column = i + 1

            if insideEye:
                label.setText(f"Eye at row {row}, column {column}")
            else:
                label.setText("Between eyes")

def findTheCircle():
    win = GraphWin("Find the circle", 200, 200)

    radius = 30
    points = 0
    lost = False

    while not lost:
        centre = Point(random.randint(0, 200), random.randint(0, 200))
        circle = Circle(centre, radius)

        hint = Text(Point(100, 175), "")
        hint.draw(win)
        clickPoint = win.getMouse()
        previousDistance = -1
        found = False
        attemptsRemaining = 10

        while not found and attemptsRemaining > 0:
            distance = pract6.distanceBetweenPoints(centre, clickPoint)

            if distance <= radius:
                print("won")
                points += attemptsRemaining
                break

            if previousDistance > -1 and distance - previousDistance < 0:
                hint.setText("Getting closer!")
            elif previousDistance > -1 and distance - previousDistance > 0:
                hint.setText("Getting further away!")
            
            previousDistance = distance
            clickPoint = win.getMouse()

        if attemptsRemaining == 0:
            lost = True
        else:
            circle.draw(win)
            hint.setText(f"Well done, you scored \n{attemptsRemaining} points")
            radius *= 0.9
            print(points)

findTheCircle()