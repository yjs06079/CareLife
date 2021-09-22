<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>

<form action="bookingParentsResult" method="post">

	<label for="boName"> 이름 </label>
	<input type="text" id="boName" name="boName"  >
	
	<label for="boPhone"> 연락처 </label>
	<input type="text" id="boPhone" name="boPhone">
	<button id="sendPhoneNumber" name="sendPhoneNumber">인증번호 발송</button>
	
	<label for="confirm"> 인증번호 </label>
	<input type="text" id="confirm" name="confirm">
	
	<button id="checkBtn" name="checkBtn" >인증번호 확인</button>
	
	
	
	 
	<label for="boSubPhone"> 보조연락처 </label>
	<input type="text" id="boSubPhone" name="boSubPhone">
	
	<input type="submit"  value="다음" id="resultVal" />
</form>

<script src="${pageContext.servletContext.contextPath}/resources/js/bookingSMSSend.js"></script>      



</body>
</html>