from cgitb import text
from graphics import *;
import random;
import os;

def personalGreeting():
    name = input("Enter your name: ")
    print(f"Hello {name}, nice to see you!")

def formalName():
    forename = input("Enter your forename: ")
    surname = input("Enter your surname: ")
    print(f"{forename[0]}. {surname}")

def kilos2pounds():
    kilos = float(input("Enter a weight in kilograms: "))
    pounds = 2.2 * kilos
    print("{:.2f} kilos is equal to {:.2f} pounds".format(kilos, pounds))

def generateEmail():
    forename = input("Enter forename: ")
    surname = input("Enter surname: ")
    yearStarted = input("Enter the starting year: ")

    email = f"{surname[0:4]}.{forename[0]}.{yearStarted[2:4]}@myport.ac.uk"
    print(email)

def gradeTest():
    grades = "FFFFCCBBAAA"
    marks = int(input("Enter the number of marks scored: "))

    print(grades[marks])

def graphicLetters():
    word = input("Enter a word: ")
    win = GraphWin("Graphic Letters", 800, 600)

    for i in range(0, len(word)):
        pos = win.getMouse()
        text = Text(pos, word[i])
        text.setSize(25)
        text.draw(win)

def singASong():
    word = input("Enter a word to sing: ")
    lines = int(input("Enter how many lines there should be: "))
    columns = int(input("Enter how many times the word should be repeated on each line: "))

    for i in range(0, lines):
        line = ""
        
        for j in range(0, columns):
            line = line + word + " "

        print(line)

def exchangeTable():
    exchangeRate = 1.17

    print("{:>7}|{:>7}".format("Euros", "Pounds"))
    print("-------|-------")
    for euros in range(0, 21):
        pounds = euros / exchangeRate
        print("{:>7.2f}|{:>7.2f}".format(euros, pounds))

def makeInitialism():
    phrase = input("Enter a phrase: ")
    words = phrase.split(" ")
    
    initialism = ""

    for i in range(0, len(words)):
        initialism += words[i][0]

    print(initialism)

def nameToNumber():
    name = input("Enter your name: ").upper()
    total = 0

    for char in name:
        total += ord(char) - 64

    print(f"Your name has the value {total}")

def fileInCaps():
    filename = input("Enter the filename: ")
    file = open(filename, "r")
    text = file.read()
    print(text.upper())

def rainfallChart():
    file = open("rainfall.txt", "r")
    lines = file.readlines()

    for line in lines:
        city = line.split(" ")[0]
        rainfall = int(line.split(" ")[1])

        print("{:12} {:}".format(city, '*' * rainfall))

def sortFunc(line):
    return int(line.split(" ")[1])

def graphicalRainfallChart():
    file = open("rainfall.txt", "r")
    lines = file.readlines()
    lines.sort(reverse=True, key=sortFunc)

    colours = ["red", "green", "blue", "pink", "purple", "cyan", "magenta", "orange", "yellow"]

    win = GraphWin("Graphical rainfall", 800, 600)

    for i in range(0, len(lines)):
        city = lines[i].split(" ")[0]
        rainfall = int(lines[i].split(" ")[1])

        label = Text(Point(100, 20 + 30 * i), city)
        label.draw(win)
        bar = Rectangle(Point(200, 10 + 30 * i), Point(200 + 10 * rainfall, 30 + 30 * i))
        bar.setFill(colours[random.randint(0, len(colours) - 1)])
        bar.draw(win)

    win.getMouse()

def rainfallInInches():
    file = open("rainfall.txt", "r")
    lines = file.readlines()

    for line in lines:
        city = line.split(" ")[0]
        rainfall = int(line.split(" ")[1])
        rainInInches = rainfall / 25.4

        print("{:12} {:<.2f}".format(city, rainInInches))

def wc():
    filename = input("Enter the name of the file: ")
    file = open(filename, "r")
    contents = file.read()

    characters = len(contents)
    words = len(contents.split(" "))
    lines = len(contents.split("\n"))

    print(f"In the file {filename}, there are:")
    print(f"{characters} characters,")
    print(f"{words} words and")
    print(f"{lines} lines")

graphicalRainfallChart()