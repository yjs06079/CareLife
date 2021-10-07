<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
   .all {
      text-align: center;
      margin-bottom: 50px;
   }
   
   #form {
      padding: 20px;
      width: 500px;
      margin: 0px auto;
      text-align: center;
   }
   

   
	   #cancel {
	      background-color: #FFCD4A;
	      font-weight: bold;
	      margin-top: 20px;
	      margin-bottom: 10px;
	      padding: 10px 50px;
	      border: none;
	      border-radius: 12px;
	      width: 200px;
	   }
	   
	   	  #list {
	      background-color: #FFCD4A;
	      font-weight: bold;
	      margin-top: 20px;
	      margin-bottom: 10px;
	      padding: 10px 50px;
	      border: none;
	      border-radius: 12px;
	      width: 200px;
	   }
   
   #namediv {
		margin-bottom: 10px;
	}
   
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- iamport.payment.js -->
<script   integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
</head>
<body>

 <%@ include file="../includes/userHeader.jsp"%>

<div class="all">

	



<script>
if(${bookingCancel } > 0) {
	alert("예약 취소가 완료되었습니다.");
	location.href="${pageContext.servletContext.contextPath}/usermain/bookingchecklist";
} else {
	alert("오류 발생 : 다시 시도해주세요.");
	
}
</script>


<%@ include file="../includes/footer.jsp"%>
</body>
</html>