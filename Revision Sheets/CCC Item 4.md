# CCC Item 4 (Key Concepts of Usability)

## Human Computer Interaction (HCI)

- The study of interactions between humans and computers (machines generally)
- Major Goals
  - Improve the interactions between people and machines
  - Make computers more usable
  - Make computers more receptive to users' needs
- The scope of HCI is large, and ever-growing. As such, it covers many different areas of computer science and other subjects such as Psychology and Design
- There are 3 main sub-domains of HCI
  - Usability
    - Refers to how successfully can a user accomplish a specific goal using the system
    - Concerned with making systems easy to learn and use, as well as limiting errors
  - User Experience (UX)
    - UX encompasses the users' entire experience with an interface
    - This includes not only the design and functionality of the interface, but also how users expect the interface to function
  - User Centred Design
    - UCD is a design process in which the design is iterated upon several times based on feedback from users
- Why is HCI important?
  - Badly designed interfaces can be confusing or time-consuming to use, which increases the likelihood of users abandoning the system and using a competitor
  - Since the way we interact with computers and other machines changes constantly, we need to research ways to improve the interactions and make them as intuitive as possible

### HCI Paradigms

- There are a few main paradigms for HCI, including new paradigms we are yet to fully exploit
- Command Line Interfaces (CLI)
  - Entirely text-based interface, reminiscent of computers from the 80s
  - Still used in legacy applications, or when greater administrative control is required
- Graphical User Interfaces (GUI)
  - Often use a desktop metaphor
  - Typically uses a point-and-click interface with a mouse or other pointing device
- Natural User Interfaces (NUI)
  - Uses intuitive actions to control a system. The machine adapts to humans rather than the other way around, as with CLI and GUI
  - There are many forms of NUI, but the most common are voice control, touch screens, gesture recognition, eye tracking, etc
- The "Metaverse"
  - Typically refers to a virtual world which mimics real life
  - Two main methods of interacting with the metaverse, namely AR (Augmented Reality) and VR (Virtual Reality)

### Interface Design

- User Interface design is another important part of HCI
- Designers must consider a wide range of factors
  - User Expectations
  - What is enjoyable/attractive
  - Limitations of the device(s) the interface will be used on
  - Limitations of the back-end of the application
- User Interface is the part of a computer system that end users interact with
- A good user interface will not be noticed, as it uses a good balance of input and output methods to create an intuitive and pleasing interface
- A bad user interface causes frustration when it breaks users' expectations or forces them to adapt to the poor design

## Usability Heuristics

- Nielsen's heuristics are a set of principles for evaluating the usability of an interface, and were created by Jakob Nielsen in 1990
### 1\. Match Between the System and the Real World
- The system should use concepts and phrases which are familiar to the user, as well as following real-world design conventions and using metaphors where possible
### 2\. Consistency and Standards
- Words and symbols should always mean the same thing throughout the interface, to reduce confusion and improve the intuitiveness of the interface
### 3\. Visibility of System Status
- The system should keep the user informed of it's status. This could be as simple as a progress bar or loading animation to show that the interface is not frozen
### 4\. User Control and Freedom
- Users often make mistakes, so there should be undo or cancel buttons wherever possible, especially in places where data could be lost or corrupted
### 5\. Error Prevention
- It is much more user friendly to prevent errors rather than recovering from them. This could be in the form of validating inputs before they are sent, or giving users a second chance to check before submitting
### 6\. Help Users Recognise, Diagnose and Recover From Errors
- Error messages should be displayed in as plain English as possible, and hide technical information behind a "more info" button or similar
### 7\. Recognition Rather Than Recall
- The user should not have to remember the entire interface to use it. As such, information needed to use the interface should be clearly displayed at all times
### 8\. Flexibility and Efficiency of Use
- Accelerators should be added to the application, which go unnoticed by regular users, but allow much greater productivity for power users. This could be as simple as key bindings or as complex as intellisense
### 9\. Aesthetic and Documentation
- Dialogues should only contain the necessary information, as it is easy to overload users with graphics and jargon
### 10\. Help and Documentation
- It is always best for a system to be usable without documentation, but it is still very useful for new users or advanced users performing an uncommon task

## Usability Testing

- The process of evaluating the usability of the application, website or software system, typically using real users
- Testing is often carried out too late into the development process, once the design or functionality of the system is already finalised
- When should testing be done?
  - Ideally, testing should happen repeatedly during the development of the software system, so that changes can be made and iterated upon
  - Even if the system is non-functional, or even just a sketch on paper, it's still possible to test with users to get feedback on the overall design
- What data should be gathered?
  - User actions and explanations of their actions, but not necessarily their opinions
  - Numerical data can also be incredibly useful, such as the time or number of keypresses taken to complete a task

### Testing Approaches

- Traditional Testing
  - Expensive and time consuming as it is more scientific than other types of testing
  - Usually 8 or more carefully selected users who fit with the target demographic
  - Since they are run by an experienced tester or testing firm, they have to be scheduled many weeks or months in advance
  - Rather expensive (£5K-£15K), so typically only a few tests are run and often at or near the end of development
- "Lost-Our-Lease" Testing
  - Cheap and fast, but not very scientific
  - Only a few, usually 3 to 5, people selected completely at random
  - Can be run by almost anyone and at any time, as long as you can find users
  - Very cheap, in the region of a few hundred pounds

### Types of Test

- "Get it" Testing
  - Does the user understand the software's main functions? Allow them to click around the interface and ask them what they think each part of it does
- Key Task Testing
  - Ask the user to perform a specific task and collect data such as time taken and the number of clicks to complete the task. For example "Your task is to buy a book about cars for less than £10"
- Exploratory Testing
  - Can a user "walk up" and start using the software without any instruction
- Assessment
  - User performs a specific task rather than vague goals
- Comparison
  - Get the users to perform the same task using different interfaces, asking for feedback about specific parts of each design, as the best interface may have aspects from multiple different prototypes
- Verification
  - Tests are performed to test the final version of the interface, and find any minor bugs or flaws which can be fixed before shipping the software

## Accessibility

- Designing software, websites, apps and tools to be usable by anyone, regardless of their circumstances (including impairments, economic issues or location)
- There are accessibility standards, such as the ones published by the UN and W3C, but compliance is very low

### Impairments

- An impairment is anything which has an adverse effect on someone's ability to carry out day-to-day activities
- Typical impairments include
  - Auditory (Speech, deafness, hearing impairment)
  - Visual (Blindness, colour blindness, low vision)
  - Cognitive (Dyslexia, ADD, Autism)
  - Physical (Cerebral palsy, Epilepsy)

### Design for All (Universal Design)

- An approach for designing for accessibility
- The main principles include
  - Equitable use - The design does not favour or disadvantage any group of users
  - Flexibility of use - The design accommodates a wide range of user preferences
  - Simple/Intuitive use - The design is simple and easy to understand, regardless of user experience, knowledge or language skills
  - Perceptible information - The design communicates necessary information to the user regardless of their sensory abilities
  - Tolerance for error - The design minimises the consequences of unintentional actions or errors
  - Low physical effort - The design can be used efficiency without large physical effort
  - Size and space for approach and use - The design provides sufficient size and space for use regardless of any physical conditions, including those in wheelchairs or other mobility devices

### Inclusive Design

- A more pragmatic approach to accessible design, based on four main ideas
  - A part of being human is having different abilities to others, and these abilities change over time
  - Designs that work for people with disabilities work better for everyone
  - Our self-esteem, identity and well-being are affected by our ability to function independently in our daily lives
  - Usability and aesthetics are mutually compatible

### Web Content Accessibility Guidelines (WCAG)

- Perceivable - Information must be visible to more than one sense, so that people with a sensory impairment can still perceive it
- Operable - The interface should not require any sort of interaction that a user may not be able to perform
- Understandable - The content or operation of an interface must be within the understanding of anyone and everyone
- Robust - As technologies and user agents evolve and improve over time, the content should continue to be accessible

## Standards

- An agreed way of doing something, usually created and recognised by an independent body, which assure compatibility or a level of quality. They also provide specific and measurable information about how the standard should be implemented
- Standards are needed to promote best practices for software and hardware development, as well as enforcing consistency and compatibility between systems made by different companies
- Since they are made independently of any company or country, they are not affected by their interests
- The International Standards Organisation (ISO) is a widely known and well-renown standards organisation which acts independently of any government. Since it is an international organisation, it is possible for companies around the world to use the same standards for their products

### Guidelines

- Sets of general rules which are advisable to follow, but not required. Typically based on previous experience and evidence
- They provide clear instructions on a variety of issues which may crop up during the design or implementation process, as well as reducing the impact of "opinion-driven" design 

## Evaluation

- The process by which an interface is tested to determine if it meets the needs of the intended user
- It also provides feedback which could aid designers in improving the usability of an interface, such as the parts of the interface which are understandable and which parts need to be improved

### Types of Evaluation

- Summative
  - Undertaken at the end of the development cycle, providing an evaluation and summary of the usability of the end product
- Formative
  - Undertaken during the development cycle, and can be used to inform the development process as it is ongoing. Any type of interface can be tested, from a working prototype to a paper mock up
- Analytic
  - Undertaken to evaluate existing solutions, rather than create new ones. Includes GOMS and Cognitive Walkthrough
  - GOMS
    - Goals (A task that needs to be performed), Operators (Actions required to complete a goal), Methods (A group of operators), Selection (Different ways of applying a method)
  - Cognitive Walkthrough
    - A technique for evaluating the learnability of a system
    - Identify the goal you wish to evaluate. Identify the tasks needed to complete that goal. Document the experience of performing the task
    - Will users understand how to complete the task? Are the controls obvious? Is there any feedback to confirm that you've completed a task?
- Empirical
  - Undertaken with prototype interfaces to understand user opinion and expectations, as well as gathering benchmark tests