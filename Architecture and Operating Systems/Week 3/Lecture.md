# Architecture and Operating Systems - Lecture 16:00 10/10/22

### Binary / Digital Gates

- NOT gate
 - Inverts the signal (1 becomes 0 and 0 becomes 1)
 - You can get the 1's compliment of a number by just passing each bit through a NOT gate
  
|A|¬A|
|-|--|
|0| 1|
|1| 0|
  
- AND gate
 - The output is only 1 if both of the inputs are 1
 - The output is similar to that of A*B, but not quite the same
 - An AND gate can have 2 or more inputs
  
2 Inputs:
|A|B|A.B|
|-|-|---|
|0|0| 0 |
|1|0| 0 |
|0|1| 0 |
|1|1| 1 |
  
3 Inputs:
|A|B|C|A.B.C|
|-|-|-|-----|
|0|0|0|  0  |
|1|0|0|  0  |
|0|1|0|  0  |
|0|0|1|  0  |
|1|1|0|  0  |
|1|0|1|  0  |
|0|1|1|  0  |
|0|0|0|  1  |
  
- OR gate
 - The output is 1 if either of the inputs are 1
 - An OR gate can have 2 or more inputs
  
|A|B|A+B|
|-|-|---|
|0|0| 0 |
|1|0| 1 |
|0|1| 1 |
|1|1| 1 |
  
- NAND gate
 - The output is the inverse of an AND gate
 - A NAND gate is a universal gate, meaning that any boolean function can be implemented using exclusively NAND gates
  
|A|B|¬(A.B)|
|-|-|----|
|0|0|  1 |
|1|0|  1 |
|0|1|  1 |
|1|1|  0 |
  
- NOR gate
 - The output is the inverse of an OR gate
 - A NOR gate is also a universal gate
  
|A|B|¬(A+B)|
|-|-|----|
|0|0|  1 |
|1|0|  0 |
|0|1|  0 |
|1|1|  0 |
  
- XOR gate
 - Also known as an "exclusive or" gate
 - The output is 1 when exactly one of the inputs is 1
 - XOR gates are very important as A⊕B is the same as (A.¬B)+(¬A.B), which would need five logic gates (two NOT gates, two AND gates, and an OR gate) rather than a single XOR gate
 - XOR gates are needed for binary addition, as they can add two binary numbers together, and then in combination with an AND gate you can get the carry bit
  
|A|B|A⊕B|
|-|-|---|
|0|0| 0 |
|1|0| 1 |
|0|1| 1 |
|1|1| 0 |
  
- XNOR gate
 - The inverse of an XOR gate
  
|A|B|¬(A⊕B)|
|-|-|---|
|0|0| 1 |
|1|0| 0 |
|0|1| 0 |
|1|1| 1 |
  
### Questions

1) A = 0, B = 1, C = 1, X = ?  
X = ¬(A+(B.C)) = 0
  
2) A = 0, B = ?, X = 0  
X = ¬(¬A.B) = 0  
B must be 1
  
3) Translate ¬((A.B) + C)