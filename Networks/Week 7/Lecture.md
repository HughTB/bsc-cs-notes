# Networks - Lecture 9:00 15/11/22

### The OSI reference model

- Development of the OSI model started in 1977, with a draft published in 1979 and finalised in 1984 as an international standard
- OSI stands for Open Systems Interconnection
- The OSI model provides common terminology as well as a framework for networking
- The standard is still used today, and is the standard model for inter-computer communication
- It describes how data is sent from an application, through a network medium, and into another application, on a different computer or network
- This data transmission is split into the 7 layers of the OSI model
- Each layer has a specific function that it performs before sending the data to the next layer
- The upper 3 layers provide services to the application, while the lower 4 deal with the actual transmission from one device to another
- There are 7 layers on the way down, and 7 on the way up
  
|Layer|Name|Purpose|
|-----|----|-------|
|7|Application Layer|Provides support for email, file transfer and other protocols|
|6|Presentation Layer|Ensures that the data is in the correct format, and is where any encryption will occur|
|5|Session Layer|Maintains the connection and controls ports and sessions|
|4|Transport Layer|Transmits data using TCP and / or UDP|
|3|Network Layer|Provides IP addressing, routing and segmentation|
|2|Data link Layer|Defines how the data is formatted when it is sent over the network|
|1|Physical Layer|Adapts the data to be sent over the medium (Fibre transceivers, etc)|
  
### Layers in more detail

- Layer 1 - Physical Link
    - Deals with the physical communication over the medium
    - It defines the specification of communication between the physical link on the sender and receiver
    - Defines characteristics such as 
        - Voltage levels
        - Timing of voltage changes
        - Physical data rates
        - Maximum transmission distance
        - Physical connectors (e.g. RJ45, TIA-232 aka RS-232)
- Layer 2 - Data Link
    - Deals with transmission across the medium
    - Provides the location of the intended destination on the network
    - Can provide reliable transmission using MAC (Media Access Control) addresses
    - Uses MAC addresses to differentiate between the different nodes connected to the same physical medium
    - This layer deals with network topology and access, error handling, ordered delivery of frames, and flow control
    - Standardised protocols such as Ethernet, Frame Relay and FDDI
- Layer 3 - Network
    - Defines the logical addressing
    - Sets how routing works and how routes are learned or discovered so that packets can be delivered
    - Also defines how packets could be split into smaller packets to be delivered more efficiently on different media
    - Routers operate on this layer
- Layer 4 - Transport
    - Regulates the flow of data to ensure end-to-end connectivity
    - Segments the data into packets on the sending host, and reassembles them on the receiving host
    - Protocols on this layer include TCP and UDP
- Layer 5 - Session
    - Defines how to start, control and end connections (or sessions) between applications
    - Uses "dialogue control" for management of bi-directional communication
    - Synchronises dialogue between the presentation layers and manages their data exchange
    - Allows for efficient data transfer
- Layer 6 - Presentation
    - Ensures that the data sent by the application is readable by the application layer on the receiving device
    - Translates between different data formats using a common format
    - Provides encryption and compression of data
- Layer 7 - Application
    - This layer is closest to the user
    - Provides network services to the user's applications
    - **Does not** provide services to any other OSI layer, only to applications
    - Checks if the receiver is available to receive data
    - Synchronises and agrees upon procedures or protocols for error handling and control of data integrity

### Connection and connectionless transport
- Connection-oriented transport such as TCP is used when the data needs to arrive intact and in the right order
- Connectionless transport such as UDP is used when the application is capable of data integrity control
    - They can do this by repeating the request after a timeout
    - This can sometimes cause duplicate operations if the response was delayed or just not received
    - Common uses for UDP are Broadcasting and real-time VoIP applications

### The importance of standards
- The use of open standards is fundamental to Open Systems
- Needed to maintain interoperability between devices made by different vendors
- Standards should be internationally recognised
- It's important to track new standards in order to know when it is "safe" to use a new standard
- However, the creation of standards can take many years, and by the time the standards are released, the device that would've used it would be obsolete
- 'Fast tracking' can be used to develop the devices and standards in parallel
- When using fast tracking, vendors often end up releasing products before the standards are released

### Important standards organisations
- ISO - International Standardisation Organisation
- ETSI - European Telecommunications Standards Institute
- IETF - The TCP/IP Internet Engineering task force
- IEEE - Institute of Electrical and Electronics Engineers
- ANSI - American National Standards Institute