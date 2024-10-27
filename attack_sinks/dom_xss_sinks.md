Main JavaScript sinks that lead to DOM-XSS vulnerabilities:
```
document.write()
document.writeLn()
document.domain
element.innerHTML
element.outerHTML
element.insertAdjacentHTML
element.onevent
```

jQuery sinks:
```
add()
after()
append()
animate()
insertAfter()
insertBefore()
before()
html()
prepend()
replaceAll()
replaceWith()
wrap()
wrapInner()
wrapAll()
has()
constructor()
init()
index()
jQuery.parseHTML()
$.parseHTML()
```
