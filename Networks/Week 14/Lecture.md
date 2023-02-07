# Networks - OL Lecture 9:00 07/02/23

## Interconnection Protocols

### Voice over Internet Protocol (VoIP)

- Originally, the motivations were to reduce the number of emails that need to be sent, and with VoIP phones you only need one network
- Current motivations are:
  - Reduction of cost
  - Single network
  - More capable than typical phones
  - Avoid delays
  - Provide good QoS
- Downsides are:
  - The quality of the connection may not be great, depending upon the gateway between IP phones and legacy networks
  - Wireless devices may drop connection temporarily when moving between access points

### Session Initiation Protocol (SIP)

- Application layer protocol
- Signalling protocol for real-time sessions
- Provides infrastructure for voice, video, instant messaging
- 5 Categories
  - User Location - Realtime local discovery
  - User Availability - Is the user available to communicate (online, engaged, etc)
  - User Capability - Choice of media and encoding
  - Session set-up - Establishing the session
  - Session management - Transferring sessions, modifying parameters
- SIP is "similar" to HTTP, as it's a request-response connection

### The Internet and Network Access Points (NAPs)

- The internet consists of many ISPs which operate on different levels:
  - Tier 1: International
  - Tier 2: National
  - Tier 3: Regional
  - Tier 4: Local
- Network Access Points (NAPs) are a type of Internet Exchange Point (IXP)
  - They connect between public ISPs to exchange traffic
  - Routing information is exchanged using BGP-4
- Selective peering may be done with direct links to other ISPs
- NAPs are layer 2 switches
  - Typically use ATM switching
  - Support for ISO-provided routers
- NAPs are connected by high-speed backbones

### Router Capabilities

- Routers may be of several types:
  - Access Routers - Edge of the internet
  - Enterprise Routers - Organisation networks
  - Core Routers - Handle heavy data flow
- Routers may also have Layer 2 switching
- May have hardware or software routing capabilities
- Routers may be table top or rack-mount
- Modern "Routers" may be embedded into other multi-feature devices, such as
  - Wireless Access Points
  - Small (e.g. 4 or 5 port) ethernet switch
  - Firewall

### Multi-Protocol Label Switching (MPLS)

- "Route at the edges, switch in the core"
- Provides the best parts of Layer 3 routing, and Layer 2 switching
- Intended for use in the core of the Internet or Intranets
  - Useful for carriers, ISPs and enterprise WAN networks
  - MPLS router in the core of the network is known as a label-switching router (LSR)
- Why use MPLS?
  - Specifications allow many options
  - The first packet between two networks is routed, so that the Layer 2 switched connection can be setup
  - Subsequent packets are handled at Layer 2, swapping the label at each LSR
- Benefits:
  - Traffic engineering capabilities (paths can be explicitly set without routing)
  - MPLS-based VPNs can be setup with simpler provisioning of network infrastructure and bandwidth
  - Good QoS
  - Improved performance as compared to routing at each hop
  - Much greater scalability
  - Also has many of the benefits of connection-oriented networking

### QoS with IP

- QoS usually refers to providing support for time-sensitive delivery, such as voice or compressed video
- Efforts include
  - Various forms of IP switching
  - Differentiation between services (e.g. prioritise VoIP or Video packets over emails or web browsing)
  - Multi-Protocol Label Switching (MPLS)