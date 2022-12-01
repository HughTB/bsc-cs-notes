import math;

def pizzaEating():
    baseRadius = int(input("Enter the overall radius of the pizza in cm: "))
    maxCalories = int(input("Enter the maximum calories of pizza we should eat in a month: "))

    toppingsRadius = baseRadius - 4
    print(f"The radius of the topping region is {toppingsRadius}cm")
    toppingsArea = math.pi * (toppingsRadius**2)
    print("The area of the topping region is {:.2f}cm^2".format(toppingsArea))

    baseArea = math.pi * (baseRadius**2)

    baseCalories = baseArea * 0.9
    toppingsCalories = toppingsArea * 2.7
    totalCalories = int(baseCalories + toppingsCalories)
    print(f"The number of calories in the pizza is {totalCalories}")

    maximumPizzas = int(maxCalories // totalCalories)
    print(f"The maximum number of complete pizzas of this size we should eat in a month is {maximumPizzas}")

pizzaEating()