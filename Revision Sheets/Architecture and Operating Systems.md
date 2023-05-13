# Architecture and Operating Systems Revision Sheet

(Only includes content from Teaching Block 2, as this is what will likely come up on the test)

## Registers

- Registers are very small but very fast pieces of memory, which are typically used when the CPU exchanges information with the main memory
- The registers found in a typical CPU are the following
  - Program Counter (PC)
    - The program counter stores the address of the next instruction to be executed. It is incremented whenever an instruction is fetched, or when a jump instruction is used
  - Instruction Register (IR)
    - The instruction register stores the current instruction while it is decoded and executed
  - Memory Address Register (MAR)
    - The memory address register stores the address in memory which needs to be fetched, either to get the next instruction or to get the information needed for the current instruction if direct addressing is used
  - Memory Buffer Register (MBR)
    - The memory buffer register temporarily stores one chunk of data after it is retrieved from the main memory. This data can then be passed into the IR or other register
  - Accumulator (AC)
    - Stores temporary values for the ALU, either inputs or outputs
  - Multiplier Quotient (MQ)
    - Stores temporary values for the ALU, either inputs or outputs, typically only used when performing multiplication

## The Instruction Cycle

- Fetch Cycle
  - The next instruction is fetched from memory and stored in the MBR
  - The PC is incremented
  - The instruction in the MBR is copied to the IR and decoded
- Execute Cycle
  - The instruction currently in the IR is executed

## The Institute of Advanced Study (IAS) Computer

- The IAS computer is a Von Neumann architecture and uses the stored-program concept with one bank of read-write memory
- In an IAS computer, the components are largely the same but have different names
  - The ALU is known as the CA
  - The PCU is known as the CC
  - Main memory is simply M
  - The I/O interfaces are I and O
- Memory is arranged into 40-bit words
  - Each word can either be a number word or an instruction word
  - A number word is used to store a single number, with a sign bit in the MSB position and 39 bits for the integer value
  - An instruction word is made up of two 20-bit instructions, the left and right instruction. Each instruction is made up of an 8-bit opcode and a 12-bit operand/address
- Since each instruction word is made up of a left and right instruction, IAS computers have an additional register known as the Instruction Buffer Register or IBR
  - The instruction buffer register stores the right instruction of an instruction word so that both instructions can be executed without having to load the entire word from memory twice