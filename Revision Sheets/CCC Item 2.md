# CCC Item 2 (Web Development) Revision Sheet

## Markup

- A document with markup information in it contains additional information which tells a computer how it should be formatted
- There are several markup languages, such as Markdown and HTML, but they work in fundamentally the same way
- There are two types of Markup
  - Descriptive
    - What it means, not how it looks or even what it is
  - Procedural
    - What to do, and how it should look
- Descriptive Markup is typically better as it separates the content from the styling of the content
  - This allows you to change the styling easily without changing the content
  - It is also much easier to process with a computer than procedural markup

### HTML

- HTML stands for HyperText Markup Language
  - HTTP (HyperText Transfer Protocol) was designed in parallel with HTML and as such they work together out of the box
- An HTML document is made up of tags and elements
  - For each element, there is an opening tag, `<...>`, and a closing tag, `</...>`, which determine the start and end of the element
  - If the element does not need to contain any other elements, it can instead use `<.../>`
  - Each element can have attributes set within the tags, for example, an `<a>` tag can have the attribute `href=""` set to determine where the anchor should link to
- In HTML5, there are a few things that are needed to make the document valid
  - The document must start with `<!DOCTYPE html>`
  - There must be a `<title>` element, to tell the browser what to display as the name of the page
  - There should only be one `<h1>` element, as this is the "title" for the page
  - Some browsers will still display invalid HTML using "quirks mode" but this is unsupported, and it is much better for compatibility to comply with the standard
- Since the introduction of HTML5, it is no longer necessary to include `<html>`, `<head>` or `<body>` tags in the document, as the browser automatically determines this based on the first displayable element
  - This allows developers to be lazy, and allows files to be slightly smaller by removing these unnecessary tags
- Since HTML uses descriptive markup, the styling is handled separately using Cascading Style Sheets (CSS)

### Cascading Style Sheets (CSS)

- CSS is made up of a set of rules, each of which defines some characteristics about an object or set of objects
  - The object could be a specific type of element, a class of elements or even a specific element, referenced by its id
- Below is an example of a CSS rule
  - ```css
    p {
      background: black;
      color: white;
      padding: 1em;
    }
    ```
  - This rule changes every `<p>` element on the page so that it has a black background, white text and padding of 1em on all sides
- The different units for sizes in CSS are as follows
  - `px` - Pixels, the smallest unit a monitor can display. One problem with using pixels is that they are a different size on every device, so there's no way of knowing how large it will end up
  - `em` - The height or width of a capital M in the font of the element the rule applies to. This is more helpful as it scales with the size of the display
  - `rem` - The height or width of a capital M in the font of the root of the document (body). Not very helpful as this size is often undefined or defined by the browser
- Padding and Margins
  - Padding adds blank space to the inside of the element
  - Margins add blank space to the outside of the element
  - They have the same syntax, as shown below
  - ```css
    p {
      padding: top right bottom left;
      margin: top right bottom left;
    }
    ```
    - If `left` is omitted, it is the same as `right`
    - If `bottom` is omitted, it is the same as `top`
    - If `right` is omitted, it is the same as `top`
- In addition to the selectors previously mentioned, there is the `*` select which applies rules to every element in the document
  - If any of the specific rules include the same properties as `*`, it is overwritten

### Images

- In HTML, images can be displayed using the `<img>` element
  - To set the image that should be shown, you use the `src=""` attribute, which takes the URL of the image
  - To set the alternative text, you use the `alt=""` attribute. While it is technically not required, it should contain some text that describes the image. This text is used both when the image cannot be loaded, and by screen readers, so it is important for accessibility

## Uniform Resource Locators (URLs)

- URLs are a subset of URIs (Uniform Resource Indicators)
- Examples of URLs are
  - https://port.ac.uk/
  - https://hughtb.uk/
- URLs can be typed directly into a browser, and typically most other places which ask for an IP address
- They are used in `<a>` tags to determine where they should anchor to
- They can be used in the `src=""` attribute on many elements to fetch resources from external servers
- Below is an extended example to show all of the parts of a URL
  - `http://john.doe:password123@www.example.com:1234/forum/questions/?tag=networking&order=newest#top`
  - In this example,
    - `http://` is the scheme or protocol - Required
    - `john.doe:password123@` is the userinfo, which is used for authentication - Optional
    - `www.example.com` is the host - Optional (If omitted, it is assumed that the URL is relative to the current host)
    - `:1234` is the port - Optional (If omitted, the port is assumed based on the protocol, 80 for HTTP and 443 for HTTPS. Should only be included if not using the protocol's default port)
    - `/forum/questions/` is the path - Optional (If left blank, the server will send the default page, usually index.html)
    - `?tag=networking&order=newest` is the query - Optional (Provides additional information to the server about which information you require, such as filtering options)
    - `#top` is the fragment - Optional (Tells the browser where in the page it should jump to upon loading)
- When using relative paths, you can use standard *NIX paths to navigate the server's files
  - `../` goes up a folder
  - `./` relates to the current folder
  - `/` is the server's root folder
- With a `href=""` attribute, you can use any type of URL, including ones such as `mailto:` and `tel:` which start a new email and enter a phone number into the default phone app respectively
