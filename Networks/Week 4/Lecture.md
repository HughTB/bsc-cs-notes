# Networks - Online Lecture 18/10/22

### Protocols (Continued)

- Rules for sending and receiving data across a network
- Provides addressing
- Management anf verification of transmission
- Often used in conjunction with other protocols, such as TCP and IP
  
### Connection orientated

- Similar to phoning someone on a landline
- 3 phases
 - Connection setup
 - Open connection
 - (Send data)
 - Close connection
- Quality of Service
 - High quality of service
 - Low fixed delay between sender and receiver
 - Limited packet loss
  
### Connectionless

- Similar to sending a letter in the post
- Each packet (letter) has an address attached before it is sent over the network (put in the post box)
- Once it is sent, you just have to assume that it was received
- Quality of Service
 - Variable delay between sender and receiver
 - Packets can and will be lost
 - Issues with packets arriving in the wrong order
  
### Packets

- A packet is a single unit of data that is sent across a network - The size of the packets is determined by the sender
- Data is broken down into packets before it is sent across the network
- Examples of data that is sent across the Internet using packets:
 - Emails - SMTP (Simple Mail Transfer Protocol) or POP3 (Post Office Protocol 3)
 - Files - FTP (File Transfer Protocol)
 - Web pages and images - HTTP (Hyper Text Transfer Protocol)
- Each packet also contains header information - This could be compared to the address written on the front of the envelope in the postal analogy
 - This includes the IP address of both the sender and receiver
 - It also includes information on how to handle transmission errors
 - Header information is used by routers and switches to determine where the packet should be sent next
- Routers are devices dedicated to reading header information and relaying packets to the next router
- Packets move from router to router until they reach their final destination - Similar to sorting offices in the postal analogy
- Each packet of a communication may not necessarily follow the same route to their destination
- The route is determined by the router, and which path is the fastest or least congested at the time, which can change between packets

### TCP/IP

- TCP/IP is a connectionless protocol, which is actually made up of 2 protocols, and is used almost everywhere on the internet
- TCP = Transmission Control Protocol
 - Breaks up the data into packets that are easier for the network to handle
 - Verifies that all of the packets arrive at the destination
 - Re-orders the packets into the correct sequence to get the data back out again
 - If any packets are damaged, TCP will request them to be resent
 - It also acknowledges that all of the packets have been received successfully
- IP = Internet Protocol
 - Breaks the data into packets
 - Adds the header information into each packet
 - Determines how much data should be put into each packet
  
For example, sending an email:
- The data that makes up the email message is split up into packets by the IP (Internet Protocol)
 - Header data is also added to each packet
- Using the header information in each packet, the routers and switches that make up the Internet determine the best path for each packet to take to their final destination
- TCP (Transmission Control Protocol) then reassembles the packets into the correct order and ensures that all packets were received undamaged, then extracts the email message data from the packets