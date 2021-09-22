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
		if(${result} > 0) {
			alert('지원이 완료되었습니다. 합격 여부는 합격조회 페이지에서 확인 가능합니다.');
			
		} else {
			alert('지원에 실페하였습니다. 다시 시도해주세요.');
			
		}
		
		location.href="${pageContext.servletContext.contextPath}/apply";
	</script>
</body>
</html>