# Networks - OL Lecture 09:00 21/03/23 (Week 18 Contd.)

### Hyper Text Transfer Protocol (HTTP)

- Standard protocol used on the world wide web
- Requests one file at a time, typically starting with an HTML web page
- The web page may point to other files that need to be loaded
- Mainly consist of `GET` and `POST` requests
- Typically uses port 80
- Some websites are interactive, and as such the HTML changes
- Some of these websites use server-side rendered HTML to keep the website faster for low performance clients
- How do we send data for an interactive web page?
  - Using a GET request
    - GET http://{website}/{file}?information={data} HTTP/1.1
  - Using POST
    - POST http://{website}/{file} HTTP/1.1
      {data}
  - Why do the two different methods exist?
    - GET exists to allow links to dynamically generated content
    - POST keeps data out of the URL, which is useful for information such as passwords

### Email (SMTP, POP3, etc)

- Before we can send an email, we need to find out the IP address of the mail server
- To do this, the application requests the MX record for the domain in question, e.g. `port.ac.uk` if trying to send an email to `amanda.peart@port.ac.uk`
- Once we know the IP address, we use SMTP (Simple Mail Transfer Protocol) on port 25
- Anti-Spam measures
  - Standard practice is to use closed relays
    - Only accept mail destined for that mail server
    - Only send mail out from the mail server when the client requesting mail to be sent has an IP within a certain range, or is authenticated with a certificate or password
  - Real-time blackhole lists (RBL)
    - Automatically blocks reported email addresses which are then blocked
    - Can be annoying for people who have been inadvertently placed in the list
  - Content scanners can be employed to block spam messages, however these are often seen as a breach of privacy
- Can we impersonate someone else?
  - You can replace the sender and recipient addresses in the SMTP messages to be whatever you wish
  - However, there are multiple mechanisms that block this
    - Anti-spam measures often block these emails anyway
    - Most mail servers reject messages sent from an IP address other than the one specified in the MX record for the domain
    - e.g. you change the sender to `boris@gov.uk`, most recipients will block the message as your IP address does not match that belonging to the MX record of `gov.uk`

### How do we get our emails? (POP3)

- To get our messages from the mail server, we need another protocol known as POP3 or Post Office Protocol v3
- Mail delivered by SMTP is stored on the mail server
- Our email client then requests the mail from the server using POP3
- POP3 is another simple text-based protocol
  - Authenticate with the server using a username and password
  - Request the number of messages waiting on the server
  - If more than 0, request each email one by one
  - Optionally: delete the messages from the server after they've been downloaded

### The real world

- How would a company set up their internal intranet with a website and internal mail server?
  - Typically one or more internal DNS server on the network which handles an internal domain, or subdomain
  - HTTP server (Apache, IIS, Nginx, etc)
  - Mail server (Exchange, sendmail, etc)
- In a smaller business, all of these services could be running on one machine, but it is often better to split them up to improve
  - Redundancy
  - Security
  - Performance
  - Network bandwidth

### HTTP over SSL (HTTPS)

- Used for the vast majority of the world wide web at this point
  - Originally only used for high security applications such as banking
- Server certificates are used to verify the authenticity of the server
- There are a few problems with HTTPS
  - Server certificates (used) to be expensive
  - It is possible to impersonate servers if they forget to renew their certificates, or use self-signed certificates