# Architecture and Operating Systems Revision Sheet

(Only includes content from Teaching Block 2, as this is what will likely come up on the test)

## Computer Structure and Function

- There are usually only 4 types of operation that a computer can perform
  - Data Processing
    - Performing mathematical or other operations on data stored in the computers memory
  - Data Storage
    - Short-Term storage (RAM, Registers)
    - Long-Term storage (HDD, SSD)
  - Data Movement
    - Input/Output (IO) Devices such as keyboards, mouses, network cards, etc
    - Moving data between long and short term storage
  - Control
- There are a few main components in a computer
  - CPU (Central Processing Unit)
    - Control Unit (CU)
      - The "heart" of the CPU and determines what the ALU and registers do
    - Arithmetic and Logic Unit (ALU)
      - Contains the Adder/Subtracter circuits
    - Registers
      - Very small but fast memory which store information as it is exchanged between components
  - Main Memory (RAM or ROM)
  - Secondary Memory (HDDs, SSDs, ODDs)
  - IO Controllers
  - System Interconnections

### Registers

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

### The Instruction Cycle

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

## Memory

### Key Characteristics

- Volatility
  - Volatile memory stores data only until it is disconnected from power, such as RAM
  - Non-volatile memory stores data even when power is lost, such as SSDs, HDDs or USB drives
- Location
  - Internal - Inside the computer and non-removable, e.g. registers, main memory (RAM), secondary memory (SSDs, HDDs)
  - External - Outside the computer and removable, e.g. ODDs, external HDDs or SSDs, USB drives
- Capacity
  - Number of words of memory
  - Number of bits per word
- Unit of Transfer (The smallest chunk of data which can be read at once)
  - Bits (Usually only main memory)
  - Bytes
  - Words (Often used for registers)
  - Blocks (Many words of data, sometimes used by secondary memory)
- Access Methods
  - Sequential Access - Has to read from the start of memory to the requested address, e.g. tape drives
  - Direct Access - Directly reads from the requested address, e.g. SSDs, HDDs, ODDs
  - Random Access - All locations in memory are available all the time, e.g. RAM, ROM, Cache
  - Associative Access - Returns addresses around the requested address in anticipation of future requests, e.g. Cache
- Performance
  - Access Time (Latency)
  - Cycle Time (Period)
  - Transfer Rate (Frequency)
- Physical Memory Type
  - Semiconductor, e.g. RAM, ROM, SSD
  - Magnetic, e.g. Floppy Disk, HDD
  - Optical, e.g. DVD, CD, Bluray
  - Magneto-Optical
- Rewritability
  - Erasable - Can be erased and rewritten to, e.g. HDD, SSD, RAM
  - Non-erasable, e.g. CD-R, ROM

### Hierarchy

- Going down the hierarchy, the cost per bit and speed decrease, but the capacity increases
- In-board Memory
  - Registers
  - Cache
  - Main Memory (RAM)
- Out-board Memory
  - HDDs/SSDs
  - Magnetic Disks (Floppies)
  - Optical Disks (CDs, DVDs)
- Offline Storage
  - Magnetic Tape

### Cache

- There are usually 3 layers of cache, which sit in between the Registers and Main Memory
- They serve to speed up memory access by caching either frequently accessed data, or data that may need to be accessed soon, such as the next few instructions of a program
- The hierarchy is as follows: Registers → L1 Cache → L2 Cache → L3 Cache → Main Memory

## Operating Systems

- An Operating System is a program in and of itself, and is usually one of the first programs to run anytime you turn a computer on
- They typically sit between user programs and hardware, providing an environment for other programs to run inside of
- They are responsible for starting and stopping programs, as well as managing memory and CPU time shared between them
- Additionally, they provide interfaces to IO devices and file storage, to improve the ability of programs to run on more than one make or model of computer

### Interfaces

- Graphical User Interface (GUI) is typically what we think of as being the operating system, and is seen in all modern desktop and mobile OSes
- Command Line Interface (CLI) is still used today, usually for more administrative tasks, or where it would be infeasible or impractical to use a GUI

### The Kernel

- The kernel is the heart of the operating system, and is the code responsible for allocating resources to programs
- It usually has it's own space in memory which other programs cannot access, so that it is harder to tamper with either on purpose or accidentally, if a program is poorly written
- There are 3 separate parts of a computers memory, each of which can only be accessed by the programs running in them
  - User Space, which is where any user applications run
  - OS Space, which is reserved for processes required by the operating system
  - Kernel Space, which is part of OS space, and reserved only for applications which require direct access to the hardware, such as device drivers

### Monolithic vs Micro Kernels

- Monolithic Kernel
  - User services and kernel services run in the same address space
  - Much lower access time and faster code execution
  - Harder to maintain and extend
  - Higher general system performance
  - Used by Linux and other Unix-like operating systems
- Microkernel
  - User services and kernel services are in separate address spaces
  - Much smaller in memory footprint
  - Higher access time and slower execution
  - Easier to maintain and extend
  - Lower general system performance
  - Windows uses a hybrid of Monolithic and Microkernels, depending upon the version and CPU architecture

### Types of Operating System

- Batch
  - The first type of operating system developed
  - Data and commands to execute on the data are submitted in the form of a job, and there is little or no interaction once the job has started
  - Used in systems such as payroll processing and bank mainframes
- Interactive
  - The most common type of operating system on desktop and mobile devices
  - User input can be received from keyboards, mouses and other devices while the program is running
  - There are both single-user (Windows, MS-DOS, etc) and multi-user (Unix, Linux, MacOS) versions of interactive OSes
  - Multi-user versions allow multiple users to interact with different programs at the same time
- General-Purpose
  - Typically used where both interactive and batch processing are needed
  - Network OS
    - Designed to share resources such as printers, files or databases on a network
  - Distributed Systems
    - The most recent and innovative type of OS
    - Multiple machines act in tandem as though they were a single machine
    - This allows for either much higher resilience, or much greater overall processing power, depending on the end users' needs
    - If one machine becomes overloaded, programs could be transferred seamlessly to another machine in the cluster
  - Specialist Systems
    - Operating systems specifically designed for one task, such as running an ATM, controlling industrial machinery, or realtime systems such as card processing

## Processes and Process Management

- A process is the "unit of work" in a computer
- It is the sequence of states (e.g. steps in the fetch-execute cycle) resulting from the sequence of instructions that make up a program

### Process Management

- For each process, the operating system maintains a "Process Control Block" which contains useful information, such as the current process state, the next instruction to execute, and any resources (memory, storage, IO devices) which are assigned to it
- This allows the operating system to effectively keep track of and manage all of the processes that may be running on the computer at any one time
- There are two main parts of a process
- Static Resources
  - Memory allocation
  - Working directory
  - IO devices
  - Connections to other processes (locally or over the network)
  - The sequence of instructions which make up the program
- Dynamic Resources
  - The instructions that are actually executed
  - The thread of execution (or thread)
    - Each thread has access to all of the resources allocated to the process
    - Every process can have any number of threads

### Processors and Operating System Overhead

- Since there are usually less processors (or cores) than running processes, the operating system has to manage which processes are running at any one time
- For this to work, the processors have to be shared between processes, and as such do not always have access to the processor
- Any time that the operating system needs to switch processes on the processor, it must "switch contexts", which essentially means saving the current state of the process into memory, and loading in the next one
- This is a very expensive operation, and should be avoided at all costs
- However, it is very common for a process to begin executing and then immediately have to wait for data to come in, either from secondary storage, or user input

### Multithreading

- By using multithreading, it is possible to reduce the impact of OS overhead, improving the performance of the computer and meaning that the processors spend more time actually working than switching contexts
- The basic concept is that each processor has multiple threads running on it at a time, as that way if one thread stalls, the other thread can immediately take over control of the processor without the overhead of context switching
- There are two types of thread
- User Threads
  - Threads used by programmers within their applications
  - They run on top of the kernel, and context switching is handled by the application
- Kernel Threads
  - Handled directly by the kernel itself
  - Context switching and thread switching are handled by the operating system, and is usually more efficient as it can predict which thread will make the most efficient use of the processor

### Thread State

- Each thread is can be in one of two states at a time
- The Run state
  - The thread is currently able to run, and has all of the information and resources it needs to execute the next instruction
  - Threads in the run state are placed into the run queue, where they wait their turn to run on the processor, as determined by the scheduler
- The Wait state
  - The thread is not able to run for any reason
  - This could be due to waiting for some sort of input from a user, or for a file to be loaded from secondary storage
  - Threads in the wait state are placed into the waiting queue
- When a thread is initially created, it starts in the Run state so the first instruction is executed
- A thread could change to the wait state for several reasons
  - Voluntarily - e.g. if a resource is needed from secondary storage, or user input is needed
  - Termination - A thread or entire process may be terminated by the operating system, either automatically or at the request of the user
  - Preemption - A thread is forcefully moved to the wait state if the thread uses it's allotted processor time, a higher-priority thread needs to be executed, or an interrupt must be immediately handled

## Scheduling

- Scheduling and the scheduler is the most important part of a multitasking-capable operating system
- The scheduler determines which processes and threads should run on the processor, and in which order
- Every time the processor goes idle, either due to a thread stalling or using it's allotted processing time, the scheduler must determine which thread should run next

### Non-Preemptive Schedulers

- Processes cannot be stopped or otherwise influenced by the scheduler once they have started
- Every time that a thread enters the wait state, or uses all of it's allotted time, the scheduler will pick a different thread to run
- Each process has full control over the processor until it stalls or is finished with it

### Preemptive Schedulers

- Processes can be stopped and controlled by the scheduler while running
- If a new thread with a higher priority (based upon the scheduler's internal logic) enters the run queue, the current thread will be preempted, and moved to the wait queue
- This allows the scheduler to be more efficient, and will almost always be more effective than a non-preemptive scheduler

### Dispatcher

- The dispatcher is another piece of system software which executes the commands of the scheduler
- It is responsible for switching contexts, switching between kernel and user mode and returning to the execution point of a suspended thread

### Scheduling Criteria

- Processor Utilisation (Try to keep the processor running at all times)
- Throughput (They to maximise the number of processes which complete execution in a given time)
- Turnaround Time (Try to keep the average as low as possible)
  - `Turnaround = Exit Time - Arrival Time`
- Waiting Time (Try to keep the average as low as possible)
 - `Waiting Time = Turnaround - Burst Time`
- Response Time (Try to reduce the time between a thread entering the queue for the first time, and it being executed)

## Scheduling Algorithms

- First-Come, First-Served (FCFS)
  - The process which requests the processor first gets it first
  - Managed with a FIFO queue
  - Once a process has control of the processor, it runs until completion or until it stalls
- Shortest Job First (SJF)
  - The shortest process always runs first
  - This produces the shortest waiting time for a given set of processes
  - The hardest part is determining how long each process will take to execute
  - Can be non-preemptive or preemptive (if a shorter job enters the queue, start executing that)
- Round-Robin (RR)
  - Each process is given a set unit of processing time (time quantum or time slice)
  - Once this time slice is used, the process is moved to the back of the queue
  - Uses a circular queue for the run queue
  - Sequential time slices are only allocated if there are no other processes in the queue
  - Can be non-preemptive or preemptive (time slices are assigned as processes arrive, rather than each time the end of the queue is reached)
- Priority Scheduling
  - Each process is assigned a priority, typically lower number = higher priority
  - The processor is allocated to the highest priority process, if multiple of the same priority exist, use FCFS
  - Not necessarily faster than other algorithms, as its effectiveness is determined by the process priorities
  - Can be non-preemptive or preemptive (if a higher priority process enters the queue, start executing it)
  - This can cause starvation, where low priority processes are starved of processing time. This can be solved by "ageing" the priority of processes
- Multilevel Queue
  - There can be multiple run queues, which have different scheduling needs, e.g. a foreground and background queue
  - Since these processes have different requirements, multiple scheduling algorithms can be used, but one queue usually has priority over the other
  - Each process is permanently assigned to one of the queues
- Multilevel Feedback Queue
  - Similar to a multilevel queue, but processes can move between the different queues
  - Processes may be moved between the queues if their requirements change, for example if a game is minimised while it is running
  - Similarly to a priority scheduler, ageing may be needed if one of the queues is starved of processing time