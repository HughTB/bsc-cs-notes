# Lecture - 13:00 08/11/22

- Exam
 - Computer based
 - Mostly multiple choice
 - Exam date and time will be in timetable once confirmed (Sometime in January)
 - Test on **modern** HTML and CSS
  
- This module will use HTML 5 (obvs)
- Mozilla Developer Network (MDN) is a good resource for finding up to date information about HTML 5, CSS and JavaScript

### Markup
- Markup is the extra information included with text, for example "make this bit bold" etc
- HTML stands for HyperText Markup Language
- A HTML document is made up of tags and elements, which surround text and inform how the document should looked when it's rendered in a web browser
- For each tag, there is an open tag <...> and a closing tag </...>
- Tags and elements can have attributes, which sets a property of the tag, for example an <\a\> tag would have the attribute of href="", which sets the URL that the link will point to
- There are two types of Markup
 - Procedural - What to do, how it looks, not why to do it
 - Descriptive - What it means, not how it looks or what it is
- Descriptive markup is better because it separates the content from the way the content is displayed. It also allows you to change the way it is displayed without changing the content. Additionally, it allows better machine processing
- Because of this, the styling is done separately using CSS, Cascading Style Sheets, rather than doing it directly within the HTML

### HTML Syntax

- The line ```<!doctype html>``` tells the program that's rendering the page that the document should be rendered as HTML 5. This should always be the first line in an HTML document
- ```<title>``` Tells the browser what the title of the tab should be

- With HTML 5, we no longer have to include the ```<html>```, ```<head>``` or ```<body>``` tags in a document, and the browser will automatically calculate where these tags should be, which allows us to be lazy and for files to be smaller
- ```<header>```, ```<article>```, ```<footer>``` and ```<section>``` are both essentially ```<div>``` tags with a different and more descriptive name

# Lecture - 13:00 15/11/22

### CSS (Cascading Style Sheets)

- CSS is made up of rules, which each define some characteristics about an object
- The object could be a specific HTML tag, or it could be a class, or even one specific tag, referenced by an id

```css
p {
    background: red;
    color: white;
    padding: 1em;
}
```

- This CSS rule does the following for every paragraph tag in the HTML file:
    - Changes the background to red
    - Sets the colour of the text to be white
    - Adds padding to each side of the element, with a thickness of 1em
- We can add padding to an element using many different units for the size:
    - 1 pixel is the smallest unit a monitor can display
    - 1 em is literally the height of a capital M in the current font of the element
- If you have an invalid value for a property in a CSS rule, the property will return to the default, for example: 
```css 
padding: 1em 0.5em 2em 0;
```
would end up with 0 padding on all sides, as the last term (0) does not have a unit specified and is therefore invalid
- In CSS, the * tag selects everything in the document and changes their properties
- Other rules will still overwrite the * rule

# Lecture - 13:00 22/11/22

### URLs (Uniform Resource Locators)

- URLs are a subset of URIs (Uniform Resource Indicators)
- Examples of URLs are:
    - https://port.ac.uk
    - http://hughtb.uk
- They can be typed into the address bar in a browser
- They are used in ```<a>``` tags to determine where it should link to
- They can also be used to show an image stored on a different server, using the ```src``` property
- Extended examples:
    - http://john.doe:password@www.example.com:123/forum/questions/?tag=networking&order=newest#top
    - In this example,
        - http:// is the scheme - Required
        - john.doe:password is the userinfo - Optional
        - www.example.com is the host - Optional (It is assumed that it is relative to the current server, if not included)
        - :123 is the port - Optional (Should be used only if the server is not hosted on the default port for the protocol (80 for http and 443 for https))
        - /forum/questions/ is the path - Optional (If left as a blank /, the server will send the default page, usually index.html)
        - ?tag=networking&order=newest is the query - Optional (Provides extra information to the server about what information you want)
        - #top is the fragment - Optional (Denotes where in the page the link should point to)
- The ```<a>``` tag
    - The a stands for Anchor
    - The ```href="https://youtube.com/"``` attribute specifies the resource (the page or other file that it should link to, in this case, YouTube)
    - The text between the opening tags is the text that is displayed as the hyperlink
    - We should avoid using "click here" to denote links as it doesn't show where it will link to, makes it less accessible, and is bad for SEO
- With relative paths, you can use standard UNIX file paths to navigate the server's files. e.g. ```../``` goes up a folder ```./``` relates to the current folder and ```/``` is the server's root folder
- The ```<a>``` tag also has a ```target=""``` attribute, which determines where the link should be opened.
    - For example, ```<a href="https://gaming.com/" target="_blank">gaming</a>``` would create a hyperlink with the text gaming, that opens the website https://gaming.com/ in a new tab (or window if the browser is particularly old)
- Fragments - the part of the URL after the #
    - This allows you to link to a specific part of a website
    - After the # you put the ID of the element in the webpage you wish to link to
- Other schemes can be used within a href attribute
    - mailto:hi@example.com will open the user's default email browser and start an email to hi@emample.com
    - tel:+4401234567890 would link to the phone number +44 01234 567890, and open in the default telephone application, usually the phone application on a smartphone

### Images

- To show an image on an HTML page, you use an ```<img>``` tag
    - To set the image that should be shown, you use the ```src=``` attribute with a URL to the image
    - To set the alternative text, you use the ```alt=``` attribute, with some text that describes what should be in the image. This is used both by screen readers, and as text that is shown if the image cannot be loaded

# Lecture - 13:00 29/11/22

### SVG (Scalable Vector Graphics)

- SVG is a "dialect" of XML (eXtensible Markup Language)
- Because of this, it has a very similar syntax to HTML, using the same sort of tags
- You can directly embed an SVG file into an HTML file, using a ```<svg>``` tag
- You can set the fill of the shape to be transparent using ```fill="none"```
- SVG allows you to change the type of colour mixing from light to paint, to more closely represent a painting
- The colour of the outline of the shape can be set using ```stroke=""``` and the thickness of the outline using ```stroke-width=""```
- As well as rect for rectangles, you can draw lines, circles or irregular ellipses
- Lines do not have the fill attribute, but using the stroke and stroke-width attributes, you can change the thickness and colour of the line
- Additionally, there is a ```<polyline />``` tag that lets you draw multiple lines from a list of points, e.g.
```xml
<polyline points="20,20 100,20 100,100 20,100" stroke="red" fill="none">
```
- There is also a ```<polygon />``` tag, which only needs a list of points, and creates a polygon from them, automatically creating the edges and correcting the corners
- There is a ```<path />``` tag, which draws multiple moves and lines from a list. This also allows you to draw curves, which pass through multiple points, e.g.
```xml
<path d="M20,20 L20,80 C100,80 80,10 20,20 z" stroke="red"/>
```
- To get text inside an SVG, you can use a ```<text> </text>``` tag, e.g.
```xml
<text x="20" y="20">Hi</text>
```
- You can style any SVG tag using CSS
- You can group SVG tags together using a ```<g> </g>``` tag. These groups allow you to change the fill colour, outline width, etc of all elements within the group
- You can also use a ```<defs id=""> </defs>``` tag to create a shape, and then reuse it later using a ```<use href="">``` tag, this allows you to change the position at which the shape should be relative to, as well as change the colour, outline, etc
- Shape definitions and groups can be used recursively, e.g. you can use shapes inside other shapes
- Using CSS, you can also animate SVG elements, groups or shapes
- JavaScript events can be used to modify SVG elements when input is given, e.g. a slider is dragged to a different position
- As well as defining an SVG image using inline HTML and the ```<svg> </svg>``` tag, you can define it in a separate .svg file and then use an ```<img src="">``` tag to put it in the HTML document
- If no width or height is specified, it defaults to a 300x150 canvas
- Using the viewbox tag, we can set the SVG to automatically scale to the size of the element that it's in, e.g.
```xml
<svg width="100" height="100" viewbox="0 0 100 100">
    <rect x="20" y="20" height="60" width="60" />
</svg>
```
Would create a square in the centre, and it would scale correctly to the size of the element after it's styled