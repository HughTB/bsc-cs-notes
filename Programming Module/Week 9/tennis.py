# tennis.py - top-down design


def main():
    prWinPt, numGames = getInputs()
    wins = simulateNGames(prWinPt, numGames)
    printSummary(wins, numGames)


def getInputs():
    prWinPt = float(input("Prob. of winning a point: "))
    numGames = int(input("Games to simulate: "))
    return prWinPt, numGames


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


def printSummary(wins, numGames):
    proportion = wins / numGames
    print("Wins:", wins, end="  ")
    print("Proportion: {0:0.2f}".format(proportion))


main()
