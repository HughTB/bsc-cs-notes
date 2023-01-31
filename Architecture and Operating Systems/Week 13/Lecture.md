# Arch & OS - Lecture 16:00 30/01/23

## IAS Computer

- Stored-Program concept
  - Main memory contains both data and instructions
- In an IAS Computer, the components have different names:
  - The Arithmetic Logic Unit is known as the CA
  - The Program Control Unit is known as the CC
  - Main memory is simply M
  - The I/O equipment is I and O
- Modern computers use 64-bit words, but IAS computers use 40-bit words
  - Each word can be either a Number word, with a sign bit and 39 bits for numbers, or an instruction word, which is split into a left and right instruction, each of which has an 8-bit opcode and 12-bit address
- 3 main concepts
  - Single read-write memory (used for both data and instructions)
  - Addressable memory
  - Execution occurs sequentially, unless explicitly modified

## Registers

- Memory Buffer Register (MBR)
  - The MBR temporarily stores an instruction or data from memory
- Memory Address Register (MAR)
  - The MAR stores the address from the MBR, and tells the Main Memory what address to fetch data from
- Instruction Register (IR)
  - The IR receives the instruction from the MBR so that it can be decoded
- Instruction Buffer Register (IBR)
  - A buffer for the IR, which can store one of the two opcodes included in an instruction word so that it can be executed without getting it from the memory again
- Program Counter (PC)
  - Stores the address in memory of the current instruction, and is incremented every time an instruction is executed
- Accumulator (AC) and Multiplier Quotient (MQ)
  - Stores the values that the ALU calculates

## Instruction Cycle

- Fetch Cycle
  - A cycle that fetches the instruction from memory into the MBR
- Execute Cycle
  - A cycle that decodes and then executes the instruction

## Hardwired Programming VS Software

- Hardwired programming
  - The computer has to be manually rewired to change the program
- Software
  - Instructions are fed through an interpreter, compiler, etc, to convert them into machine code which is then stored in the memory, where the computer will read, decode and execute the instructions
  - The program of a computer can be changed at any time (even when the computer is running) by entering the instructions into memory
  - Rather than being specifically designed for each program, a set of general purpose registers and arithmetic and logic units are used, which has the advantage of being reprogrammable, but the disadvantage of being potentially slower