# Architecture and Operating Systems - Lecture 16:00 03/10/22

### Signed binary

- Signed binary is similar to normal binary, but the MSB (most significant bit or the left-most bit) represents the sign of the number - 1 for negative and 0 for positive
- This is not how computers usually store negative binary numbers, but can be useful as it's easier for humans to understand
  
### One's Compliment

- To find the one's compliment of a binary number you just invert the binary digits, e.g. 10010100 becomes 01101011
- One's compliment is used when a computer needs to subtract numbers, as they only have hardware to do addition
 - They do this by adding the second number as a negative number, e.g. 5 - 3 becomes 5 + (-3)
- A number in stored in one's compliment is always negative if the MSB is 1
- To subtract a number, you add the one's compliment of the second number as below:

Say for example you want to do 110 - 001  
you would instead take the one's compliment of 001 and add that to 110:  
  
1's compliment of 001 = 110  
  
  110
 +110
 ----
  100 carry 1
  
You then add the carry back to the result of the original calculation:
  
  100
 +001
 ----
  101
  
This is the same as the result of 110 - 001:
  
  110
 -001
 ----
  101
  
### Two's compliment

- Two's compliment of a number is the one's compliment of the number + 1, e.g. 2's compliment of 001 is 110 + 001 = 111
- A number stored in two's compliment is always negative if the MSB is 1
- To convert back to decimal, the MSB represents the negative version of the number that column represents, e.g. 10000000 would be -128
  
Using the same example as above:
  
You want to do 110 - 001, you would take the two's compliment of 001 and add that to 110:
  
1's compliment of 001 is 110, then add 1 to get 2's compliment:

  110
 +001
 ----
  111
  
So now instead of doing 110 - 001, we can do 110 + 111:
  
  110
 +111
 ----
  101 carry 1
  
We then discard the carry to get the final result of 101, which is the same as if we just did 110 - 001
Remember that for both 1's and 2's compliment, the numbers we are adding or subtracting must always have the same number of bits, else it will not work

### Core exercises

Convert the following numbers to binary using the sign and magnitude method:
  
1a. -7  = 10000111
 b. -12 = 10001100
 c. -15 = 10001111
 d. -46 = 10101110
 e. -57 = 10111001
 f. -112 = 11110000
 g. -149 = 110010101
 h. -179 = 110110011
 i. -216 = 111011000
 j. -406 = 1110010110
 k. -1001 = 11111101001
 l. -1645 = 111001101101
  
Find the 1's compliment of the following:

2a. 01: 10
 b. 10: 01
 c. 111: 000
 d. 011: 100
 e. 100: 011
 f. 101: 010
 g. 0011: 1100
 h. 1001: 0110
 i. 10111: 01000
  
Find the 2's compliment of the following:

3a. 01: 11
 b. 10: 10
 c. 111: 001
 d. 011: 101
 e. 100: 100
 f. 101: 011
 g. 0011: 1101
 g. 1001: 0111
 i. 10111: 01001