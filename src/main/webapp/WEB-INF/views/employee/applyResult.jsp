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
		if(${result} > 0) {
			alert('지원이 완료되었습니다.\n합격 여부는 합격조회 페이지에서 확인 가능합니다.');
			location.href="${pageContext.servletContext.contextPath}/usermain";
			
		} else {
			alert('지원에 실패하였습니다.\n다시 시도해주세요.');
			location.href="${pageContext.servletContext.contextPath}/usermain/apply";
			
		}
	</script>
</body>
</html>