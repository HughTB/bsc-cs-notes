# CCC Item 4 - Lecture 14/03/23

## HCI and Usability

- HCI (Human-Computer Interaction) is the study of interactions between people and computers
- The advent of IOT means that HCI is becoming the study of interactions between people and machines generally
- Major Goals
  - To improve the interactions between people and machines
  - Making computers more usable
  - Make computers more receptive to users' needs
- Long Term Goal
  - To design systems that minimize the barrier between what users want to accomplish and what the computer understands
- HCI is a very broad field which covers many areas of computer science and other subjects such as Psychology and Design

### Usability, UX and User Centred Design

- There are 3 main sub-domains of HCI
  - Usability
    - Usability is one of the key concepts in HCI and refers primarily to how successfully a user can use a system to accomplish a specific goal
    - Concerned with making systems easy to learn and use, and limiting errors and reducing the severity of the errors
  - User Experience (UX)
    - UX encompasses the user's entire experience with an interface
    - This includes not just how the interface does work, but also how they were expecting it to work, how they feel about using it, and how they feel about the system overall
  - User Centred Design (UCD)
    - UCD is an iterative process in which designers focus on the needs of users
    - Users are involved during the whole design process with a variety of research and design techniques

### Why is HCI important?

- HCI is important because if a uses does not understand the interface, or finds it annoying, they are likely to stop using it
- With web apps and desktop software, the principles of good UI have been understood since the 1990s
- So why is HCI often overlooked?
  - Functionality is often prioritized over usability or user experience
  - Budget and time constraints often lead to rushed development, meaning that the important features are implemented first and the user interface is left behind
  - Usability and UX are often forgotten about or intentionally ignored when planning development of new software
- The introduction of new technologies such as VR and the Metaverse mean that HCI is a much bigger concern, and they bring new issues that haven't needed to be solved before

## HCI Paradigms

- There are a few main paradigms for HCI
  - Command Line Interfaces (CLI)
    - Users directly input commands into a text-based interface
  - Graphical User Interfaces (GUI)
    - User manipulates graphical representation of applications, usually using a mouse
  - Natural User Interfaces (NUI)
    - Devices such as the connect which simulate more real-world interactions
  - "Metaverse"

### CLIs

- CLIs are entirely text-based
- Users control the computer or application by entering commands with a keyboard
- Originally, most user interfaces were CLIs (Namely DOS, Unix, Linux, BASIC)
- CLIs are still used with terminal emulators in modern operating systems, but this is usually limited to more administrative tasks

### GUIs

- Often use a desktop metaphor
- Based on point-and-click using a mouse or other pointing device
- Not much has changed since 1984, when the first Apple Macintosh was introduced with a GUI

### NUIs

- A Natural User Interface is a system that uses intuitive actions such as touch, gestures or voice control
- It relies on a user being able to perform relatively natural gestures to control an application or manipulate content
- The idea of NUIs is that rather than adapting our expectations to the capabilities of computers, we adapt the user interfaces to accommodate what we naturally understand
- NUI has always been an ideal concept for HCI, but was greatly limited by the capabilities of technology available in the past
- NUIs come in many forms
  - Speech Recognition, aka Voice Control
    - Already used in devices such as Google Home devices or Siri
  - Brain-Machine Interface
  - Touch Screens
    - Currently the most common type of NUI, as it's very widely used in Mobile Phones, Tablets and Laptops
  - Gesture Recognition
    - Involves tracking in some way the movement of the body
    - Can use cameras such as the Kinect, or could use accelerometers such as Wiimotes or PS Move controllers
  - Gaze / Eye Tracking
    - Often accomplished using a camera, and estimates where on the screen the user is looking

### "Metaverse"

- A metaverse typically refers to a virtual world which mimics the real world, in which people socialise and in some cases work
- There are two common ways of interacting with the metaverse, VR and AR
  - Virtual Reality is where the user's entire view is taken up by the head-mounted display, and everything is simulated
  - Augmented Reality is where the user can still see the real world, but is also able to see and interact with some virtual objects

## Interface Design

- User interface design is another of the sub-domains of HCI
- Designers must consider a wide variety of factors
  - Users' expectations
  - What is enjoyable to use
  - Aesthetic design
  - Limitations of the devices the interface will be used on
  - Limitations of the back-end of the application
- What is the user interface?
  - The parts of the software that the users can see and interact with
  - i.e. the input and output of the software
  - A good interface provides a mixture of well-designed input and output methods that satisfy the users' needs and expectations
  - The best interface is one that is not noticed and allows the users to get on with their task
  - A bad interface often causes more issues than it solves, as users become frustrated when it breaks their expectations or is hard for them to use

# CCC Item 4 - Lecture 13:00 21/03/23

## Usability and Heuristics (Nielsen's Ten Usability Heuristics)

- Nielsen's ten heuristics are principles for evaluating the usability of and interface, and were created by Jakob Nielsen in 1990
- These principles define important points in the design of interfaces and should be considered when creating layouts
- They are, in no particular order:

### \#1 Match between the system and the real world

- The system should use concepts and phrases which are familiar to the user, rather than highly technical system terms
- Information should be displayed in a natural, logical order to reduce confusion
- The design should follow real-world conventions
  - An example of this is how Excel names rows and columns with numbers and letters, which helps users understand which coordinate corresponds to the row and column. Additionally, they begin at 1 rather than at 0, which is how it is represented within the software and files
  - Another example is how e-book readers display pages from left to right, and can often navigate between them by swiping or "turning the page"
- Another idea is to use metaphors
  - For example, using a shopping trolley or cart to represent the items that you have selected to purchase from an online shop
  - Another example is the settings for a piece of software, which is usually represented using cogs, sliders or a spanner

### \#2 Consistency and Standards

- Users should not have to worry about different words or symbols meaning different things when they are used in different interfaces within the same application
- Principle of least surprise
  - Similar things should always look and act in a similar way
  - Different things should always look and act in different ways
- Consistent language and graphic design
  - All objects should maintain the same appearance regardless of where they appear within the system
  - Objects that provide the same function in different windows (e.g. ok or cancel) should stay in the same place across all occurrences
- Flat UI design
  - Buttons and labels should be visibly different, as otherwise it may cause confusion
  - e.g. in more modern "flat" design, it is sometimes hard to tell the difference between buttons and labels

### \#3 Visibility of System Status

- The system should always keep the user informed of the status of the program
- This could be something as simple as a progress bar or loading animation, as otherwise it may seem as though the program has frozen
- Typically, anything less than 5 seconds does not need a loading bar and can get away with just displaying a busy cursor
- Anything over 5 seconds should have a progress bar, or other display to show that something is happening
- If a very long data entry is taking place, it is a good idea to display a progress bar or section indicator to show how far through the form they are

### \#4 User Control and Freedom

- Users often press buttons by mistake, and so there should always be a cancel or abort option available
- As much as possible, Undo and Redo should be supported
- This could consist of
  - Cancel button
  - "Universal" undo
  - Interrupt (For longer operations)
  - Quit (Be able to close the application at any time)
  - Defaults (Have an option to reset settings to sane defaults)
- Frequent violations of this principle can result in the "pottery barn effect"
  - This causes users to feel afraid of pressing buttons in case they break the system
  - The objective is to make the interface as nice to use as possible

### \#5 Error Prevention

- It is much better to prevent errors from occurring in the first place than it is to recover from them
- This could be in the form of validating all inputs before allowing them to be sent, or detecting inputs which could cause an error and asking the user if they wish to submit it anyway
- Errors we make
  - Concious decisions can lead to an error rather than a solution
  - When a user has a false understanding of the system, either due to bad design or a misunderstanding
- Slips
  - Unintentional errors caused by factors such as tiredness
- A good system is designed to handle errors, which could come in the form of prompts for incorrect spelling or displaying what they have previously input to a form
- Once again, undo and redo are useful as they allow users to recover form accidental or mistaken deletion of data or files

### \#6 Help users recognise, diagnose, and recover from errors

- Error messages should be displayed in as plain English as possible, with no technical information displayed, or have it hidden behind a "more information" button
- Deal with errors in a positive and helpful manner, be polite and speak in laymens terms

### \#7 Recognition rather than recall

- The user should not have to remember information from previous parts of the interface in order to use the rest of it
- Information required to use the interface should be clearly displayed
- Short term memory can typically hold only 5 to 7 items, and so is easy to overload
- Another example of this is a "recently opened files" section in a text editor or other application, as well as recently opened links appearing in a different colour on Google search results
- When there is an input box that can only be one of a few options, it is easier for the user to understand and use if it is shown as a dropdown box

### \#8 Flexibility and Efficiency of Use

- Accelerators - unseen by normal users, but greatly increase the speed at which power users are able to navigate and use the software
- This could be something like keybindings or menus, bookmarks, command history or suggestions
- An example of this is intellisense in VSCode and other code editors, which provides predictions based upon what the user is typing, which often greatly increases productivity

### \#9 Aesthetic and Documentation

- Dialogues should not contain unnecessary information
- If too much information is displayed in one place, it can lead to overload, causing users to become distracted or confused
- Less is more
  - Only show information that is needed to use a dialogue
  - Omit extra information or graphics which only serve aesthetics and not the function of the software

### \#10 Help and Documentation

- It is always better if a system can be used without documentation
- However, documentation is very useful for new users or for doing an uncommon task
- Users don't read manuals, but faqs and online information can be useful when a user is frustrated
- Documentation should be
  - Searchable
  - Task-oriented
  - As concise as possible
  - Use as little technical information as possible

# CCC Item 4 - Lecture 13:00 28/03/23

## Usability Testing

- Usability Testing
  - Evaluating the usability of the application, webpage or entire software system that you are developing, but testing with real users
- Software Engineering companies often neglect to test their interfaces, for many reasons
  - Not enough time
  - Too expensive
  - No expertise
  - No location or equipment to do it
  - No experience in interpreting the results

### Why is usability testing needed?

- Why bother doing usability testing if it's too expensive or time consuming?
- Why can't developers do the testing themselves?
  - The developers know the ins and outs of the software, and cannot act as a new user
  - Even limited testing is better than none at all
- When should usability testing be done?
  - Ideally, usability testing is done repeatedly during the development cycle so that changes can be made and tested based upon previous feedback
  - Testing is best at the start of the development cycle, as when done closer to the end, it is much harder to act on the feedback that you gain, as there is often the technical overhead of changing systems to work with the new requirements
- Types of test
  - Early in the development: paper mock ups of the interface may be used to get feedback about the overall design of the interface
  - In the middle of development: compare versions of the user interface to get feedback on which is better for users
  - Near the end of development: verify that the interface is usable by new users
- Historical records should be kept of the usability results, so that they can be compared over time

## Testing Approaches

- Traditional testing
  - Expensive
  - Time consuming
  - Scientific
  - Usually 8 or more users
  - Carefully selected users to match target demographic
  - Run by an experienced tester
  - Scheduled weeks to months in advance
  - Unless a huge budget is allocated, typically only run a few tests at the end of development
  - Anywhere from £5000-£15000
  - Delivered as a 20-page report which must be deciphered
- "Lost-our-lease" testing
  - Cheap
  - Fast
  - Not scientific
  - 3 or 4 users
  - Random people
  - Run by just about anyone
  - Tests can be done almost any time, as long as you can find users
  - Since it's so cheap, run tests continually throughout the development cycle
  - Roughly £300
  - Each observer writes a page of notes, can be read through same-day
- The benefits of multiple tests
  - One test with 8 users
    - With more users, they are likely to find more problems with the interface in one sitting
    - However, these problems might cause them to be unable to look at the rest of the interface
  - Two tests with 4 users each
    - In the first test, less issues will be found, but they can be fixed before the next test
    - In the second test, smaller issues will be found, but they couldn't have been found in a single test as the issues preventing progress have now been fixed

### Ideal Test Setup

- Preferably a quiet room with enough seats for the user and moderator(s)
- The user sits at a computer, and performs tasks with it
- The moderator(s) guides the user through the test
- Developers from the team observer the user, preferably from another room
  - Alternatively, a webcam and screen capture software is used to record footage to be analysed later

### Selecting Participants

- Ideal participants are users who have not been told much about the app beforehand, so that they have no expectations coming into the test
- It doesn't really matter who the users are
  - It's bad for only experts to be able to use the interface, so people with little to no knowledge of the application are ideal
  - Unless it's a specialist application, in which case the target demographic should be used as testers

### Selecting Moderators

- Anyone with decent people skills can do it
- Ensure the user knows they're not the one being tested
- Don't lead the user about how to use the interface
- When users give feedback, ask them for more detail
- Don't make notes in a way that makes the user think they've done something wrong
- Ask questions when the user gets stuck, e.g. "What are you thinking?" or "What're you trying to do now?"

### Types of Tests

- "Get it" testing
  - Does the user understand the software's function
  - Ask what they think it does
  - Just allow the user to click around in the interface and ask them what they think the purpose of each part is
- "Key task" testing
  - Ask the user to do a specific task, and see how long it takes them to do it
  - e.g. "Your task is to buy a book about cars for £10 or less"
- Exploratory testing
  - Can a user just "walk up" and start using the software without any instruction
- Assessment
  - User performs specific tasks, rather than vague goals
- Comparison
  - Get the user to perform the same task using different interfaces
  - Get feedback on specific parts of each design, as the best option may have parts from multiple interface prototypes
- Verification
  - Uses the actual product
  - Intended to test the performance of the final interface, and find any minor bugs or flaws to be fixed before shippinh

## Conducting a Test

- The observers should be out of the room or out of view
- The observers should be looking for
  - Whether the user understands the interface
  - Can they find their way around the interface
  - How long does it take them to perform a task (both number of clicks and time)
  - Do they do anything unexpected
  - What do the users like and dislike about the interface
  - What do they do when they get stuck?
    - Do they need help?
    - Do they retry it?
    - Do they just stop and look at the moderator?
    - Do they look around the app trying to find a feature?
- The observers should not transcribe anything, that's what the recording is for
- Only small notes should be made about the user's experience
- Value the user's actions and explanations over opinions

### Possible Data to Collect

- Number of tasks completed without assistance
  - How long did each task take?
  - How many clicks did they have to make for common tasks?
- Count of incorrect selections or false assumptions
- Number of times they had to refer to documentation or a help page / window
- Time needed to recover from an error

### Performance Goals

- For some tests, it is a good idea to set specific goals for the test
  - e.g. "2/3rds of users will be able to find and change a setting in 5 minutes"
  - In these sorts of tests, moderators should give the users less help
  - Just let the user get on with it, rather than giving a running commentary
  - Alternatives to "thinking aloud"
    - Replay the recording to the user after the test, asking them to explain why they did what they did
    - Get them to talk through how they changed the setting after performing the test
- Bad goals are too vague, such as "is the product usable" "is the product ready for release" "is it a good product"

### Users Fail

- Users fail the tests if they
  - Don't understand the purpose of the site
  - Use different words to describe things, and so can't effectively communicate with the moderators
  - Find the site is too busy / cluttered
  - Are unclear on what the options on the screen are

### Limitations of Testing

- Somewhat artificial
- Test results do not prove that an interface "works"
- It's possible that there is a very steep learning curve, so a brief test may not show the full usability of an interface
- Doesn't tell you if the product is "good" or needed