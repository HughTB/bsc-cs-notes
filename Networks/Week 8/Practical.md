# Networks - Practical 12:00 23/11/22

- When using a switch in the network the ethernet delay drops over time, as opposed to when using a hub, in which the delay increases over time
    - This is because, at the start of the simulation, the switch does not know the IP Address of any of the nodes
    - Over time the delay decreases, as the switch learns the IP addresses of the nodes connected to it, meaning it can use the lookup table to send to a specific node rather than broadcasting

### Key Terminology - Signals

- Periodic signal
    - A signal that repeats (every x seconds, minutes or hours)
- Non-periodic signal
    - A signal that does not repeat (it instantly disappears)
- Amplitude (A)
    - The strength of the signal (Decibels, dB)
- Frequency (f)
    - The number of times the signal repeats every second (Hertz, Hz)
    - $f = \frac{1}{T}$
- Period (T)
- The time for one cycle to be completed (Seconds, s)
    - $T = \frac{1}{f}$
- Bandwidth
    - The range of frequencies that are used to communicate, the distance between the maximum and minimum frequency
    - The higher the bandwidth, the greater the communication speed that can be used (Higher bps)