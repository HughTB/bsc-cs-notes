import random;
import math;

def distanceBetweenPoints(x1, y1, x2, y2):
    xDist = x2 - x1
    yDist = y2 - y1

    distance = math.sqrt((xDist ** 2) + (yDist ** 2))
    return distance

def getInputs():
    numWalks = int(input("How many random walks to take? "))
    numSteps = int(input("How many steps for each walk? "))

    return numWalks, numSteps

def takeWalks(numWalks, numSteps):
    totalDistance = 0

    for walk in range(numWalks):
        stepsEast, stepsWest = takeAWalk(numSteps)

        totalDistance += distanceBetweenPoints(0, 0, stepsEast, stepsWest)

    return totalDistance / numWalks

def takeAWalk(numSteps):
    stepsEast = 0
    stepsNorth = 0

    for step in range(numSteps):
        rand = random.random()

        if rand < 0.25:
            stepsNorth += 1
        elif rand < 0.5:
            stepsEast += 1
        elif rand < 0.75:
            stepsNorth -= 1
        else:
            stepsEast -= 1

    
    return abs(stepsEast), abs(stepsNorth)

def printExpectedDistance(averageSteps):
    print("The expected number of steps away from the start point is {:.2f} steps".format(averageSteps))

def main():
    numWalks, numSteps = getInputs()

    averageSteps = takeWalks(numWalks, numSteps)

    printExpectedDistance(averageSteps)

main()