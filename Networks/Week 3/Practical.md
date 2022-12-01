# Networks - Practical 12:00 12/10/22

- By design, the one cable at the centre of a bus topology network is shared between all computers on the network, and therefore collisions are very likely
- A domain is a region of a network where all devices listen to any communication on the network, and a bus network only has one domain
- You can find the domain by looking at where there is shared medium (a physical connection shared between multiple devices, such as a bus)
- A collision occurs when multiple devices try to communicate in the same domain at the same time

### Preventing collisions

CSMA/CD (Carrier Sense Multiple Access / Collision Detection) algorithm:
- Is the medium idle (no other messages being sent)?
 - Yes? Start transmitting
 - Are there any collisions now?
  - No? Finish transmission
  - Yes? Continue sending packets for the minimum packet time (minimum time for a packet to transfer across the medium) to ensure the other node has detected the collision
  - Has the maximum number of transmission attempts been reached yet?
   - Yes? Abort the communication
   - No? Wait for a random length of time, then go back to the start of the algorithm (the node with the shortest time to wait will transmit first)
 - No? Go back to the start of the algorithm