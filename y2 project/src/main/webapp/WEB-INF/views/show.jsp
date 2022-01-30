<!---Simple jsp to test if the data was saving and showing correctly--->
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
	</c:forEach>

</body>
</html>