# SQL Injection

## Initial Detection
Spam the likely input points with fuzzing payloads.
Observe SQL payloads returns unconventional HTTP codes.

## Exploitation

### UNION Attack
Find number of fields included in the original query.

**Example**
``` SQL
'+UNION+SELECT+NULL,NULL--
```

**Oracle Database**

Oracle database needs to contain a valid table for query.
`dual` table can be used to select constant expression from Oracle database.

```
'+UNION+SELECT+NULL,NULL+FROM+dual--
```

### Fingerprinting the Database
