# Web Cache Deception
tricking user into sending request for sensitive information that would be stored in web cache.

* difference in how the origin server interprets the path compared to the cache
* make the origin server interprets the path we want to retrieve
* includes cache key so the response is cached

## Initial Detection
Search for cached responses.

Using these headers
```
X-Cache
Cache-Control
```

Alternatively, the cached response will be returned significantly faster.

## Exploitation
Identify the page of interest. This is the page you want to web cache to store.

Identify cached pages and observe the cache rules.

Construct a URL that contains cache trigger so the cache server will store the response from origin server. When the origin server interprets the URL it will only read the page of interest.

### Cache Rules

Static content are more likely to be cached than dynamic content.

Static file extension
- .js
- .css
- .png, .svg, .jpg, etc.

Static directory
- /images
- /static
- /assets
- /resources

File name
- robots.txt
- favicon.ico
- index.html

### Path mapping, delimiter, and delimiter decoding discrepancies

Path mapping discrepancies
- origin server abstract the URL path with actual content and ignore the added segment
- cache server still registers the full path
```
/<page-of-interest>/<added-segment-with-cache-trigger>
```

**Example**
```
/user/profile/cache_trigger.js
```

Delimiter discrepancies
- delimiters specify boundaries between different elements in URLs
- origin server truncates anything after delimiter
- cache server interprets everything including delimiter as full path
```
/<page-of-interest><delimiter><cache-trigger>
```

**Example**
```
/profile;cache_trigger.js
```

Delimiter decoding discrepancies
- origin server decodes the delimiter and interprets the path preceding the delimiter
- cache server does not decode the delimiter and store the encoded path as full path
```
/<page-of-interest><encoded-delimiter><cache-trigger>
```

**Example**
```
/profile%23cache_trigger.js
```

Portswigger example list of delimiters
https://portswigger.net/web-security/web-cache-deception/wcd-lab-delimiter-list

### Path normalization

Path normalization exists in origin server but not cache server:
```
/<static-directory-cache-trigger>/..%2f<page-of-interest>
```

Path normalization exists in cache server but not origin server:
```
/<page-of-interest>%2f%2e%2e%2f<static-directory-cache-trigger>
```
