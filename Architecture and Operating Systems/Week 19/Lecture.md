# Arch & OS - Lecture 16:00 20/03/23

## Operating Systems - Process Manager

### What is a process?

- A process is the "unit of work" in a computer
- It is the sequence of states (e.g. steps in the fetch-execute cycle), resulting from a sequence of instructions

### How does the operating system manage processes?

- The operating system maintains a data structure known as the Process Control Block for each process
- It contains useful information, such as the current process state, the next instruction to execute and any devices which are currently allocated to the process
- This allows the operating system to manage all of the processes effectively, by saving the state of the process and reloading later on after other processes have executed
- There are two parts of a process
  - Static Resources
    - Space in memory
    - Working directory
    - Input and Output devices (e.g. keyboard, mouse, file storage)
    - Connections to other processes either locally or over a network connection
    - The sequence of instructions
  - Dynamic Resources
    - Instructions that are actually executed
      - Known as the "thread of execution" or thread
      - A thread has access to all of the resources assigned to a task
      - Each process may have more than one thread
      
### Processors and Processes

- The processor is the agent which executes the instructions of it's associated program
- There are usually fewer processors than processes
- For this to work, the processes have to share processors, usually using time sharing
- A process has to wait it's turn, and is unable to access the processor when it is not being executed

### Operating System Overhead

- It is very common for one process to begin executing, and then immediately stall and have to wait for data from the hard drive
- Each time this happens, the operating system has to save the state of that process and load another one to run while waiting for the data
- The process of saving and loading processes is non-productive, and is often a large part of the overhead and the actual work the processor is doing

### Multithreading

- Due to the overheads of operating systems, the idea of having multiple threads running on one processor is desirable
- The idea is to have multiple threads running on the same processor at a time, so that when one thread stalls, the processor can immediately start executing the other thread without having the overhead of saving and loading the process
- Multithreading allows multiple threads of the same process to be executed at once, but still only one process can run on a processor at a time
- This reduces the time that the processor is not doing any productive work, making it faster overall, and makes it able to run more threads at a time

### Types of Threads

- User Threads
  - Threads used by programmers within their applications
  - They run on top of the kernel and don't have the support of the kernel
- Kernel Threads
  - Kernel threads are handled by the kernel itself
  - When run like this, the operating system handles switching between threads and is usually more efficient as it can monitor the other threads to make the most efficient use of the processor
  - All modern OSes support kernel threads, allowing the kernel to perform multiple tasks at once

### Tasks

- The task is the static part of a process, and includes information about the memory the process needs, the working directory, I/O devices, and the number of threads
- As it needs to keep track of a variable number of threads, it has to be able to change in size
- This information is known as the volatile environment, as it contains dynamic information that may change depending upon when the process is being executed

### Thread State

- Each thread has it's own state, and can either be in the `RUN` state or the `WAIT` state
  - RUN state
    - The thread is ready to run, and has all of the information that it needs to execute the next instruction
    - Threads in the RUN state are placed into the "run queue", which decides the order in which threads are executed by the processor
  - WAIT state
    - For any reason, the thread is not able to be executed
    - For example, it may be waiting for some sort of input, such as user input or a file from the storage
    - Threads in the WAIT state are places into the "waiting queue"
- When a thread is created, it always starts in the RUN state within the run queue
- Eventually, this new thread will have some CPU time, and unless it encounters a condition it must wait for, it is placed at the back of the run queue
- A thread may change to the WAIT state for several reasons
  - Voluntarily - e.g. if a resource is needed from the storage or input is needed from the user or another thread
  - Termination - e.g. a thread or entire process may be terminated by the operating system, either automatically or due to the user
  - Preemption - e.g. the thread uses all of it's processor time, a higher priority thread requires execution, or an interrupt is sent to the CPU that must be handled immediately
- A thread in the WAIT state changes to the RUN state and rejoins the run queue when the event it is waiting for occurs

### Context Switching

- The procedure of reallocating a processor from one thread to another
- This occurs when
  - A thread loses control of the processor for any reason and moves into the wait queue
  - A timer interrupts the thread as it has used up it's allotted time
- It is essential that the state of a process is saved each time a thread loses control of the processor, as otherwise it would be impossible to resume execution of the thread

### Scheduling

- The main objective of the scheduler is to manage the CPU and ensure that all threads are able to use the processor
- It tries to give priority to some threads
- As threads need to be given priority, there are multiple queues, one for high priority threads, and one for lower priority threads
- A real operating system may have more than two queues, if there are very high and very low priority threads
- Threads in the high priority queue are always offered processor time before threads in the low priority queue
- When a thread is initially created, it is placed on the highest priority queue in the system
  - If the thread uses all of its allotted execution time, it is assumed to be compute-heavy and so is moved to the low priority queue
  - If the thread gives up its processor time either to wait for user input, or for resources to become available, it is assumed that the process is interactive, and so remains in the high priority queue
  - Threads on the higher priority queue are assumed to take up less processing time than low priority threads