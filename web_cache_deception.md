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
Identify the page of interest.

### Path normalization
