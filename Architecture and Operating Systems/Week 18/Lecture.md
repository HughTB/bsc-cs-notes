# Arch & OS - Lecture 16:00 13/03/23

## Operating Systems

### Development of Operating Systems

- Late 1940s
  - No operating system
  - Programmer is the user
  - Programs and data are entered manually using switches on the front of the computer
  - Output was displayed using a series of lights, each representing a binary one or zero
- 1950s
  - Specialist operators began to appear
  - These operators were not programmers, but specialised in controlling the computers
  - They would feed programs into the machine and deliver the output to the programmer who wrote the program
  - Punch cards were used to represent the programs and data, which consisted of a series of stiff cards with holes punched in them to represent ones and zeros
  - The operators acted as an interface between the computer and the programmer
- 1960s
  - Human operators were a source of slowdown in the systems
  - Operators were replaced with control cards, which gave the ability for the programmer to control the hardware
  - Said control cards were inserted before and after the program and data cards
  - They had their own specially developed "job control" languages
- Late 1960s and 1970s
  - First attempts to provide interactive use of computers
  - Programs were growing in size faster than the memory of the computers
  - To get around this, larger programs were broken up into chunks, each of which could fit into the computer's memory
  - This lead to the advent of time sharing, in which the programs were run one chunk at a time, alternating between different programs to make more efficient use of the computers
  - The issue of protecting programs from one another became more important
- 1990s
  - Shift to open systems
  - Previous operating systems were designed specifically for one set of hardware
  - Operating Systems were made more generic and cross platform, with new OSs being introduced, such as Unix, DOS and IBM OS/2

### What is an operating system?

- An operating system is a program in and of itself
- They are typically started as soon as the computer is switched on and continue to run until the computer shuts down
- They sit in between user programs and the hardware

### What does an operating system do?

- Provides an environment which helps other programs run
- Starts and stops programs, including sharing CPU time between programs
- Manages Memory
  - Tracks which parts of memory are in use and which parts are free
  - Provides a method for programs to request more memory or return it when it is no longer needed
- I/O
  - Covers up the differences between different makes and models of devices
- Provides an interface to the file system on the secondary storage
- Protects programs from interfering with others
- Provides an interface to the network
- Error handling and recovery

### Operating System Interfaces

- There are multiple types of interface that an operating system may have
- GUI
  - Graphical User Interface
  - Typical of operating systems such as Windows or MacOS
- CLI
  - Command Line Interface
  - Often associated with operating systems such as Linux
  - Usually only requires or supports keyboard input
  - Commands are entered as text, and the output is returned

### What is the Kernel?

- The heart of the Operating System
- Provides the interface between the software and hardware
- Responsible for assigning resources (CPU, RAM, GPU, etc) to programs
- Decides which programs should be executed, and in what order
- It has it's own area in memory so that it can function independently of the other software running on the computer
- It acts as a central authority which monitors the hardware and the flow of data between applications
- There are different zones in the computers memory, which can only be accessed by programs running in that area
  - User Space (Where the vast majority of applications run)
  - OS Space (Reserved area of memory where the operating system runs)
    - Kernel Space (Part of the OS Space is reserved for the kernel, and very few applications reside here, usually only applications that need direct access to parts of the hardware, such as device drivers)
- CPUs can operate in two different modes
  - User Mode
    - The CPU can only execute a specific set of it's instructions, usually more common instructions such as addition, subtraction, and loading from and storing to the memory
    - If a program is executed in user mode, it does not have direct access to the hardware or areas of memory that are not reserved for it
  - Kernel Mode
    - The CPU can execute all of it's instructions, including more obscure and privileged instructions
    - If a program is executed in kernel mode, it had direct access to the hardware, and all areas of memory, including those assigned to other programs

### Monolithic and Micro Kernels

- Monolithic Kernel
  - User services and kernel services run in the same address space
  - Lower access time and faster execution than microkernels
  - Harder to maintain and extend than microkernels
  - Higher general system performance than microkernels
  - Linux and other Unix-based operating systems use monolithic kernels
- Microkernel
  - User services and kernel services are kept in separate address spaces
  - Smaller in size
  - Higher access time and slower execution than monolithic kernels
  - Easier to maintain and extend than monolithic kernels
  - Windows uses a hybrid of Micro and Monolithic kernels

### Types of Operating System

- Batch Systems
  - Earliest operating systems developed
  - Data and commands to manipulate the program are submitted together in the form of a job
  - Little or no interaction once the program has started
  - e.g. Payroll processing or Bank mainframe systems
- Interactive Systems
  - Most common type of operating system, using a keyboard, mouse and display
  - Significant improvement over batch systems, as user input can be received while it is running
  - Single User
    - Multitasking and interactive computing for a single user at a time
    - Includes Windows, MS-DOS and IBM OS/2
  - Multi User
    - Multitasking and interactive computing for multiple users at the same time
    - Includes Unix, Linux, Windows Server and MacOS
- General-Purpose Systems
  - For environments where both interactive users or batch processing modes may be useful
  - Network OS
    - Operating systems designed to share resources such as printers, databases or files across a network, such as Windows Server or NAS devices
  - Distributed Systems
    - Most recent development in operating systems
    - Essentially, a group of machines acting in tandem and appearing as one machine
    - When a program is started, it may be run on any of the machines in the "cluster"
    - If any one machine becomes overloaded, and another machine is available, some of the running programs can be seamlessly transferred and run on that machine instead, evening out the workload between the machines in the cluster
  - Specialist Systems
    - Operating systems dedicated to one task
    - This may be embedded devices such as ATMs or control systems in industrial machinery, or real-time systems such as banking and card processing

### Operating System Design

- An operating system is usually a very large and complex piece of software
- Designing and maintaining an operating system requires a very high-level view of how the system is structured, and how it's components interact and work together
- Since operating systems are so large and complex, they are usually split into different "modules" which are able to interact with each other as necessary
- The main modules of an operating system are as follows
  - Process Management
  - Memory Management
  - IO Management
  - File Storage
  - Network Management