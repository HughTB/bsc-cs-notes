# Networks - OL Lecture 09:00 14/03/23

## Application Support Protocols

### TCP or UDP

- User Datagram Protocol
  - No guarantees of delivery
  - Acts as an interface to IP-Level for the Application layer
  - Just sends data directly, without checking if the receiver actually exists or that a path exists
  - Packets that are lost are just lost
  - There is no checking of dropped, corrupted or incorrectly ordered packets
  - As it's unreliable, there are only a few applications that it should be used for, e.g. voice or video streaming
    - Low delay is essential in these applications
    - The lost data is most likely irrelevant, so does not need to be re-requested
- Transmission Control Protocol
  - Reliable data transmission
  - Performs integrity checking, retransmission of dropped packets, reordering of packets, etc
  - Connection oriented - a connection must be established before data can be sent to verify that a path exists and that the receiver is willing to receive the data
  - The connections are setup as a virtual channel between the sender and receiver
  - The 3-way handshake is made before the connection is established
  - TCP should be used almost anywhere else, such as file transfers, webpages, email, etc
    - Delay is not as sensitive
    - Any data that may be lost needs to be recovered, otherwise the data would become corrupted and useless

### TCP or UDP Multiplexing

- Since multiple applications on a computer may be using TCP or UDP at once, there must be a way of differentiating the incoming transmissions
- This is done using **ports** which are like a virtual connection to the computer
- Each device has 65535 ports
- Each application uses it's own port, and some have their own specific port, such as HTTP which uses port 80, HTTPS on 443 or SSH on 21
- The incoming packets enter the transport layer, where they are split up and sent into the application layer of the application using that port

### Layer 6 - Presentation

- This layer interprets the data before the application receives it
- Where the Secure Sockets Layer (SSL) resides
- Not always used in protocols
- Data abstraction
  - All protocols have their own format for the data they're sending
  - The application does not need to see this data directly, just what is encoded in that data
  - This could be something such as translating between different character sets, e.g. between ASCII and UTF-8

### Secure Sockets Layer (SSL)

- A socket is a method of making connections
- You can open a socket to connect to a remote host, or you can open a local socket to listen to a port on the computer
- SSL
  - Provides end-to-end encryption
  - Provides the same abstraction as other protocols and can usually be used as a slot-in replacement for traditional sockets
- When is SSL used?
  - Almost any time that secure transmission is needed
  - HTTPS (Banking websites, most websites at this point... 2006 powerpoint smh)
  - SFTP (Secure File Transfer Protocol)
  - SSL Email (More secure emails)

### Layer 7 - Application

- Client - Server model
  - The server is usually a more powerful computer which responds to many clients at the same time
  - This is good as it reduces the number of machines needed, but it reduces the resilience of the application as there is a single point of failure
- Peer-to-Peer
  - Each peer acts as both a client and server
  - Broadcast searches for services
  - Each peer has a smaller internet connection, so multiple peers are used at the same time to increase speeds
  - Disadvantage of this is that other people are responsible for hosting the data, and could modify the data

### Domain Name System

- A register of which Domain Names point to which IP addresses
  - e.g. `google.com` is currently linked to `142.250.187.206`
- There are multiple layers in a DNS, starting at the root server for the TLD of the domain
- DNS typically uses port 53
- Uses UDP for queries and TCP for transfers
- There are multiple types of records
  - A record (Maps subdomain to an IPv4 address)
  - AAAA record (Maps a subdomain to an IPv6 address)
  - MX record (Maps to the IP address of a mail server)
  - PTR records (Reverse lookups)