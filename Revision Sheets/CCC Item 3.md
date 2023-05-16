# CCC Item 3 (Security) Revision Sheet

## Useful Definitions

- Asset
  - Any object or data that has potential value if it were stolen, e.g. personal information, trade secrets, customer information, etc
  - Any object or data which could cause downtime were it to be lost or destroyed
- Threat
  - Any potential cause of an incident that may result in damage to an asset
  - This could be accidental or malicious
- Vulnerability
  - Weakness in an asset or group thereof which be exploited by one or more threats
- Impact
  - The resulting downtime, financial penalties, etc of an incident caused by a threat
- Risk
  - The potential of a vulnerability to be exploited, and the scale of the impact it would cause on the organisation
- Policy
  - A rule or set thereof to guide decisions and get the intended outcome
- Standards
  - Specific details of what must be done to comply with a policy
- Guidelines
  - A set of recommended actions to assist in complying with a policy
- Procedure
  - A list of instructions for performing an action or completing a task

### Primary Assets

### Information

- Any information could be considered business critical, as long as it is required for the operation of the company
- Some information has additional rules and regulations surrounding its storage and processing, such as customer information in the EU which falls under GDPR. Such information needs to be protected in a specific way, and violating the regulations could result in large legal or financial repercussions
- Information could be strategically important, such as a secret process for creating a product more efficiently than other companies, but not necessary for the company to function. In this case, it would be preferable to keep the information secure, but if it is leaked it serves only to give competitors an advantage
- Some information has higher costs associated with it than other information, for example, if it takes a long time or higher cost to gather in the first place, or has very specific storage requirements

### Business Processes

- A business process contains secret processes or proprietary technology
- Typically they can greatly affect the efficiency or speed at which tasks could be completed if they were lost or modified
- Some contracts, especially ones with governments, have special processes which are required to comply with regulations
- Processes are often overlooked as being primary assets, as they are often forgotten about until a member of staff is missing for any reason, and no one else knows the correct process

### Secondary Assets

### Hardware

- The physical devices which store software or information
- This can vary anywhere from a phone or laptop to a multi-million server
- If physical access to the device is possible, it may be incredibly easy to steal or delete data from it
- Traditional security such as locks and keys can be used to restrict physical access to devices

### Software

- Typically the most difficult asset to secure
- Most software is rushed through development, leading to many vulnerabilities which were not found during the development process
- Security is often an afterthought, meaning that the design and structure of the software are inherently insecure
- This is especially an issue with proprietary software as only the developers can look through the source code to find issues

### Networks

- Anything connected to a network is at much higher risk of attacks than a completely offline device
- The perimeter of the network is very important to protect, as this is where the majority of attacks will come from
  - Firewalls should be used to prevent malicious content from reaching the internal network
  - These can be either physical devices connected to the router, or software installed on all devices. Physical devices are preferred as they protect everything on the network, including IoT devices which are often insecure
- The internal network should also be protected, using measures such as MAC address filtering and newer versions of WPA to prevent unauthorised access to the network
- Additionally, very important assets should be either on a separate network, or a separate VLAN

### Personnel

- Can be very difficult to "secure"
- Can be easily manipulated to perform an attack on behalf of a malicious party

## Information Security Governance

### Enforcing Policies

- Education
  - Some roles which require access to classified information may require employees to hold information security qualifications or certifications
- Training
  - **Everyone** in an organisation should be trained on and made aware of information security
  - Training should be hands-on and include detailed information and guidelines to prepare them for handling secure information
  - Special training should be implemented where possible, otherwise outsourced to a trusted training provider
- Awareness
  - Make sure that information security is always a concern for staff
  - This can be as simple as putting up posters around offices, or sending out newsletters company-wide

### NCSC Guidance

- Identify individuals at all levels of the company who are responsible for making security decisions, ensure that they are trained to do so and give them explicit permission
- Ensure that all individuals are held responsible for their actions
- Ensure feedback is given to decision-makers about the impact their choices have made

## Access Control

- Identity
  - The properties of an individual or object which can uniquely identify said individual or object
- Authentication
  - Ensuring that the individual or object is who or what they claim to be
- Authorisation
  - Checking the authentication of an individual or resource to establish what they are allowed to access and what they are not
- Supplicant
  - The individual or object being authenticated or authorised
- Accounting
  - Ensuring that the activities of each user can be traced back to them
- Audit
  - Formal or informal review of processes, policies and procedures
- Compliance
  - Working per the processes, policies and procedures that have been set out, often with independent reviews

### Issues with Passwords

- Poorly chosen passwords, e.g. too short, use real words or contain personal information
- Often written down on paper or in unsecured text documents
- Infrequently or never changed
- Users often have only one or a few passwords which they reuse for many systems
- Passwords may be shared if users are pressured or confused by phishing
- When attempting to secure password-based access systems, it is possible to cause unwanted availability issues
  - For example, if a user is locked out after 3 incorrect attempts, an attacker could intentionally spam the system with incorrect passwords, locking out one or multiple users

### NCSC Password Guidance

1. Reduce your organisation's reliance on passwords
2. Implement technical solutions (for example, use rate-limiting or throttling rather than outright locking users out of systems)
3. Protect all passwords
4. Help users cope with the number of passwords they need, e.g. by using a password manager
5. Help users create more secure passwords, e.g. by using a password manager
6. Use training to support the other 5 points

## Access Control - Authentication

- There are 3 different authentication factors which can be used
  - Something the supplicant knows, e.g.
    - Password
    - Code
  - Something the supplicant has, e.g.
    - Keycard
    - Phone
    - Yubikey
  - Something the supplicant is (biometrics), e.g.
    - Fingerprint
    - Retinal scan
- For any secure system, multiple authentication factors should be used
  - Each of these factors must be of a different type
    - For example, a password and one-time code from a phone app would be MFA
    - However, a keycard and one-time code would not be multiple factors of authentication

### Biometric System Requirements

- Any biometric system should meet all of the following requirements
- Universality
  - Everyone should possess the trait that is used for authentication
- Distinctiveness
  - The trait should uniquely identify every individual
- Persistence
  - The trait should not change over time
- Collectability
  - The trait should be easily and unobtrusively measurable or scannable
- Performance
  - Regardless of the situation and available resources, the scanner must be highly accurate and fast
- Acceptability
  - The trait should be widely accepted and harmless
- Circumvention
  - The trait should be hard or impossible to "spoof" or defraud

### Biometric System Effectiveness

- False Reject Rate (FRR)
  - Percentage of instances where authorised users are denied access by mistake, e.g. due to a misread fingerprint
  - Type I error
- False Accept Rate (FAR)
  - Percentage or instances where unauthorised users are allowed access by mistake
  - Type II error
- Crossover Error Rate (CER)
  - The level at which the FRR and FAR are equal
  - This is theoretically the ideal sensitivity for a standard biometric scanner as it minimises false rejections without increasing false acceptances to an unacceptable level
  - In higher security applications it may be desirable to decrease the FAR, irrespective of the FRR

## Access Control - Authorisation

### Privileged Access

- System and Application Administrators
- So-called "sysadmins" can
  - Create and enrol new users
  - Modify, grant or remove users' access rights
- Since these users have much greater access and control of systems than regular users, their accounts should be much more secure and monitored more closely

### File System Permissions

- Read
- Write
- Execute
- Each user has zero or more of these permissions for each file and folder on a systems

### Security Policies

- There are many different security policies, but they all determine the level of access that each user should have to the resources on a system
- Discretionary Access Control (DAC) controls users' access based on their identity
  - Other users' access is determined by the owner of the resource
  - Often illustrated using an "access matrix"
  - The permissions of a single resource can be displayed using an Access Control List (ACL), which is essentially a single column of the access matrix
  - Alternatively, a Capability List (CL or C-List) could be used, which stores each user's ability to access files
- Mandatory Access Control (MAC) controls users' access based on security labels
  - Less freedom of control for specific users
  - Rules define how subjects can behave
  - Uses sensitivity or security labels
  - The most common model is the Bell LaPudula (BLP) model, where any user can read files on or below their level, but only write to files on their level (No read-up, no write-down)
  - The opposite of this model is known as the Biba Integrity model (No write-up, no read-down)
- Role-Based Access Control (RBAC) controls users' access based on their role
  - Newer than DAC and MAC
  - Can be centrally administered
  - Assigns permissions based on the role(s) assigned to them
  - Users who need similar permissions or need to perform similar functions are grouped into roles
  - Useful for companies with high employee turnover rates
  - Each user can have many roles, and each role can be assigned to many users
  - Each role can have multiple permissions, as long as they do not conflict
- Attribute-Based Access Control (ABAC) controls users' access based on attributes
  - Generalises access control based on the role attribute of users, as well as other attributes of the user or resource
  - An authorisation engine is used to determine if access should be granted
  - This can be used to allow time-based access control, for example, for contractors who only need access for the duration of their contract

## Cryptography

- Cryptography is a way of turning plaintext into ciphertext
- Plaintext
  - The message that needs to be sent
- Ciphertext
  - The actual message that is sent, can be turned back into the plaintext, theoretically only by people who know the key and algorithm used
- Encrypting or enciphering a piece of data links the four following elements together, and if all 4 elements are known, the resulting ciphertext can be decrypted
  - The plaintext, m
  - The ciphertext, c
  - The key, k
  - The algorithm, E

### Cryptographic Algorithms

- There are two types of algorithms and a countless number of algorithms, but all of them follow the following general rules
  - Large enough key space (number of possible keys) to resist brute-force attacks
  - Resistance to frequency analysis
  - A small change in plaintext results in a large change in the ciphertext
  - Security depends only on the secrecy of the key, and not of the algorithm (known as Kerckhoff's Principle)
- The two types of algorithms are Symmetric and Asymmetric

### Symmetric Cryptography

- The same key is used to encrypt and decrypt the message
- This means that if either copy of the key is compromised, messages can be both encrypted and decrypted by a third party
- It also means that both the sender and receiver must have the key
- While more secure than asymmetric cryptography, there are some downsides to consider
  - The main issue is key distribution and the number of keys needed for multi-party communication
  - If we have `n` parties who need to communicate, we need `n * (n - 1) / 2` keys
    - When n = 2, we need 1 key
    - When n = 5, we need 10 keys
    
### Asymmetric Cryptography

- Two different, but related keys are used to encrypt and decrypt the message
- If key A encrypts a message, only key B can decrypt it
- The highest security is achieved when one key is used as a public key and the other a private key
- Nowadays, asymmetric encryption is mostly used to encrypt the key for a symmetrically encrypted session