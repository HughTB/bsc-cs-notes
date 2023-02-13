# Arch & OS - Lecture 16:00 13/02/23

## Interconnections

### Interconnection Structure

- Similar to a network of basic modules, each of which performs a specific function
- There are paths which connect the modules
  - The structure of these paths depends upon what needs to be moved where
  - For example, the main memory is connected to the MAR, which can send the address that needs to be written to or read from
- Memory:
  - Read signal - When set to 1, the memory will output the contents of the address on the data-out lines
  - Write signal - When set to 1, the memory will overwrite the contents of the address with the values on the data-in lines
  - Address in - Specifies the address which will be read from or written to
  - data-in - Data being sent into memory
  - data-out - The data being read from the memory
- I/O Module:
  - Read signal
  - Write signal
  - Address in - Unlike memory, this refers to the "address" of the external device that is being interfaced with
  - Internal data-in - Data coming from elsewhere in the computer
  - Internal data-out - Data being sent elsewhere in the computer
  - External data-in - Data coming from the external device
  - External data-out - Data being sent to the external device
  - Interrupt signals - A signal sent to the CPU to tell it to interrupt the Fetch-Execute cycle to deal with something else
- CPU:
  - Instructions
  - Interrupt signals - Interrupt signals received from the I/O Controller
  - Address out - Address that needs to be read or written to
  - Control signals
  - data-in - Data received from elsewhere in the computer
  - data-out - Data sent elsewhere in the computer
- Types of transfers:
  - Memory to Processor - The processor reads an instruction or piece of data from memory
  - Processor to Memory - The processor writes a piece of data to memory
  - I/O to Processor - The processor reads data from an external device using an I/O module
  - Processor to I/O - The processor sends data to an external device using an I/O module
  - I/O to or from Memory - Data can be sent directly to or read directly from the memory

### Types of Interconnection

- Bus interconnection
  - One line that connects two or more devices
  - Shared transmission medium
  - Multiple devices are connected to the bus, and any signal transmitted on the bus can be read by any device on the bus
  - Only one device can transmit on the bus at the same time, otherwise, the data would become corrupted
  - A bus usually consists of multiple connections (lines), each of which transmits signals representing either a 1 or 0, so 8 lines would be needed to transmit a byte of data
  - One example is the System Bus, which connects the CPU, I/O Controller(s) and Main Memory
    - The system bus is constituted of 3 groups of lines
    - Data Lines - used to send or receive data
    - Address Lines - used to set the address being read from or written to
    - Control Lines - used to set whether memory is being read from or written to, as well as interrupts, etc
  - Bus width - the number of lines used in the bus, and therefore the size of data that can be transmitted
    - This is one of the factors affecting the performance of a computer (if the data bus is not wide enough you may have to transmit in multiple sections, which is much slower)
    - The width of the address bus determines the maximum memory capacity of the computer, as there would not be enough addresses for additional words of memory
    - The control lines usually have one line for each control signal that needs to be sent, e.g one for read/write, one for a timing signal, one for interrupts, etc
  - Bus order of operations:
    - If one module needs to send data to another
      1. Obtain use of the bus
      2. Transfer data via the bus
    - If one module needs to obtain data from another
      1. Obtain use of the bus
      2. Send a request to the other module over the bus (which will then send the data back as another transmission)
- Point-to-Point interconnection
  - Modern systems often use point-to-point interconnections
  - Solves problems with bus interconnections, such as only one device being able to communicate at a time
  - Lower latency, higher speed and better scalability than a bus interconnection
  - QuickPath Interconnect (QPI)
    - Multiple direct connections between modules
    - Layered protocol architecture
    - "Packetised" data transfer (Data is sent as packets rather than using multiple lines in parallel)