# Networks - Online Lecture 25/10/22

### NIC (Network Interface Card)

- There are many different types of NICs, which are used to communicate using different mediums, e.g. WiFi, Ethernet, etc
- Each NIC has a 48-bit unique identifier known as a MAC address (Media Access Control address)
- The MAC address allows you to determine both which NIC communicated, but also which manufacturer made the card, and theoretically when the NIC was produced
- NICs read all broadcast addresses and
- All multicast messages with addresses it's been programmed to read
- The hardware will simply ignore all other messages

### Ethernet LAN access devices

- Client devices have a cable between them and an interconnection device, usually in a network rack
- An "interconnection device" could be:
 - A hub (Legacy)
 - A Switch
 - A Router (To access a different network, such as the internet)
  
Access rules for ethernet hubs
- Listen before sending
- Stop if multiple users start at the same time
  
Distribution rules for ethernet hubs
- All traffic is sent everywhere
- One packet is sent at a time
  
Access and distribution rules for Ethernet LANs
- Send whenever you want to
- No collisions
- Traffic is only sent where it needs to be
- Multiple packets can be flowing at the same time

### Switched Ethernet
  
Characteristics of a switch
- Automatically learns the addresses of all connected devices
- Forwards only to the destination
- Supports many ports per switch
- Supports full duplex on dedicated ports (Can send at full speed in both directions at the same time)
- Supports different data rates on different ports
- Ethernet switches usually operate in store-and-forward mode
 - Temporarily holds the packet while deciding which port the packet needs to be sent through
- Some switches may also support cut-through operation
 - 

### Unicast vs Multicast

- Unicast sends a packet in one direction to a single node on the network
- Multicast sends a packet to multiple nodes on the network in a target group (not all nodes on the network)
- Broadcast sends a packet to all nodes on the network

### The LAN networking model

- The data link layer is split into two sub-layers
 - LLC (Logical Link Control)
 - MAC (Media Access Control)
- Common aspects of LAN standards
 - All use the same MAC addresses
 - Supports broadcast and multicast addressing
 - All have 32-bit error checking
- Different aspects
 - Access methods (CSMA/CD vs Token)
 - Maximum frame size
 - Support for features such as priority
 - Specific data rates

### Virtual LANs (VLANs)

- Software emulates a physical LAN
- The purpose of VLANs is to limit broadcast traffic to a set group
- The group is set by network management
- VLANs are enforced by
 - Selecting a set of ports on a switch
 - Selecting a set of MAC addresses
- VLANs are more convenient than re-wiring the entire network

### Ethernet standards

- PoE (Power over Ethernet)
 - Provides power through the ethernet cabling, reducing the number of cables and ports needed for low power devices such as access points
 - Defined in 802.3af
- 10 Base5 (10mbps, 500m max)
- 10 Base2 (10mbps, 185m max)
- 10 Base-T (Unshielded twisted pair (UTP) 10mbps, 100m max)
- 10 Base-F (Fibre optic ethernet 10mbps, theoretically unlimited range)