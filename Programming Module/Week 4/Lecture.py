from graphics import *;
import random;
import math;

def passwordChecker():
    secretWord = "DanteAlighieri"
    character = random.randint(0, len(secretWord))
    correctChar = secretWord[character]

    print(f"Please enter the character at position {character + 1}")
    enteredChar = input("> ")

    if correctChar == enteredChar:
        print("Correct!")
    else:
        print("Incorrect!")

def formatting():
    print("Pi is {:.4f} to 4 decimal places, and e is {:.6f} to 6 decimal places".format(math.pi, math.e))

def graphical():
    win = GraphWin("Graphical", 800, 600)
    sentence = "what the dog doin"
    size = len(sentence)
    offset = 10

    for i in range(size):
        x = offset + i * 15
        y = offset + i * 15
        point = Point(x, y)

        text = Text(point, sentence[i])
        text.draw(win)

    win.getMouse()

graphical()