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

<form action="bookingparentsresult" method="post">

	<label for="pName"> 이름 </label>
	<input type="text" id="pName" name="pName"  >
	
	<label for="pPhone"> 연락처 </label>
	<input type="text" id="pPhone" name="pPhone">
	<button  type="button" id="sendPhoneNumber" name="sendPhoneNumber">인증번호 발송</button>
	
	<label for="confirm"> 인증번호 </label>
	<input type="text" id="confirm" name="confirm">
	
	<button type="button" id="checkBtn" name="checkBtn" >인증번호 확인</button>
	
	
	
	 
	<label for="pSubPhone"> 보조연락처 </label>
	<input type="text" id="pSubPhone" name="pSubPhone">
	
	<button  type="submit" id="resultVal" name="resultVal">다음</button>
	
</form>

<script src="${pageContext.servletContext.contextPath}/resources/js/bookingSMSSend.js"></script>      



</body>
</html>