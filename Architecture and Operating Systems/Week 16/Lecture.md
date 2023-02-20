# Arch & OS - Lecture 16:00 20/02/23

## Computer Memory Systems

### Memory Key Caracteristics

- Memory is an area where data is stored, usually represented in binary
- Memory stores this data either temporarily or permanently, depening upon if the memory is volatile or non-volatile
- Location
  - Internal, e.g. registers, main memory, cache, secondary memory (SSDs, HDDs)
  - External, e.g. ODDs, external HDDs or SSDs, USB drives
- Capacity
  - Number of words
  - Number of bytes
- Unit of Transfer (the number of bits read out of or written to memory at one time)
  - Bits (Usually only for main memory)
  - Bytes
  - Word (Often used for registers)
  - Block (Multiple words of data)
- Access Methods
  - Sequential Access (Has to wind all the way from the start to the requested address) - Tape drives
  - Direct Access (Directly access the address) - Disk drives
  - Random Access (Any position in memory at any time) - Main memory, Cache
  - Associative Access (Returns data in the cache that is similar to the requested address) - Cache
- Performance
  - Access time (Latency)
  - Cycle time (Period)
  - Transfer rate (1/cycle time, frequency)
- Physical Type
  - Semiconductor (RAM, ROM, SSD)
  - Magnetic (Floppy, HDD)
  - Optical (DVD, CD, BD)
  - Magneto-optical
- Physical Characteristics
  - Volatile / Non-volatile (Will it store data when the power is disconnected)
  - Erasable / Non-erasable (Can it be overwritten or is it write-once, read-many)

### Memory Hierarchy

- How much of each type of memory do we need?
- How fast is each type of memory?
- How much does each type of memory cost?
- Relationships
  - Faster access time -> more expenisve
  - Greater capacity -> Slower access time
  - Greater capacity -> Lower cost for the same size
- Hierarchy (Decreasing cost, increasing capacity, increasing access time, decreasing access frequency as you go down the hierarchy)
  - Inboard Memory
    - Registers (Fastest, smallest, most expensive, and used in almost every instruction)
    - Cache
    - Main Memory
  - Outboard storage
    - Magnetic Disk
    - CD-ROM / CD-RW
    - DVD-ROM / DVD-RW
  - Offline storage
    - Magnetic Tape (Slowest, largest, least expensive, and used infrequently to access large amounts of data for processing)
- The smaller and faster memories are supplimented by larger and slower memory in a typical computer

### Cache Memory

- Cache combines multiple type of memory of differing speed and capacities to speed up memory access without drastically increasing cost
- In a typical CPU, there will be 3 layers of cache, which decrease in speed and cost but increase in capacity
- This hierarchy is usually
  - Registers
  - Level 1 Cache
  - Level 2 Cache
  - Level 3 Cache
  - Main Memory
- When the CPU needs data from the memory, the cache stores a few addresses surrounding the address that was requested, to speed up future requests