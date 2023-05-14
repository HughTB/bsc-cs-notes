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
  - An instruction word is made up of two 20-bit instructions, the left and right instructions. Each instruction is made up of an 8-bit opcode and a 12-bit operand/address
- Since each instruction word is made up of a left and right instruction, IAS computers have an additional register known as the Instruction Buffer Register or IBR
  - The instruction buffer register stores the right instruction of an instruction word so that both instructions can be executed without having to load the entire word from memory twice

## Interconnections

- Each component of a computer is connected to other parts via interconnections
- These interconnections can take different forms, anywhere from a single line carrying a serial signal up to huge multi-line parallel connections
- The configuration of each interconnection depends upon the components which are connected

### Types of Interconnection

- Bus interconnection
  - One line or set of lines which connect two or more devices
  - All devices use a shared transmission medium
  - Any signal sent on the bus can be read by any device on the bus
  - If multiple devices attempt to communicate on the bus at a time, the transmission would become corrupted
  - The bus width determines how much data can be transmitted at a time
    - This can be a limiting factor in the performance of a computer, for example, if a bus is not wide enough and larger chunks of data have to be split up and transmitted one at a time
    - The width of the address bus determines the maximum memory which can be used by the computer at once, as there are a limited number of addresses in which data can be stored
  - Order of operations
    - If one module needs to send data to another:
      1. Obtain use of the bus (Check that another module is not using the bus)
      2. Transfer data via the bus
    - If one module needs to obtain data from another:
      1. Obtain use of the bus
      2. Send a request to the other module over the bus
- Point-to-Point interconnection
  - Modern systems tend to use p2p interconnections more than bus interconnections
  - Solves some of the larger problems with a bus interconnection, such as multiple modules being able to transmit at a time
  - Lower latency, higher speed and better scalability than a bus interconnection
  - Modern Intel systems often use QuickPath Interconnect (QPI)
    - Multiple direct connections between modules
    - Layered protocol architecture
    - Data is sent as a series of packets rather than using multiples lines in parallel

### Interconnection Structure

- Each of the following components has a typical set of interconnections
  - CPU
    - Address out signal - Addresses sent to the memory and I/O module(s) which determine where to read from or write to
    - Data-in signal - Data received from elsewhere in the computer
    - Data-out signal - Data sent elsewhere in the computer
    - Control signals - Signals which control the execution flow of the processor
    - Interrupt signals - Interrupts sent from the I/O module
  - Memory
    - Read/Write signal - Determines whether the memory address is written to or read from when a data transfer takes place
    - Address in signal - Specifies which address in memory should be read from or written to
    - Data-in signal - Data sent into the memory to be written
    - Data-out signal - Data read from the memory and sent to other components
  - I/O Module(s)
    - Read/Write signal - Determines whether data is written to or read from the I/O port specified
    - Address in signal - Determines which I/O port should be read from or written to. Similar to the address in signal in memory, but relates to physical ports rather than locations in memory
    - Internal data-in signal - Data sent from elsewhere in the computer
    - Internal data-out signal - Data sent from the I/O port to elsewhere in the computer
    - External data-in signal - Data sent from the external device to the computer
    - External data-out signal - Data sent from the computer to the external device
    - Interrupt signals - A signal sent directly to the CPU telling it to pause execution and respond to the interrupt