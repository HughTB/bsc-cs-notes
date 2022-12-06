# Networks - OL Lecture 09:00 06/12/22

### Wide Area Networks (WAN)

- Unlimited distance (Interconnections provided by ISPs (Internet Service Providers))
- High speed
- Relatively expensive given the complex design
- Only the interface to the WAN and services hosted on it are of concern to the user (The actual design is irrelevant)
- "Value added" WANs add more uses for dedicated point-to-point links
- Transparent LAN Services (TLS) hide the complexities of the WAN from the network administrator

### Packet / Frame / Cell-Switched WAN links

- Individual units of data may be called - 
    - Packets
    - Frames
    - Cells
- The difference between the 3 is that Packets and Frames can be of variable length
    - This allows the network to be more efficient but requires more processing in software on either end
    - The speed of processing in software limits the speed of communication over the link
- Cells are of fixed length
    - 5 bytes of header data and 48 bytes of payload data
    - Because they are all the same length they can be processed in hardware, which is usually much faster
    - This allows for much higher data rates

### Switched and Permanent Virtual Circuits

- Some alternatives to packets, frames or cells can come in one of two forms:
    - Switched Virtual Circuits (SVC)
    - Permanent Virtual Circuits (PVC)
- SVC is like a dial-up connection
- PVC connections are always connected and leased out
- Not all WAN technologies support both SVCs and PVCs
    - X.25 Virtual Circuits (VCs) are usually SVCs
    - Frame Relay VCs are usually PVCs
    - ATM VCs can be either SVCs or PVCs
    - TLS is like a "best effort" service (whatever that means)

### Services provided by WANs

- Provide a route across the network, between the source and destination
- Divide and reassemble data as required to be sent across the network
- Limit the network traffic to a level that can be effectively handled (congestion control)

### X.25 Interface

- X.25 is a WAN interface ITU-T (International Telecommunication Union Telecommunication Standardization Sector (???)) standard
- Connected to a public packet-switching network
- Covers the physical, data-link and network layers from the OSI reference model
- Last used over "the WAN" in 2015 by financial and debit/credit card companies
- Still used in the Aviation industry

### Frame Relay

- Connection-oriented, public switched service
- A Layer 2 protocol defined in 1984 by the ITU-T and ANSI
- A much higher performance alternative to X.25
    - Needed for high-performance applications, such as graphics and image transfers
    - Very useful for LAN-to-LAN communications which need high throughput
- It provides higher throughput by using
    - Larger frame sizes (1500+ bytes)
    - Higher interface data rates
    - Reduced processing requirements
- A variation of High-Level Data Link Control (HDLC)
    - Detects and discards frames with errors, and does not retransmit them
    - You must use another protocol on top of Frame Relay, e.g. TCP
- Builds on the fibre-optic network
- A good alternative to E and T carriers
- Supports two levels of traffic
    - Committed Information Rate (CIR)
        - Traffic up to this rate will be accepted, anything above will be rejected
    - Excess Information Rate (EIR)
        - Traffic between the CIR and EIR can still be sent but will be marked as "Eligible for Discard", so they can be discarded if congestion is too great
- It conveys congestion information, which can be controlled by users
- Advantages:
    - International protocol
    - Available in many (but not all) countries
    - Available from all major vendors
    - Takes advantage of modern fibre-optic infrastructure
    - Good LAN-to-LAN support
    - T and E carrier throughput capabilities
    - Less expensive than fully meshed E1/T1 lines for bursty traffic
- Disadvantages:
    - Poor support for SVCs
    - Does not provide any built-in fault tolerance, other protocols such as TCP are needed for error handling
    - Not suitable for latency-sensitive data such as real-time audio or video conferencing
    - Data overhead and processing overhead for every packet sent
    - More expensive compared to internet service

|Issue| X.25 |Frame Relay|
|-----|------|-----------|
|Development Date|Mid 70s-Early 80s|Late 80s-Mid 90s|
|Underlying Infrastructure|Low data rate, error prone copper circuits|High-speed, highly reliable fibre-optics|
|Original Design Objectives|Support terminal to host|Support LAN-to-LAN|
|Design Approach|3 layers of the OSI model (Network, Data link, Physical)|2 layers (Data link, Physical)|
|Typical Data Rate|9.6-64 kbps|Fractional or full T1/E1|
|Error Recovery|Error detection and transmission|Error detection with discard, no recovery other than when using TCP|
|Max Packet/Frame Size|128-4096 bytes|1500 bytes (Full ethernet frame)|
|Processing per Packet/Frame|Two dozen processing steps|Half-dozen processing steps|
|Availability|Worldwide|Only in countries with fibre infrastructure|
|Applications|Good for terminal-to-host but not for LAN-to-LAN, used for credit/debit card verification|Good for LAN-to-LAN, could be used for credit/debit card verification|