<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="bookingpayresult" method="post">
	
	금액이 얼마입니다~
	
	<c:forEach var="item" items="bDTO" >
		<c:out value="${item.boAddr }"></c:out>
	</c:forEach>
	
	
	<input type="submit" value="찐 결제완료 후 예약  insert!!!! ">
	
</form>

</body>
</html>