# Networks - Online Lecture 11/10/22

### Network Protocols

Protocols are the rules for communication  
- They define the rules that are used to communicate between devices, applications or components of an application 
  
What if conditions  
- Networks protocols define the behavior for a "what if" condition
 - e.g. missing packets, bit flips, receiver dropping packets due to limited processing power, etc
- This behavior could be anything from ignoring it and continuing, or resending the entire message, depending upon the protocol
  
### An example: (You can safely ignore this, she just talked about it without any context)

- Consider the problems that early telegraph operators would have faced
- 2 train stations have a telegraph line between them
- There are 10 telegraphs to send in the morning
  
The first problem  
- Should you just send a random telegram at any time?
- Should you send the shortest telegram first, or send them in a specific order?
- What if there's no one at the other end? Should there be a special "are you there" message before the actual telegram?
  
The second problem
- Should you send the telegrams immediately after each other?
- Should you receive an acknowledgement from the other end after each?
- Should there be a break between telegrams?
  
The third problem
- What if A is sending faster than B can receive?
- What if B has to stop receiving telegrams to do something else?
- What if you finish your shift but there are still telegrams to be sent or received?
- What if both A and B send at the same time?
  
- These are all problems that are faced in a modern network, and are the reason that standardised protocols (Apple pls) are so important

### Connection-oriented protocols

- TCP is an example of a connection-oriented protocol
- A connection-oriented protocol is any protocol where there is a "private network" that directly links the sender and receiver
 - They work similarly to a phone call as there is a ***"virtual cable"*** directly connecting between the sender and receiver
 - Connection established
 - Data sent between devices
 - Connection closed
  
Then she rambled on about postal delivery for no apparent reason

### Connectionless protocol

- Less assurance that the message got to the receiver
- No connection established and therefore no disconnection
- IP is an example of a connectionless protocol
  
Tradeoffs of connectionless vs connection-oriented protocols:
- Connectionless protocols don't need to establish or clear a connection
- Packets in connectionless protocols are more wasteful of bandwidth, as they need to have additional addressing information in the metadata of **every packet**, which adds up quickly, whereas a connection-oriented protocol only needs the virtual cable id added to each message
- Packets can be easily discarded if the network is too busy, whereas a virtual cable must be carefully managed
  
Why do we need TCP/IP
- If we just sent out packets without the protocol, they would just get lost on the network
- For example, if we wanted to send a packet across the internet between LANs, each router along the "journey" would read the desired IP address from the packet and relay the packet to the next router, getting closer to the receiver with each hop
- IP addressing is needed to route the packets across the internet
- TCP is needed to assure that the packets are all received, uncorrupted and in the correct order to ensure that all of the data is correct
- Every message sent across the internet uses at least these two protocols (TCP & IP) but usually also use other protocols within the message itself so the receiver knows how to interpret the message, for example an email may use SMTP or POP as well as TCP/IP