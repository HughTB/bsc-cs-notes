# Networks - OL Lecture 09:00 31/01/23

### Asynchronous Transfer Mode (ATM)

- Telecommunications standard defined by ANSI and ITU-T
- ATM is a data link layer
- Used in WANs
- Supports the transfer of data using a wide range of QoS assurance methods
- Core protocol used in SONET & SDH
- A form of "cell relay"
- Relatively large packets which are segmented into 48-octet chunks for transmission (with 5-octet headers)
- These packets are switched across the network and than reassembled at the destination
- There is an unpredictable amount of time between the arrival of packets
- The cells are multiplexed with others when transmitted through the system
- Designed to provide virtual circuits across highly reliable media
- Optimised for the connectionless style of IP

### Traffic Engineering / QoS

- QoS can be configured for every ATM interface
  - Constant Bit Rate (CBR)
    - Can transmit at a Peak Cell Rate (PCR) for a maximum interval before it becomes problematic and throttles back to the CBR
  - Variable Bit Rate (VBR)
    - Can transmit at a Peak Cell Rate (PCR) for a certain time until it has to drop back to the Sustainable Cell Rate (SCR)
  - Available Bit Rate (ABR)
    - A minimum bit rate is guaranteed
  - Unspecified Bit Rate (UBR)
    - Traffic is allocated until the maximum bitrate is reached, any further cells have to find another route or wait for bandwidth

### Uses of ATM

- ATM is usually limited to the backbone of Wide Area Networks as it is not cost effective to run to edge nodes (e.g. homes or businesses)
- Since it has built in support for voice and video data, it is good for high-speed backbones
- It's QoS is very good, making it a good choice for high-speed backbones

### Advantages

- Meets international and industry standards
- In use in most high-speed WANs
- Has built in support for voice and video, providing good QoS for these uses
- Cost competitive in the core of the network

### Disadvantages

- Complex operation and configuration
- Somewhat inefficient (roughly 10% overhead due to header data)
- Not cost competitive to the edges of networks

### Transparent LAN Services (TLS)

- Transparent meaning that you don't have to deal with it manually
  - No need to worry about the WAN
  - No provision needed for frame relays, ATM, leased lines, etc
- TLS bridges geographically separated LANs
  - This makes them appear as one big LAN
  - Decreases the need to manage WANs
- Often use ATM circuits
- Supplies ATM access to Ethernet circuits
  - Often known as "Metro Ethernet" or "Ethernet Transport"
  - Available at all Ethernet data rates

### Overview of Wired WAN Technologies

|OSI Layer 1|Dial-Up Over PSTN|ISDN|DSL|Cable Broadband|T/E-Carrier|SONET/SDH|
|-|-|-|-|-|-|-|
|OSI Layer 2|PPP|PPP or Frame Relay|PPP, Ethernet or ATM|Cable Broadband, Ethernet|PPP, Frame Relay or ATM|PPP, Frame Relay, ATM, MPLS|
|Media|Copper|Copper|Copper or Fibre|Copper and Fibre|Copper or Fibre|Fibre|

- PPP = Point-to-Point Protocol
- MPLS = Multiprotocol Label Switching