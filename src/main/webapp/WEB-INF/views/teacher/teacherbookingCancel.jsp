<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../includes/teacherHeader.jsp"%>
	
	<script>
		if(${bookingCancel } > 0) {
			alert("예약 취소가 완료되었습니다.");
			location.href="${pageContext.servletContext.contextPath}/teachermain/bookinglist";
		
		} else {
			alert("오류 발생 : 다시 시도해주세요.");
			
		}
	</script>
	
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>