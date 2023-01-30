# Video Lectures

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
  - (This is used to determine which vulnerabilities will be addressed, based upon their risk and the cost of fixing it)

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
- Processes that are necessary for compliance with contracts or legal obligations
- Processes and procedures are often overlooked as assets, for example if a member of staff is ill or has left, and no-one else knows the correct procedure

### Hardware

- The physical technology which stores software and information
- It may be easy to access the data stored on a device if it is possible to physically access the device, e.g. if a laptop is left unattended
- Traditional security like locks and keys can be used to restrict physical access to devices

### Software

- Typically the most difficult component to secure
- A lot of software is rushed through development and as such has lots of vulnerabilities
- Security is often left as an afterthought, rather than being thought through during the development, meaning what little security is built in, is often half-baked and insecure

### Networks

- Anything connected to a network is at much greater risk than an offline device
- The network perimeter (connection to the wider internet) is the most important security measure
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

## Video 1.3 (Information Security Governance)

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
- But not all incidents can be prevented, so when they do happen, make sure to:
  - Detect incidents
  - Minimize loss and destruction
  - Fix the vulnerabilities that were used to cause the incident
  - Restore services and information that may have been lost or modified

## Video 2.0 (Introduction to Access Control)

- Password Weaknesses
  - Badly selected, e.g. too short, real words, personal information
  - Often written down either on paper or in a text file
  - Infrequently or never changed
  - Same password is used for multiple systems
  - Only required to log in (users may forget to log out)
  - Often forgotten
  - Passwords may be shared if pressured (social engineering)
- When attempting to secure services with passwords, it's possible to cause unwanted availability issues
  - Using a traditional system to prevent guessing (e.g. locking out after 3 tries) may accidentally cause a denial of service if an attacker intentionally locks out users by entering incorrect users

### NCSC Password Guidance
1. Reduce your organisation's reliance on passwords
2. Implement technical solutions (e.g. use rate-limiting or throttling rather than locking out)
3. Protect all passwords
4. Help users cope with password overload (e.g. use a password manager)
5. Help users generate better passwords (e.g. use a password manager)
6. Use training to support key messages

### Access Control Fundamentals

- Identity: The properties of an individual or resource that can uniquely identify said individual or resource
- Authentication: Ensuring that the individual or resource is who or what they say they are
- Authorisation: Checking the authentication of an individual or resource to establish what they are and are not authorised to access
- Accounting: Ensuring that user activities can be traced back
- Audit: Formal or informal review of processes, policies and procedures
- Compliance: Working in accordance with the processes, policies and procedures laid down, with independent reviews

## Video 2.1 (Authentication)

- There are three widely used authentication factors that can be used
  - Something a supplicant knows (Password, Code, etc)
  - Something a supplicant has (Keycard, Phone, Yubikey, etc)
  - Something a supplicant is (Fingerprint, Retinal scan, etc)
- Strong / Multi-factor authentication
  - The multiple authentication factors must be of different types, e.g. Password and Keycard or Code and Fingerprint

### Biometric System Requirements

- Universality (Every individual should posses the trait)
- Distinctiveness (Every individual must be identifiable using only this trait)
- Persistence (The trait should not change over time)
- Collectability (The trait should be easily measurable or scannable)
- Performance (High speed and accuracy is a must, even with limited resources in a variety of conditions)
- Acceptability (The identifier should have wide public acceptance and should be harmless)
- Circumvention (The identifier should be hard or impossible to defraud or "spoof")

### Biometric Effectiveness

- False Reject Rate (FRR)
  - Percentage of instances where authorised users are mistakenly denied access
  - Type I error
- False Accept Rate (FAR)
  - Percentage of instances where unauthorised users are mistakenly granted access
  - Type II error
- Crossover Error Rate (CER)
  - Level at which the number of FFR events and FAR events occur
  - i.e. the FFR and FAR are equal
  - This should be the ideal sensitivity for a biometric scanner, as it minimises false rejections, without increasing false acceptances to unacceptable levels

## Video 2.2 (Authorisation)

### File System Permissions

- Read
- Write
- Execute
- Each user has zero or more of these permissions for each file on a system

### Privileged Access

- System or Application administrators
- "Sysadmins" can
  - Enroll new users
  - Modify or remove user access rights
- Since these users have much greater power than normal users, their accounts should be much more secure and monitored better

### Security Policies

- Access privileges are specified and users' access to resources are determined using a security policy
  - Discretionary Access Control (DAC) controls users access based upon identity
    - Determined by the owner of the resource
    - Often illustrated using an "access matrix"
    - A single object's permissions can be displayed using an Access Control List (ACL), which is essentially one column from the access matrix
    - Alternatively, a Capability List (CL or C-List) could be used, which stores each user's ability to access files
  - Mandatory Access Control (MAC) controls users access based upon security labels
    - Less individual freedom
    - Rules defining how subjects can behave
    - Uses sensitivity or security labels
    - The most common model is the Bell LaPadula (BLP) model, where any user can read files on or below their level, but only write to files on their level (No read up, no write down)
    - The opposite of this is known as the Biba Integrity model (no write up, no read down)
  - Role-Based Access Control (RBAC) controls users access based upon their role
    - Newer than DAC and MAC
    - Centrally administered
    - Assigns permissions based upon users' roles
    - Users who need similar permissions or perform similar functions are grouped together
    - Useful for companies with high employee or user turnover rates
    - Each user can have many roles, and many roles can be assigned to many users
    - Each role can have multiple permissions
  - Attribute-Based Access Control (ABAC) controls users access based upon attributes
    - Generalises access control based upon the role attribute of users, as well as other attributes of the user or asset and environmental information
    - An authorisation engine is used to determine if access should be granted
    - This can be used to give time-based access control, e.g. for contractors