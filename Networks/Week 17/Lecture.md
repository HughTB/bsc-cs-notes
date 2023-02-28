# Networks - OL Lecture 09:00 28/02/23

### Motivations for Network Management

- Computer networks have become mission critical for many businesses
- Network downtime causes problems for communication and individual work

### Goals for Network Management

- Responsive network management is needed, for example
  - Help desk
  - Network support technicians
  - Network system management
    - Monitor the network
    - Have the ability to diagnose and control the network

### Network Systems Management

- Monitors the network
- Displays the current status of the network, often using a "traffic light" system
  - Red = Active outage
  - Amber = Problems that may cause an outage
  - Green = No problems detected
- Provides notifications as problems arise

### TCP/IP Network Management

- Network management involves 3 distinct needs
  - A protocol for creating network management data, such as event reports
  - A database of information, that contains data about queue length, throughput, etc over time
  - A computer that is able to run independently of the network so that if the network goes down, the data is not compromised
- These needs are met by
  - SNMP - Simple Network Management Protocols
    - Read/Write between network management devices and network client devices
  - MIB - Management Information Bases
    - The database of information pertaining to the network
  - SMI - Structure of Management Information
    - Device independent notation of device information

### Simple Network Management Protocol (SNMP)

- The manager needs to be able to monitor and control the devices on the network
- It needs to be able to
  - Read the value of parameters (SNMP Get)
  - Read sequences of table entries (SNMP Get_Next)
  - Write into parameter values (SNMP Set)
  - Receive unsolicited event reports (SNMP Trap)

### Remote MONitor (RMON)

- SNMP Management Information Bases (MIB) include remote monitoring capabilities
- RMON can be implemented in different ways
  - As an independent probe device attached to each LAN segment
  - Integrated into network devices, such as switches or routers
- RMON is available in two forms
  - RMON 1 monitors OSI layers 1 and 2, collecting collision and error statistics
  - RMON 2 monitors higher levels of the OSI model, collecting information about application traffic
- Can be cost effective, and control network traffic
- Increases the effectiveness of network management personnel, as they can remotely diagnose and fix issues

### Network Management Areas

- The OSI identifies five areas on network management
  - Configuration
  - Fault management
  - Performance management
  - Accounting management
  - Security management

### Configuration

- A wide range of issues can fall under configuration issues
  - Faulty IP address assignment
  - Hardware or Software updates to switches, routers, etc
  - Software license control
- There are several parameters that fall under configuration
  - Configure switches and routers to filter out certain traffic
  - Multi-protocol routers can be configured to run selected protocols
  - Configuration of bit rate, parity, etc

### Fault Management

- Provides identification and isolation of detected faults
- Tools and techniques include
  - Bit-Error Rate Tests (BERT)
  - Time Domain Reflectometer (TDR)
  - Optical TDR (OTDR)
  - Protocol Analyser (for data links and LANs)
  - Loopback Tests
  - Ping Tests
  - Artificial Traffic Generation (Usually done out-of-hours to avoid creating further issues for the network)

### Fault Isolation (LANs)

- Limiting faults is possible by isolating the fault using switches and router configuration
- All traffic across the LAN can be monitored
- All exceptional conditions can be detected, e.g. collisions, viruses infecting computers across the network, etc
- Devices called LAN analysers or LAN protocol analysers can be attached to the network
  - These devices record selective information about packets that may be of interest
  - May be set up to filter based on address, protocol, or other fields of interest

### Performance Management

- Network Performance Management
  - Concerned mainly with statistical data
  - Round trip delays
  - Throughput
- May require prioritisation of traffic
  - May include QoS capabilities
- Tuning of performance (eliminating bottlenecks)
  - Buffer size adjustment
  - Setting timer values
- Establish a baseline
  - Set a minimum level of performance that is needed for the business
- Performance management also involves finding bottlenecks
  - WAN links between remote switches and routers
  - Access to server resources, e.g. storage
  - Parts of the network which are near or at capacity
- Many fault-management tools are useful for performance management

### Accounting Management

- Can be the billing for network usage
- Accounting Parameters usually include
  - Number of connections made
  - Duration of each connection
  - Number of email packets sent and received
  - Number of packets generally sent and received
  - Systems that are accessed across the network
  - Internet usage
- Accounting management may be broadened to include other network attached resources
  - Server usage (connection times and storage used)
  - Traffic using expensive dedicated WAN circuits
  - Data storage
- Accounting management may also be used to cap the use of network resources or storage space

### Security Management

- Confidentiality
- Integrity
- Authentication
- Access Control
- Nonrepudiation
- Vulnerabilities
  - Wiretaps placed on cables
  - Third parties intercepting remote logins
  - Viruses and other Malware
- Protection Mechanisms Include
  - Encryption
  - Physical Access Control
  - Access-Control lists
  - Audit Data Collection