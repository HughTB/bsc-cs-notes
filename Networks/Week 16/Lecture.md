# Networks - OL Lecture 09:00 21/02/23

## Network Security

### Security Problems

- Remote attacks
- Software developed with "back doors"
- Insecure configuration
- Internal attacks (Disgruntled employees)
- Access control
- Connecting compromised personal devices to secure networks

### Security Management

- Control and Distribution
  - Control who can and cannot access files
  - Control where files can be downloaded to (e.g. not personal devices or storage)
- Event Logging
- Monitoring
- Parameter Management

### Security Services

- Denial of Service prevention
  - Have a device outside of the network that is capable of absorbing the traffic of a DoS attack
- Access Control
- User Authentication
  - Multi-Factor
  - 2FA
- Data Confidentiality
- Accountability

### Security Mechanisms

- Encryption and Decryption
- Message Authentication
- Password Policy
- Digital Signatures
- Access Control

### Secure Communications over Insecure Networks

- Use encryption to ensure that even if a man-in-the-middle attack takes place, the message remains unreadable for the attacker
- Asymmetric encryption is less secure than symmetric encryption, but it is usually necessary to use both for better security
- One issue with this is that it's impossible to determine who sent the encrypted message(s), so another method of security must be used to certify authenticity
- To do this, we can combine cryptography and digital signatures to ensure that the message is from a trusted source, and that no one else is able to read the message

### Secure Sockets Layer / Transport Layer Security (SSL / TLS)

- These protocols are used when communicating securely using HTTPS
- The encryption key may be anywhere from 40 to 128 bits
  - 40 bit keys are obviously less secure than 128 bit keys, but both are susceptible to issues with key generations, such as poor Random Number Generation on specific platforms
  - 256 bit keys can be used for applications needing higher security, but this is not a standard feature
- Trusted certificates contain the owner's public key and is cryptographically signed by a trusted certificate agency
- Types of Encryption
  - The Data Encryption Standard (DES) dates all the way back to the 70s, and uses a 56-bit key, which could be broken in a matter of hours on a modern computer
  - Triple DES has a much longer effective key length but is still inadequate for our current needs
  - The more recent Advanced Encryption Standard (AES) is much more secure, as it uses keys between 128 and 256 bits and a specifically designed algorithm

### Virtual Private Networks (VPNs)

- A private network that uses a public network (usually the Internet) to connect remote sites or users together
- Rather than using dedicated or rented physical lines, it uses a virtual connection
- While it is often touted that they're secure, the security is not inherent to the VPN's operation
  - VPNs may use encryption to send all traffic, but this is not a given
  - The encrypted packets are sent in "Routable IP Packets"
- An outsider may be able to intercept packets in-flight, but if they're encrypted it is practically impossible for them to read or modify the packets
- VPNs give no QoS assurance, and so packets are delivered on a best-effort basis

### Remote Authentication Dial-In User Service (RADIUS)

- Provides Authentication, Authorisation Checking and Accounting
- Uses a Point-to-Point protocol
- Operates on port 1812
- Commonly used to facilitate roaming
- Authentication and Authorisation Flow
  - Client sends Access-Request to the Server
  - Server responds with one of the following, depending upon if the user is authorised
    - Access-Accept
    - Access-Reject
    - Access-Challenge

### Uncontrolled Connections to the Internet

- It is very easy to connect to the Internet
  - All you need is a router and approval
- However, this is often not a good idea as it would make it very easy to steal data sent over the Internet
- There are dangers present if uncontrolled connections to the Internet are allowed
- There are a few ways of preventing this, but the most common one is Firewalls

### Firewalls

- Routers which connect to the Internet typically have a firewall
- Firewalls filter out requests which are unwanted
- This may consist of adult content filters, or might filter what can be connected on the network, e.g. preventing VPN connections
- There can also be firewalls on individual devices
- These are known as Host-Based firewalls, and are useful for devices exposed to the Internet, as it allows them to block unwanted connections
- Host-Based firewalls are typically more secure, but are more expensive to setup and maintain
- Dedicated Firewall devices may have other functions such as
  - Intrusion Detection (Signature verification, etc)
  - Network Address Translation (NAT)
  - URL and Content filtering

### Common Criteria Evaluation Assurance Levels (EAL)

- An internationally recognised method of comparing security of different network-enabled devices
- These levels range from 1 to 7
- EAL 2 is the minimum level to be accepted
- EAL 4 is the highest attainable level for a retrofitted product
- EALs 5-7 are extremely expensive to obtain and are typically limited to applications such as Governments, Militaries and Healthcare