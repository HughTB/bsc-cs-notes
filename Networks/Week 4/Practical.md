# Networks - Practical 19/10/22

- In a packet, the information used to help deliver the packet is known as the header, and the actual data is known as the payload
- IP or Internet Protocol is responsible for addressing all devices on the internet, so that all other protocols know where the data needs to be sent
  
### TCP

- 3 way hand shake
 - This is established before any packets of data are sent across the network
 - SYN is sent by the sender to receiver to request a connection
 - If the connection is to be accepted, the receiver sends SYN/ACK to confirm the connection
 - The sender then sends ACK to the receiver, to acknowledge the connection
 - Data is then sent across the connection - this may be either one small message or a large message broken down into smaller packets
 - When the payload has been sent, the last sent packet will have the "FIN" bit set to 1, meaning that it is the final packet, and the connection can be closed
 - After each packet is received, the receiver sends back an ACK message to confirm that the packet was received intact. If the ACK message is not received by the sender, it will resend any packets that it did not receive an ACK message for
 - Once all of the packets are received intact, and a packet with the FIN bit set to 1, the connection is closed

### UDP

- UDP (User Datagram Protocol) is another protocol commonly used on the internet
- There is no guarantee that the data has been received correctly
- No connection is established
- There is no handshake between sender and receiver
- There is no acknowledgement of received packets
- No error checking, sequencing or flow control
- It is faster and more efficient than TCP, but can not be used for all types of data. It is commonly used for streaming video over the internet as it does not matter if some packets are lost or received in the incorrect order, as this will result in dropped or frozen frames, but will not cause any issues such as corrupted data