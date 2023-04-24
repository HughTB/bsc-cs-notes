# Arch & OS - Lecture 16:00 24/04/23

## Process Scheduling

### Scheduling Algorithms Contd.

- Priority Scheduling
  - Each process has a priority assigned to it, typically the lower the number the greater the priority
  - The CPU is allocated to the process with the highest priority
  - There are both preemptive and non-preemptive versions
  - Not necessarily faster overall compared to other algorithms, but allows for high-priority processes to be executed before others
    - This is useful for situations in which real-time applications are running on non-realtime operating systems
  - As you would expect, for the preemptive version, lower-priority processes are bumped off the processor when a higher-priority process arrives
  - Priority scheduling can be combined with other scheduling algorithms to determine which process should run first if they all have the same priority, but in the case of this exam, always pick the process which arrived first
  - This does have a few problems
    - Starvation / Indefinite Blocking
      - If higher-priority processes continually need access to the processor, lower-priority applications may be starved of process time as they are always placed at the back of the queue
      - This can be solved using ageing, where processes slowly increase in priority over time until they are processed
- Round-Robin (RR)
  - Each process is given a small unit of processing time or a time slice. After this time has passed, if there is another process ready to run, the processor must be given up
  - The ready queue is treated as a circular queue
  - The scheduler gives a time slice to each process in the queue, only assigning sequential slices if there are no other processes in the queue
  - Every time slice, the scheduler should check if a new process has entered the ready queue, and assign it processor time
- Multilevel Queue
  - The ready queue has multiple levels, for example
    - Foreground processes
    - Background processes
  - Since these processes have different requirements for turnaround time, they have different scheduling needs
  - The processes are permanently assigned to one queue, typically determined by a property of the process
  - Each of the queues uses a different scheduling algorithm, depending on the needs of the processes in them
- Multilevel Feedback Queue
  - Similar to a multilevel queue, but processes are allowed to move between the different queues
  - The order of scheduling is defined by several parameters
    - The number of queues
    - The scheduling algorithm used in each queue
    - The method used to determine when to increase or decrease a process's priority
    - The method used to determine which queue processes will be initially placed into