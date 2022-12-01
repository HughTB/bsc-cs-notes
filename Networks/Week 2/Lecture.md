# Networks - Online Lecture 09:00 04/10/22

### What is a Network?

- A network is a group of devices (PCs, Laptops, Mobile phones, etc) that are all able to communicate with each other to share data, files or programs
- Hardware - The physical connections between devices in the network, e.g. ethernet cables, fibre lines, wireless access points, etc
- Software - What enables ut to use the hardware for communication and exchanging information
- Networks should be "Interoperable" - this means that different types of devices, using different operating systems, can all connect to the same network and communicate with each other to share information, as long as they can all communicate using the same network protocols

### Network Topologies

- Star Topology:
 - All devices are directly connected to a central "hub" - usually a switch
 - If one node fails the rest of the network will still function
 - More common in networks of today
 - Easy to add or remove nodes as they are needed
 - Number of nodes is limited to the number of ports that the central switch has
 - If the central "hub" or switch fails, the entire network fails, and so there is a single point of failure
 - If the central "hub" is slow, the entire network will be slow
  
- Bus Topology:
 - All devices are connected directly to the main cable known as the "backbone"
 - Cannot cope with heavy traffic
 - Prone to collisions when two nodes try to communicate at the same time
 - Difficult to administer or troubleshoot as if the cable breaks the entire network stops functioning
 - Limited cable length, number of nodes is limited by the length of the cable
 - Performance degrades as additional devices are added
 - Not a popular design as it is very limiting
 - Should is really only be used for a small group of computers
  
- Token Ring Topology:
 - All nodes on the network are connected in a "loop"
 - Nodes must wait until they have the "token" before they can communicate on the network, making collisions impossible
 - All nodes get a chance to communicate on the network
 - Good "quality of service"
 - If one of the nodes or cables goes down then the whole network may go down
 - Tokens may get lost or corrupted
 - Difficult to add or remove nodes from the ring
  
- Mesh Topology:
 - All nodes are connected directly to other nodes
 - Redundancy as if any node goes down the traffic can be re-routed
 - The network can be expanded without disruption
 - Requires more cabling than other topologies
 - Complicated to implement
 - Large amounts of cables that will only be used on occasion
 - A "partial mesh" network can be constructed where each device is connected to a few others, but not all as that way there is still redundancy but less wasted cabling and less complexity