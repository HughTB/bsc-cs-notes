# Video Lectures (Week 1)

## Video 1.1 (Security Definitions and Terminology)

- Asset
  - Anything that has potential value if it was stolen, e.g. personal information
  - Anything that could cause downtime if it was lost
- Threat
  - A potential cause of an incident that may result in damage to (theft or loss of) an asset
- Vulnerability
  - A weakness in an asset or group of assets that may be exploited by one or more threats
- Impact
  - The result of an incident caused by a threat
- Risk
  - The potential that a vulnerability will be exploited, and the amount of harm it will cause the organisation
  - (This is used to determine which vulnerabilies will be addressed, based upon their risk and the cost of fixing it)

- You can pick any 2 of the following for any one asset, and the other will suffer
  - Confidentiality
  - Integrity
  - Availability

## Video 1.2 (Information System Assets)

- Primary assets:
  - Business processes and activities
  - Information
- Supporting assets (Assets which the primary assets rely upon):
  - Hardware
  - Software
  - Network
  - Personnel

### Information

- Business critical information (Any information that is vital to the operation of the company)
- Personal information (Any information stored about customers or personnel, specifically that which is covered by national laws, such as GDPR)
- Strategic information (Information that gives an advantage over other companies, which would not stop the business, but would give competitors an advantage)
- High-cost information (Information whose gathering, storage, processing or transmission require a long time, or involve high costs)

### Business Processes

- Processes that contain secret processes, or proprietary technology
- Processes that could greatly affect the efficiency or ability to accomplish tasks, if modified or lost
- Processes that are necessary for compliance with contracts or legal oblegations
- Processes and procedures are often overlooked as assets, for example if a member of staff is ill or has left, and no-one else knows the correct procedure

### Hardware

- The physical technology which stores software and information
- It may be easy to access the data stored on a device if it is possible to physically access the device, e.g. if a laptop is left unattended
- Traditional security like lcoks and keys can be used to restrict physical access to devices

### Software

- Typically the most difficult component to secure
- A lot of software is rushed through development and as such has lots of vulnerabilities
- Security is often left as an afterthought, rather than being thought through during the development, meaning what little security is built in, is often half-baked and insecure

### Networks

- Anything connected to a network is at much greater risk than an offline device
- The network perimiter (connection to the wider internet) is the most important security measure
  - Use firewalls, both on routers as well as on devices
  - Malicious content should be blocked before reaches devices
- The internal network should also be protected
  - Segregate network for devices requiring higher security
  - Block unknown devices
  - Secure wireless access
  - Monitor network traffic

### Personnel

- Often overlooked, but they can be a great risk as people make mistakes
  - Enforce a security policy
  - Train staff on induction
  - Maintain awareness of security risks
  - Monitor the effectiveness of security training
  - Have a formal disciplinary process

### An Attack

- Assets may be either the subject, or the object of an attack
  - The subject of the attack is the tool being used to conduct the attack
  - The object of the attack is the asset (or assets) which is being attacked
- Any asset could be both the subject and object in an attack, e.g.
  - A computer may be compromised and used to attack other computers
  - A person may be blackmailed or bribed into carrying out an attack

## Video 1.3 (Information Security Govornance)

- Policy
  - A rule or set of rules to guide decisions and get the intended outcome
- Standards
  - Details of what must be done to comply with a policy
- Guidelines
  - A set of recommended actions to assist with complying with a policy
- Procedure
  - A list of instructions for performing an action or completing a task

### Enforcing Policies

- Policies should be promoted and supported in multiple ways, including:
- Education
  - Some roles which require access to secret information may require employees to have information security qualifications or certifications
- Training
  - **Everyone** in an organisation should be trained and made aware of information security
  - Employees should be provided with hands-on instruction and detailed information to prepare them for handling secure information
  - Customised training should be created where possible, otherwise outsourced to a trusted training provider
- Awareness
  - Make sure information security is at the front of people's minds
  - This can be as simple as putting up reminders, such as posters or newsletters, around workspaces

### NCSC Guidance

- Identify individuals at all levels of the company who are responsible for making security decisions and allow them to do so
- Ensure that individuals are held accountable for decisions
- Ensure feedback is given to decision-makers about the impact their choices have made

### Incidents Happen

- Preventative activities help to reduce the risk of incidents, and the number of incidents that do occur
- But not all incidents can be provented, so when they do happen, make sure to:
  - Detect incidents
  - Minimize loss and destruction
  - Fix the vulnerabilities that were used to cause the incident
  - Restore services and information that may have been lost or modified