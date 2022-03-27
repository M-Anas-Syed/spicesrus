<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
</head>
<body>
	<form action="/success-register" method="post">
		Email : <input type="text" name="email" /><br/>
        First Name : <input type="text" name="firstname" /><br/>
        Last Name : <input type="text" name="lastname" /><br/>
        Password: <input type="password" name="password" /><br/>
		<input type="submit" value="Register" /><br/>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
</body>
</html>