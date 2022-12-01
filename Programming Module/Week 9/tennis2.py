# tennis.py - top-down design

def getInputs():
    prWinPt = float(input("Prob. of winning a point: "))
    numSets = int(input("Sets to simulate: "))
    return prWinPt, numSets


def simulateNGames(prWinPt, numGames):
    wins = 0
    for game in range(numGames):
        pointsPl, pointsOp = simulateGame(prWinPt)
        if pointsPl > pointsOp:
            wins = wins + 1
    return wins


def simulateGame(prWinPt):
    from random import random
    pointsPl, pointsOp = 0, 0
    while not gameOver(pointsPl, pointsOp):
        if random() < prWinPt:
            pointsPl = pointsPl + 1
        else:
            pointsOp = pointsOp + 1
    return pointsPl, pointsOp


def gameOver(pointsPl, pointsOp):
    return (pointsPl >= 4 or pointsOp >= 4) and  \
              abs(pointsPl - pointsOp) >= 2


def printSummary(sets, numSets):
    proportion = sets / numSets
    print("Sets:", sets, end="  ")
    print("Proportion: {0:0.2f}".format(proportion))

def simulateNSets(numSets, prWinPt):
    winsPl, winsOp = 0, 0

    for i in range(0, numSets):
        pass

def simulateSet(prWinPt):
    import random

    winsPl, winsOp = 0, 0

    while not setOver(winsPl, winsOp):
        pointsPl, pointsOp = simulateGame(prWinPt)

        if pointsPl > pointsOp:
            winsPl += 1
        else:
            winsOp += 1

def setOver(winsPl, winsOp):
    return (winsPl >= 6 or winsOp >= 6) and abs (winsPl - winsOp) >= 2

def main():
    prWinPt, numSets = getInputs()
    sets = simulateNGames(prWinPt, numSets)
    
    printSummary(sets, numSets)

main()
