# SQL Injection

## Code Review Detection
Look for `sql.execute()` or similar in code and examine how to query is constructed.

## Dynamic Testing Detection
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
If possible, find the specific version of the database on the backend. (see [sql_cheat_sheet.md#database-version](/cheatsheets/sql_cheat_sheet.md#database-version))

If the injection does not return direct output of version, use context clue from input to determine the database being used.

### Extracting data

#### Clear Text SQL Injection
When the output from SQL query is reflected directly back to application.

Use the technique from [sql_cheat_sheet.md#database-contents](/cheatsheets/sql_cheat_sheet.md#database-version) to extract table names and column names to contruct data extraction query.

#### Blind SQL Injection
Check conditional responses [sql_cheat_sheet.md#conditional-errors](/cheatsheets/sql_cheat_sheet.md#conditional-errors)

Check time delayed responses [sql_cheat_sheet.md#time-delays](/cheatsheets/sql_cheat_sheet.md#time-delays)

Check DNS lookup [sql_cheat_sheet.md#dns-lookup](/cheatsheets/sql_cheat_sheet.md#dns-lookup)
