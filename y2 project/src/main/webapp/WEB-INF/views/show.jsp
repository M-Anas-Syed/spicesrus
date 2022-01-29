<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>List of Spices</title>
</head>
<body>
	<c:forEach items="${spices}" var="spice">
	<p>Name: ${spice.id}, price:  ${spice.price} 
		<a href="/terminate?agent=${agent.id}">[terminate]</a>
		<a href="/reports?agent=${agent.id}">[see reports]</a></p>
	</c:forEach>
	<p><a href="/newAgent">[Create Agent]</a></p>
</body>
</html>