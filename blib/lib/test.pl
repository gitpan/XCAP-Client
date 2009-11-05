
use XCAP::Client;

my $conn = new XCAP::Client(
    xcap_root => 'http://sip.nocphone.com:8000',
    user => 'sip:thiago@sip.nocphone.com',
    auth_realm => 'sip.nocphone.com',
    auth_username => 'thiago',
);
$conn->auth_password('testando');

$doc_content =<<EOF;
<?xml version="1.0" ?><ruleset xmlns="urn:ietf:params:xml:ns:common-policy" xmlns:cp="www.counterpath.com/privacy-lists" xmlns:pr="urn:ietf:params:xml:ns:pres-rules">
<rule id="pres_whitelist">
<conditions>
<identity>
<one id="sip:gabriel\@sip.nocphone.com"/>
<one id="sip:marcelo\@sip.nocphone.com"/>
<one id="sip:eduardo\@sip.nocphone.com"/>
<one id="sip:shin\@sip.nocphone.com"/>
</identity>
</conditions>
<actions>
<pr:sub-handling>allow</pr:sub-handling>
</actions>
<transformations>
<pr:provide-services>
<pr:all-services/>
</pr:provide-services>
<pr:provide-persons>
<pr:all-persons/>
</pr:provide-persons>
<pr:provide-devices>
<pr:all-devices/>
</pr:provide-devices>
<pr:provide-all-attributes/>
</transformations>
</rule>
<rule id="pres_blacklist">
<conditions/>
<actions>
<pr:sub-handling>block</pr:sub-handling>
</actions>
<transformations/>
</rule>
</ruleset>
EOF

$conn->document->content($doc_content);
print $conn->document->create;
#print $conn->document->fetch;
#print $conn->document->delete;

#print $conn->connection->replace;
#print $conn->connection->create;
#print $conn->delete;
#print $conn->connection->fetch;

1;

