<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슬기로운 돌봄생활</title>
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