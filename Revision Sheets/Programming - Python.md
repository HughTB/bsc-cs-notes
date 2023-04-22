# Programming Reference Sheet - Python

## Variables

- Python is weakly typed, so any variable can store any type of data
- To define a variable, you can use the following code:
  - ```python
    i = 10
    ```
  - ```python
    variable_name = value
    ```

## Printing & String Formatting

- The `print()` function outputs the string provided to it to the command line
  - ```python
    print("Hello")
    ```
    - This would display the text "Hello" in the command line
- You can also give the function a non-text value, such as an integer
  - ```python
    i = 10
    j = 3

    print(i)
    print(j)
    print(i + j)
    ```
    - This would print out the following values: `10`, `3` and `13`
- You can also format strings in two different ways. Said formatted strings can either be used directly in a `print` statement, or stored into a variable
  - ```python
    i = 10
    j = 3

    print(i)
    print(j)

    print(i + j)

    print(f"{i} + {j} = {i + j}")
    print("{} + {} = {}".format(i, j, i + j))
    ```
    - This example would give the following output
  - ```
    10
    3
    13
    10 + 3 = 13
    10 + 3 = 13
    ```
  - As you can see, the two methods of string formatting function in a very similar way, but personally I find the `f""` method to be more clear as you can easily see which variable goes where in the string

## Loops

- There are two types of loops in Python, being `while` and `for` loops
- A while loop runs until a boolean condition is false
  - ```python
    i = 0

    while i < 10:
      print(i)
      i += 1
    ```
    - This will output the numbers from 0-9, as it prints out the value of i, and then increments it
- Alternatively, we can use a for loop which runs with every value in a list provided to it
  - We can provide a list of values either by directly giving it a list, as in the first example, or by using the `range(n, m)` function, which generates a list of values between n and m
  - ```python
    numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

    for i in numbers:
      print(i)
    ```
    - This gives the same output as the while loop example
  - ```python
    for i in range(0, 9):
      print(i)
    ```
    - This also gives the same output, but without manually defining the list, or having to increment the value

## If and Else

- If and Else allow code to run conditionally
- Code within an if statement will only run if the value is true
  - ```python
    i = 3

    if i < 5:
      print("less than 5")
    else:
      print("more than 5")
    ```
    - This will output "less than 5"
- Code within an else statement will only run if the value is false
  - ```python
    i = 10

    if i < 5:
      print("less than 5")
    else:
      print("more than 5")
    ```
    - This will output "more than 5"

## Functions

- Functions allow you to reuse code in different places without having to rewrite the code every time
- This is useful if you need to do the same thing many times with different values
- Functions can return a value, but they do not have to
- Functions can take inputs, but they do not have to
- This example takes inputs, and returns a value that is calculated
  - ```python
    def calculateHypotenuse(sideALength, sideBLength):
      aSquared = pow(sideALength, 2)
      bSquared = pow(sideBLength, 2)

      cSquared = aSquared + bSquared
      c = sqrt(cSquared)

      return c
    ```
    - If the inputs were `3` and `4`, the function would return the value `5`
- Specifically with functions, you can use "type hints" to prevent invalid values being passed into the function. I would highly recommend you use this where possible, as it reduces the likely hood of bugs
  - ```python
    def calculateHypotenuse(sideALength: int, sideBLength: int):
      aSquared = pow(sideALength, 2)
      bSquared = pow(sideBLength, 2)

      cSquared = aSquared + bSquared
      c = sqrt(cSquared)

      return c
    ```
    - This function works in exactly the same way as before, but now it will only accept integer values

### Built-in Functions

- There are many built in functions which aid you in creating programs without having to do everything manually
- `range(start, end)`
  - This takes two values, and returns an array of values which starts at `start` and ends at `end - 1`
  - If only one value is provided, the array starts at `0` and ends at the specified value - 1
  - e.g. `range(1, 5)` returns `[1, 2, 3, 4]`<br>
    `range(5)` returns `[0, 1, 2, 3, 4]`
- `pow(value, power)`
  - This returns `value` to the power of `power`
  - e.g. `pow(2, 3)` returns `8`
- `sqrt(value)`
  - This returns the square root of `value`
  - e.g. `sqrt(16)` returns `4`