# Networks Reference Sheet - Theory

- Unlike my other reference sheets, this one is in no particular order, since it was taught in no particular order

## Network Topologies

### Star

- All devices are connected directly to a central point, usually a device such as a switch
- If a single node fails the rest of the network continues to function
  - However, if the central device fails, the entire network goes down
  - This is known as a single point of failure and should be avoided where possible
- This is a very common type of network, especially in homes and small businesses

|Advantages|Disadvantages|
|-|-|
|Easy to add or remove nodes as needed|Number of nodes is limited to the number of ports available on the central device|
|Each node can use the full bandwidth of the connection|If the central device is slow, the entire network will be slow|
|If a node or cable fails, the rest of the network will continue to function|If the central device fails, the entire network stops functioning|
|Collisions are essentially impossible||

### Mesh

- All nodes are directly connected to all other nodes
  - This is very wasteful as most of the connections will be used infrequently, and it requires a lot of cabling for even a very small network
  - To get around this, we can instead construct a "partial mesh" network
    - Each node is connected to a few others
    - Less cabling required
    - Still resilient as traffic can be rerouted around and problems
    - This is essentially how the World Wide Web is designed
- If a single node fails, only that node is affected
  - There is no single point of failure, other than the router connecting to the internet, but that is almost unavoidable

|Advantages|Disadvantages|
|-|-|
|Theoretically unlimited devices|Very hard to add new devices to a full-mesh network|
|Collisions are impossible as each node is directly connect to all others|Lots of connections will be used very infrequently or not at all|
|If a node or cable fails, the rest of the network will continue to function|Very complicated to setup initially and even harder to maintain|

### Bus

- All nodes are directly connected to a single cable often called the backbone
- Used infrequently due to its many issues, but could be used as a low-cost, low-speed link between a few devices

|Advantages|Disadvantages|
|-|-|
|Cheap and easy to setup|Hard to maintain as a single cable failure could bring the whole network down|
|If a single node fails, the rest of the network will continue to function|Very prone to collisions as all nodes share a communication medium|
||Performance degrades rapidly as more devices are added due to the number of collisions|
||Number of connected nodes is limited by the maximum length of the communication medium|
||Unpopular design due to its many limitations|

### Token Ring

- All nodes are connected to form a ring of cable
- Each node must wait until it has possession of the token before communicating
  - Collisions are impossible
  - All nodes get a chance to communicate
  - Bandwidth is severely limited
  - If the token is lost or corrupted, the network may stop functioning

|Advantages|Disadvantages|
|-|-|
|Very good quality of service (no collisions, all nodes get to communicate)|If one of the nodes or cables fails, the entire network stops functioning|
|Relatively inexpensive as not many cables are needed|Difficult to add or remove nodes from the network once it is built|
||The token can be lost or corrupted in transmission, causing the entire network to stop functioning|

## Network Protocols

### Internet Protocol (IP)

- Internet Protocol provides methods for transmitting data across networks of all sizes
- It determines how large the packets transmitted across the network should be
  - It also adds the header information to each packet, including
    - The sender's IP address
    - The receiver's IP address
    - The packet's Time To Live (TTL), meaning how many hops the packet can take before giving up
- Provides routing services once on the network, with each switch or router determining the fastest path to get to the next router on the route
  - This is done on a packet-by-packet basis, meaning that not all packets will take the same path across the network
  - It determines the path the packets should take based on the latency between nodes, as well as the congestion on the network
- As part of the transport across the network, the packet may need to be split up further depending on the transmission medium being used for each hop

### Transmission Control Protocol (TCP)

- Reliable data transmission
- Performs integrity checking
  - Any dropped or corrupted packets are retransmitted
  - Packets are reordered before being sent to the application
  - An acknowledgement is sent back to the sender to say that all packets were received successfully
- Connection Oriented protocol
  - A connection must be established before the data can be sent
  - This allows the sender to verify that there is a path to the receiver
  - The connection is set up as a virtual channel between the sender and the receiver
- A 3-way handshake is made before any data is sent
- TCP is typically used as a part of the TCP/IP pair, which facilitates communication across the Internet as well as local networks

### User Datagram Protocol (UDP)

- No guarantee of data delivery
- No integrity checking
  - Any dropped or corrupted packets are ignored
  - Packets are not ordered
  - No acknowledgement is ever sent by either party
- Connectionless protocol
  - The data is sent straight away
  - The receiver does not need to be ready or even exist before data can be sent
  - No checks are performed before, after or during the transmission
- TCP should be used in almost all cases, except when latency is of particular concern
  - Because of its inherently lower latency, UDP is used for applications such as video or audio streaming across the Internet
  - In these cases, a few dropped or corrupted packets might result in some brief audio or video glitches, which is almost inconsequential compared to the improved latency and speed gained by using UDP

### Secure Sockets Layer (SSL)

- A socket is a method of creating a connection between devices
  - You can open a socket to connect to a remote host, or you can open a local socket to allow remote hosts to connect
- SSL provides additional security for sockets
  - Provides end-to-end encryption
  - Provides the same abstraction as other protocols and can often be used as a drop-in replacement for traditional sockets
- When is SSL used?
  - Any time that secure transmission across a network is required
  - HTTPS adds SSL on top of HTTP, allowing secure connections to websites, which is especially useful in situations where information such as passwords or banking information is sent
  - Secure File Transfer Protocol (SFTP) builds upon FTP, adding SSL to improve security
  - Modern email servers often use SSL on top of whatever mail protocol (SMTP, POP, IMAP, etc) they would typically use

### Protocol Multiplexing

- Since multiple applications on a computer may need access to the network at any one time, there must be a way of differentiating incoming transmissions
- This is accomplished using ports
  - Each port is like a virtual connection to the computer
  - Every network device has 65535 ports, numbered from 1-65535
  - Each application uses its own port, but some protocols and applications have a default port. For example, HTTP uses port 80 by default, HTTPS port 443 and SSH port 21
- Incoming packets enter the transport layer, where it is determined which application the packet should be sent to, depending upon the port it's using

### Domain Name System

- Essentially a database which stores a list of domain names and what IP address(es) relate to them
  - e.g. `google.com` currently points to `142.250.187.206`
- There are usually up to 3 layers of DNS, but since you can have infinite subdomains, there could be infinite DNS layers
  - The first layer of DNS is the Top Level Domain server, which is responsible for all domains with that TLD (A TLD is the ending of a domain, e.g. `.com` or `.uk`)
  - The next layer of DNS is that of the domain itself, for example, `hughtb.uk`. These DNS servers are usually run by the person who owns the domain, or at least the registrar that they have their domain registered with
  - What is typically the final layer of DNS is your local DNS server, which is typically hosted on your router or by your ISP
- There are many types of DNS records, for example
  - A records, which point a domain or subdomain to an IPv4 address
  - AAAA records, which point a domain or subdomain to an IPv6 address
  - MX records, which point to the Mail server belonging to the domain
  - PTR records, which facilitate reverse lookups
  - CNAME records, which point the DNS server to another domain and therefore DNS server
- When a DNS request is sent, it initially goes to your local DNS server. If your local DNS server does not know the IP belonging to the domain, it sends it to the TLD server. The TLD server then passes the request to the respective 2LD (2nd Level Domain) server, and so on down the chain of DNS servers, until the request is resolved
- While we might typically think of `.co.uk` as a TLD, it is a 2nd Level Domain, which belongs to the TLD `.uk`

## TB2

### Asynchronous Transfer Mode (ATM)

- ATM is a telecommunications standard defined by ANSI and ITU-T
- It operates in the data-link layer
- It supports a wide range of QoS assurance methods
- It's the core protocol used in SONET and SDH
- It uses relatively large packets, which are segmented into 53-byte chunks (48 bytes payload, 5 bytes header) for transmission
  - Said packets are switched across the network and reassembled at the destination
  - The arrival time and order of the packets are unpredictable, so it can reorder and re-request packets
- Designed from the ground up to support virtual circuits across a highly reliable medium, and is optimised for the connectionless style of IP
- ATM is typically used as the backbone of WANs as it is not cost-effective to run to edge nodes such as individual homes or businesses

|Advantages|Disadvantages|
|-|-|
|Meets or exceeds international industry standards|Complex to install and operate|
|Commonly used in high-speed WANs|Somewhat inefficient (roughly 10% of bandwidth is wasted to header data)|
|Has built-in support for voice and video transmission|Not cost-effective to run to the edges of networks|
|Cost-effective within the core of a WAN||

### ATM Traffic Engineering

- QoS settings can be configured on every ATM interface
- There are many different settings available, but the main one is the bitrate of the connection. It can be set to any of the following
  - Constant Bit Rate (CBR)
    - Allows transmission at the Peak Cell Rate (PCR) for a maximum interval before throttling back to the CBR
  - Variable Bit Rate (VBR)
    - Allows transmission at the PCR for a maximum time before throttling back to the Sustainable Cell Rate (SBR)
  - Available Bit Rate (ABR)
    - A minimum bitrate is guaranteed
  - Unspecified Bit Rate (UBR)
    - Traffic is allocated until the maximum bitrate is reached, and any other incoming cells have to redirect or wait for bandwidth to be available

### Transparent LAN Services (TLS)

- Provides an interface for accessing devices over the network
  - Transparent in this case means that it is handled entirely automatically
  - No need to worry about the WAN
- No provision is needed for frame relays, ATM, leased lines, etc
- TLS can be used to bridge separated LANs
  - This allows them to act as one large LAN
  - Reduces the need to manage WAN access
- Allows Ethernet circuits to access ATM connections
  - Often known as "Metro Ethernet" or "Ethernet Transport"
  - Available at all standard Ethernet data rates

### Voice over Internet Protocol (VoIP)

- The original intention of VoIP was to reduce the typical number of networks in a business from two to one
  - Typically, a business would have a phone network as well as a computer network
  - Using VoIP allows special VoIP phones to use the computer network to communicate with each other
- However, nowadays the use of VoIP also provides the following advantages
  - Lower cost than two networks
  - VoIP phones are typically more capable than standard phones
  - Delays in communication are reduced
  - Much better QoS than a typical phone network
- It does also have some disadvantages
  - The gateway between the VoIP network and the traditional phone network could be a single point of failure, and if a low-performance device is used, the quality of the call could be worse than a normal phone
  - Wireless VoIP phones may temporarily lose connection if moving between access points

### Session Initiation Protocol (SIP)

- This protocol works on the application layer and is used for initiating, maintaining and terminating communication sessions across the internet
- Provides infrastructure for voice, video and instant messaging services
  - Since it provides this functionality, it is commonly used in VoIP and VoLTE connections
- 5 categories of communication
  - User Location
    - Realtime local device discovery
  - User Availability
    - Checks if the user on the other end is available, they can be online, engaged, unavailable, etc
  - User Capability
    - Checks if the device on the other end supports different formats, and negotiates accordingly
  - Session Setup
    - Establishing the connection over the network
  - Session management
    - Transferring sessions between devices, modifying settings, changing from unicast (two devices) to multicast (two or more devices)
- SIP communicates similarly to HTTP, in that it's a request-response connection

### The Internet and Network Access Points (NAPs)

- The internet is made up of many ISPs which operate on different levels
  - Tier 1: International
  - Tier 2: National
  - Tier 3: Regional
  - Tier 4: Local
- These different ISPs are connected using Internet Exchange Points (IXPs)
  - There are different types of IXPs, with NAPs being one of them
  - NAPs act as a connection point between two ISPs to connect them and form the Internet
  - Routing information is exchanged between NAPs using BGP-4
- NAPs are switches that work on Layer 2
  - Typically use ATM switching
  - Support for ISO-provided routers
  - Typically connected using high-speed backbones

### Routers

- There are several types of router
  - Access Router
    - They connect on the edge of the internet, and provide a link between a LAN and WAN, typically being the Internet
  - Enterprise Router
    - Similar to access routers, but have much higher bandwidth and sometimes use leased lines to achieve higher QoS
  - Core Router
    - Able to handle very high bandwidth
    - Typically used in the core of a network, such as a central office of a multi-location company
- Routers optionally support Layer 2 switching
- They may include hardware or software routing capabilities
- Some routers are table-top, while others are rack-mountable
  - Typically only home routers are table-top, and most enterprise equipment is designed to be exclusively rack-mountable
- Most modern "routers" that we have in our homes are multifunction devices and include other embedded features. A typical home router may have many of the following device's built-in
  - A Modem
  - A Router
  - A small (4-5 port) network switch
  - A Wireless Access Point
  - A Firewall

### Multi-Protocol Label Switching (MPLS)

- "Route at the edges, switch at the core"
- Provides the best of both Layer 3 routing and Layer 2 switching
- Intended for use mostly in the core of the Internet or larger intranets
  - Useful for carriers, ISPs and enterprise WAN networks
  - An MPLS router in the core of the network is known as a label-switching router (LSR)
- Why use MPLS?
  - The specifications allow many different options for how to setup a connection
  - The first packet between two networks is routed, and then a Layer 2 switched connection is setup following that path, allowing for much lower latency for all subsequent packets
  - Said subsequent packets are handled exclusively on Layer 2, with their labels swapped at each LSR along the path
- Benefits
  - Traffic engineering capabilities
    - Paths can be explicitly set in advance if a lot of traffic needs to move between two connection points
  - MPLS-based VPNs can be set up with much simpler network provisioning and lower bandwidth overheads
  - Very good QoS
  - Vastly improved performance as compared to routing at every hop
  - Much more scalable
  - Shares many of the benefits of connection-oriented networking