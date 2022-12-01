# Lecture - Architecture and Operating Systems 16:00 14/11/22

### DeMorgan's Theorems

- Theorem 1 states that an OR gate can be converted into a NAND gate by inverting both inputs
    - Written out as A' + B' = (A.B)' or (A' + B')' = A.B
- Theorem 2 states that an AND gate can be converted into a NOR gate by inverting both inputs
    - Written our as A'.B' = (A + B)' or (A'.B')' = A + B
- Whenever you have an AND or OR gate surrounded by ( )', you should use DeMorgan's Theorems to convert to a different gate
- This also applies to other terms within a term, e.g.
    - (A.B + C)' = (A.B)'.C'
    - (A.B)'.C = (A' + B').C'
    - (A' + B').C = A'.C' + B'.C'

### Order of simplification
1. DeMorgan ( )'
2. Get rid of brackets using the distributive rule
3. Use any of the other laws
4. Use the distributive rule again
5. "Factorise" (Take out common factors)
