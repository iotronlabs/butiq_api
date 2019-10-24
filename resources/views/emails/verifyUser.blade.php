<!DOCTYPE html>
<html>
<head>
    <title>Welcome Email</title>
</head>

<body>
<h2>Welcome to the butiq platform</h2>
<br/>
Your registered email-id is {{$user['temp_email']}},
<br/>
<p> Your ONE-TIME-PASSWORD is - {{$user['token_email']}}</p>
</body>

</html>