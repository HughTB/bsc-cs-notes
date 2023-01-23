# Arch & OS - Lecture 16:00 23/01/23

## Computer Structure and Function

- Computer Architecture
  - The attributes of a design which affect the way that programs will be executed, e.g. the instruction set (x86, ARM, etc)
- Computer Organisation
  - The physical layout of the CPU and the way that the components are interconnected, e.g. an Intel CPU vs an AMD CPU

- Computer Functions (The way the individual components operate):
  - Data Processing
  - Data Storage
    - Short-term memory (RAM)
    - Long-term memory (HDD or SSD)
  - Data Movement
    - Input / Output devices (IO)
      - Peripherals (Keyboard, Mouse, etc)
      - Data Communication (Networking, Monitor, Speakers, etc)
  - Control

- Computer Structure (The way the components are connected):
  - Central Processing Unit (CPU)
    - Control Unit (CU)
      - The "heart" of the CPU, controls what the ALU and registers do
      - Sequencing logic
      - Control Unit registers and decoders
      - Control Memory
    - Arithmetic and Logic Unit (ALU)
      - Contains the Adder / Subtractor circuits
    - Registers
      - Very small but very fast memory that stores a small amount of data that is an input or output of the ALU
    - CPU Interconnections
      - This connects the ALU and Registers to the CU
  - Main Memory (RAM)
  - I/O Controller(s)
  - System Interconnection (Buses)
    - This connects the Main Memory and I/O Controller(s) to the CPU

- First Generation computers
  - ENIAC (Electronic Numerical Integrator And Computer)
  - Developed in World War II
  - The size of a large room, roughly 30 tons, 18000 Vacuum tubes
  - Used Analogue decimal rather than binary
  - Programmed manually by rewiring, commonly known as "hard programming"
- Second Generation computers
  - Von Neumann Machines
  - Using the stored-program concept
    - This means that the program and the data are stored in memory, and is programmed in the same way as a modern computer
  - IAS Computer (Institute of Advanced Study)
  - Binary
  - The CPU contained the ALU and the Control Unit, which is connected by a bus to the Main Memory and the I/O Equipment
  - This is the same architecture that is used in modern computers

- CPU Instructions
  - Each instruction contains:
    - An "Opcode"
      - A code that relates to the operation that should be performed (Defined by the instruction set of the CPU)
    - An Address
      - The location in memory that contains the data