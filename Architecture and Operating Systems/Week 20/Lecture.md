# Arch & OS - 16:00 27/03/23

## Process Scheduling

### CPU Scheduling

- CPU scheduling is the most important function of a multiprogrammed operating system (one capable of multitasking)
- By sharing the CPU between threads, the operating system can make better use of the processor
- In a single-processor system, only one process can run at a time
  - Other threads must wait until the CPU is free and can be reassigned
  - The objective of multitasking is the ensure that a thread is running at all times, to make most use of the CPU
- Each thread is processed until it must wait or it has used it's allotted time
- Several threads are kept in memory at any one time
  - When any thread has to wait, the operating system gives control of the CPU to another thread, to ensure it does not go idle

### CPU I/O cycle

- Process execution consists of a cycle of execution and waiting
- Processes alternate between these two states
  - A thread always starts with an execution burst
  - This is usually followed by an I/O burst, followed by an execution burst, and so on
  - The final call is always for the system to terminate the program, whether requested by the program or forced by the user or operating system

### CPU Scheduler

- Whenever the CPU goes idle, the scheduler must immediately find another thread to run
  - This is the job of the CPU scheduler
  - The scheduler selectes another thread that is already in the run queue, and therefore loaded into memory

### Non-Preemptive Scheduling

- Processes cannot be stopped or otherwise controlled by other processes
- This type of scheduler makes decisions under the following circumstances
  - When a process switches from the RUN state to the WAIT state
  - When a process terminates
- There is no control over the order of scheduling
  - No priority
  - If another process is in the run queue, it will always be selected over the currently running one
- Each process has full control over the CPU, until it either finishes with it, or switches to the wait state while I/O operations are performed
- One example of this were Windows versions 1 - 3.0

### Preemptive Scheduling

- Processes can be stopped and otherwise controlled by the scheduler
- If a new process with higher priority enters the run queue, the currently running process may be paused
- This type of scheduler makes decisions under the following circumstances
  - When a process switches from the RUN state to the WAIT state
  - When a more important process needs to run
  - When the process has used it's allotted time
- This means that there the scheduler has choices over what runs on the CPU
- This requires special hardware, for example a timer, to run
- Windows 95 onwards use preemptive scheduling

### Schedulers

- Schedulers are a special piece of system software responsible for determining when threads are able to run on the processor
- There are 3 types of scheduler
  - Long-term scheduler
    - This type of scheduler looks at the long-term needs of software, and knows which order parts of programs should be run
    - The highest level scheduler
  - Medium-term scheduler
    - This scheduler controls when threads are moved from the wait to the run queue
    - It handles moving them between the queues when processes need access to I/O devices
  - Short-term scheduler
    - This scheduler controls which processes are actively running, and decides their order based upon their priority

### Dispatcher

- A dispatcher is a piece of system software that comes into play after the scheduler
- When the scheduler has decided which process should run, the dispatcher is responsible for actually switching the states of the processes
- It is responsible for
  - Switching contexts
  - Switching between kernel and user mode
  - Returning to the execution point of a suspended process

### Scheduling criteria

- CPU utilisation (Maximise)
  - Try to keep the CPU as busy as possible
- Throughput (Maximise)
  - Number of processes which complete execution in a given time
- Turnaround time (Minimise)
  - The amount of time needed to execute a particular process
  - Turnaround time = Exit time - Arrival time
- Waiting time (Minimise)
  - The amount of time that a process waits in the ready queue, on average
  - Waiting time = Turnaround time - Execution time
- Response time (Minimise)
  - The amount of time taken between the submission of a request until the first response is produced

### Scheduling algorithms

- First-Come, First-Served (FCFS)
  - The process that requests the CPU first is allocated the CPU fist
  - Managed with a FIFO queue
  - When a process enters the queue, it's Process Control Block is linked onto the tail end of the queue
  - When the CPU is free, the PCB at the head of the queue is allocated to it
  - Once a process has been given control of the CPU, it retains control until the process terminates or I/O access is required
- Shortest Job First (SJF)
  - The process which requires the least execution time always runs first
  - This way, it gives the shortest average waiting time for a given set of processes
  - The difficulty of this is knowing how long a process will take to execute
  - There are two versions of this algorithm
    - Non-preemptive
      - The currently running process will continue until completion, even if a newly arrived process would take less time to run than is left of the current process
    - Preemptive
      - The currently running process will be suspended if a new process enters the queue with a lower execution time than is left of the current process
  - Either way, the process with the shortest runtime will be executed first, leading to lower average wait times