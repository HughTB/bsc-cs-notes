import random;

def getInputs():
    flips = -1
    userInput = input("How many flips should be simulated: ")
    
    if userInput.isnumeric():
        flips = int(userInput)

    while flips < 1:
        print("Invalid number of flips, must be an integer greater than 0")

        userInput = input("How many flips should be simulated: ")
    
        if userInput.isnumeric():
            flips = int(userInput)

    return flips

def simulateFlips(numOfFlips):
    heads = 0
    tails = 0

    for i in range(0, numOfFlips):
        result = random.randint(0, 1)

        if result == 1:
            heads += 1
        elif result == 0:
            tails += 1

    return heads, tails

def displayResults(heads, tails, numOfFlips):
    print("Heads {:.2f}, Tails {:.2f}".format(heads / numOfFlips, tails / numOfFlips))

def main():
    numOfFlips = getInputs()

    heads, tails = simulateFlips(numOfFlips)

    displayResults(heads, tails, numOfFlips)

main()