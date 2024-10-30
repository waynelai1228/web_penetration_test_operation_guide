# Cross-Site Request Forgery (CSRF)

## Code Review Detection
Check cookie attributes is set in code.

Check content type is properly checked in code.

Check each request paths to ensure that each request is associated with a unique identifier. Review the logic handling of the unique identifier.


## Dynamic Testing Detection

### Cookie Attributes
- None: browser attaches cookies in all cross-site browsing contexts.
- Lax: cookies will only be sent in cross-site context when the following two conditions are satisfied:
  1. The request is from top-level navigation.
  2. The request method is safe (GET or HEAD).
- Strict: cookies will not be sent in any cross-site context.

- HTTPOnly: the cookie can only be included in HTTP request (as oppose to JavaScript requests).

### Preflight Requests
Preflight requests are triggered when:
- The application uses methods other than GET, HEAD, or POST.
- The request includes headers that are not included in the simple headers defined in the CORS specification.

### HTTP Request Method
If the server endpoints of interest allow GET requests (most likely to work), this will help bypass Lax restriction.

### Content Type
browsers do not designate simple requests as requiring preflight.
Simple requests have the following content type:
- `application/x-www-form-urlencoded`
- `multipart/form-data`
- `text/plain`

Check if the server endpoints accept any of the above type (even if the application may advertise `application/json`).

### Authorization Header
Authorization header is not automatically sent by browser, unlike cookies. Authorization header can be stored in local storage or session storage and is picked up by JavaScript code and set in the headers.

Check if the application uses authorization header. If it does, CSRF through simple requests is not possible, but XSS into JavaScript CSRF is.

### CSRF Token
Check if any form submission requests contain CSRF token. Check if the token uniquely identifies the user submitting the request in a particular session.

### CORS Header
Check
- CORS header cannot be specified by client side input
- no errors in the parsing of origin header
- null origin value is not white-listed
- if there is a subdomain with XSS that can be exploited
- CORS specify insecure protocol (HTTP), causing TLS to break, allowing attacker to spoof server response
