<!DOCTYPE html>
<html>
<head>
    <title>Welcome Email</title>
</head>

<body>
<h2>Welcome to the site {{$user['name']}}</h2>
<br/>
Your registered email-id is {{$user['temp_email']}} , Please click on the below link to verify your email account
<br/>
<p> one Time otp is : 1234</p>
</body>

</html>