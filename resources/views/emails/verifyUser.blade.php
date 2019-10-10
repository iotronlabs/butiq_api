<!DOCTYPE html>
<html>
<head>
    <title>Welcome Email</title>
</head>

<body>
<h2>Welcome to the site butique</h2>
<br/>
Your registered email-id is {{$user['temp_email']}} , Please click on the below link to verify your email account
<br/>
<p> Your ONE-Time-Password is - {{$user['token_email']</p>
</body>

</html>