# CCC Item 3 (Security) Revision Sheet

## Useful Definitions

- Asset
  - Any object or data that has potential value if it were stolen, e.g. personal information, trade secrets, customer information, etc
  - Any object or data which could cause downtime were it to be lost or destroyed
- Threat
  - Any potential cause of an incident that may result in damage to an asset
  - This could be accidental or malicious
- Vulnerability
  - A weakness in an asset or group there of which be exploited by one or more threats
- Impact
  - The resulting downtime, financial penalties, etc of an incident cause by a threat
- Risk
  - The potential of a vulnerability to be exploited, and the scale of the impact it would cause to the organisation
- Primary Assets
  - The assets we are interested in protecting, such as business processes and other business critical information
- Supporting Assets
  - Assets that are relied upon by the primary assets for storage, transmission, operation, etc
  - These could be physical things such as the servers that run primary assets, the network they are transmitted over or the building which they are stored in
  - They could also be intangible assets such as software
- Policy
  - A rule or set there of to guide decisions and get the intended outcome
- Standards
  - Specific details of what must be done to comply with a policy
- Guidelines
  - A set of recommended actions to assist in complying with a policy
- Procedure
  - A list of instructions for performing an action or completing a task

### Information

- Any information could be considered business critical, as long as it is required for operation of the company
- Some information has additional rules and regulations surrounding its storage and processing, such as customer information in the EU which falls under GDPR. Such information needs to be protected in a specific way, and violating the regulations could result in large legal or financial repercussions
- Information could be strategically important, such as a secret process for creating a product more efficiently than other companies, but not necessary for the company to function. In this case, it would be preferable to keep the information secure, but if it is leaked it serves only to give competitors an advantage
- Some information has higher costs associated with it than other information, for example if it takes a long time or higher cost to gather in the first place, or has very specific storage requirements

### Business Processes

- A business process is one which contains secret processes or proprietary technology
- Typically they have the ability to greatly affect the efficiency or speed at which tasks could be completed if they were lost or modified
- Some contracts, especially ones with governments, have special processes which are required to comply with regulations
- Processes are often overlooked as being primary assets, as they are often forgotten about until a member of staff is missing for any reason, and no one else knows the correct process

### Hardware

- The physical devices which store software or information
- This can vary anywhere from a phone or laptop to a multi-million server
- If physical access to the device is possible, it may be incredibly easy to steal or delete data from it
- Traditional security such as locks and keys can be used to restrict physical access to devices

### Software

- Typically the most difficult asset to secure
- Most software is rushed through development, leading to many vulnerabilities which were not found during the development process
- Security is often an afterthought, meaning that the design and structure of the software is inherently insecure
- This is especially an issue with proprietary software as only the developers are able to look through the source code to find issues

### Networks

- Anything connected to a network is at much higher risk of attacks than a completely offline device
- The perimeter of the network is very important to protect, as this is where the majority of attacks will come from
  - Firewalls should be used to prevent malicious content from reaching the internal network
  - These can be either physical devices connected to the router, or software installed on all devices. Physical devices are preferred as they protect everything on the network, including IoT devices which are often insecure
- The internal network should also be protected, using measures such as MAC address filtering and newer versions of WPA to prevent unauthorised access to the network
- Additionally, very important assets should be either on a separate network, or separate VLAN

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
- Ensure feedback is given to decision makers about the impact their choices have made

## Access Control

- Identity
  - The properties of an individual or object which can uniquely identify said individual or object

### Issues with Passwords

- Poorly chosen passwords, e.g. too short, use real words or contain personal information
- Often written down on paper or in unsecured text documents
- Infrequently or never changed
- Users often have only one or a few passwords which they reuse for many systems
- Passwords may be shared if users are pressured or confused by phishing
- When attempting to secure password-based access systems, it is possible to cause unwanted availability issues
  - For example, if a user is locked out after 3 incorrect attempts, an attacker could intentionally spam the system with incorrect passwords, locking out one or multiple users