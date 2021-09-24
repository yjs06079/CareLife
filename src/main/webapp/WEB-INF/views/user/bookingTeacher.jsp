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

<form action="bookingteacherresult" method="post">


선생님을 골라주세열 

  <br>
  
  ${list}
  
<c:forEach var="item" items="${list }">
   <c:out value="${item.bo_addr }"></c:out>
   <c:out value="${item.boDate }"></c:out> <br>
   <c:out value="${item.boTime }"></c:out> <br>
</c:forEach>
  
  
  
  <input type='radio' name='tName' value='이경실' id="tName"/>이경실
  <input type='radio' name='tName' value='조승우' id="tName" />조승우

<input type="submit" value="결제하기" >

</form>

 
 
</body>
</html>