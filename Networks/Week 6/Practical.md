# Networks - Practical 12:00 09/11/22

### Riverbed Simulation

- You can create multiple scenarios within one riverbed project
- You can then switch between them at any time
- Additionally, if you go to Manage Scenarios, you can simulate any scenario in the project easily to collect data
- If you then go into the DES menu, you can go to Results -> Compare Results, which allows you to easily compare the data from the two scenarios

### Switches vs Hubs
  
- When using a Switch instead of a Hub, the average delay in the network is reduced drastically, in this simulation it decreases from ~0.14 to ~0.01
 - A hub broadcasts all incoming traffic to all interfaces, and therefor to every node connected to it
 - On the other hand, a switch reads the header in each packet and relays it only to the node that needs it
 - The result of this is that all devices connected to a hub are part of one "collision domain", and therefore only one node can communicate at a time, meaning that all other nodes have to wait until the network is not being used
 - This causes the greatly increased delay when using a hub rather than a switch
  
- Switches use a learning process to discover which nodes are connected to which interfaces (ports)
 - They have a register which relates the interfaces (ports)
 - Each time a node sends a packet, the switch reads the header and finds the IP address of the node that sent the packet, which it can then store in the register for future use
 - If the register does not contain the IP address the packet is destined for, it broadcasts the packet on all interfaces
 - Usually this learning process is quite fast, because any time a TCP transmission is sent, the receiving node will respond with a confirmation, which the switch can also use to learn the IP address of the node that responded
 - Once the learning process is complete, the nodes connected to a switch are each part of their own collision domain, containing only the switch and the node, making collisions essentially impossible