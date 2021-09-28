<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		if(${result} != 0) {
			alert('중복 지원이 불가능합니다.');
			location.href="${pageContext.servletContext.contextPath}/usermain/apply";
			
		}
	</script>
</body>
</html>