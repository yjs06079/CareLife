<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슬기로운 돌봄생활</title>
<style>
   .all {
      text-align: center;
      margin-bottom: 50px;
      padding: 20px;
      width: 700px;
      height:300px;
      padding: 30px;
      margin: 0px auto;
      text-align: center;
   }
   
   #resultVal {
      background-color: #FFCD4A;
      font-weight: bold;
      margin-top: 20px;
      margin-bottom: 10px;
      padding: 10px 50px;
      border: none;
      border-radius: 12px;
      width: 400px;
   }
   
   
   #form {
      padding: 20px;
      width: 500px;
      margin: 0px auto;
      text-align: center;
   }
   
   #btn {
      background-color: #FFCD4A;
      font-weight: bold;
      margin-top: 20px;
      margin-bottom: 10px;
      padding: 10px 50px;
      border: none;
      border-radius: 12px;
      width: 400px;
   }
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>

	 <%@ include file="../includes/userHeader.jsp"%>
	 
	 
 <form action="bookingcompletionresult" method="post">  
<div class="all">


    <input type="hidden" name="tno" id="tno" value="${tno}">
	<input type="hidden" name="pno" id="pno" value="${pno}">	
	<input type="hidden" name="pname" id="pname" value="${pname}">
	<input type="hidden" name="pphone" id="pphone" value="${pphone}">
 
   <h1>${tname} 과 매칭이 완료되었습니다. </h1>
   <h1> 슬기로운 돌봄생활과 함께해 주셔서 감사합니다. </h1>
  

  
  

               <input type="hidden" value="${bookingDTO.boAddr }" name="boAddr" id="boAddr">
			   <fmt:formatDate var="boDate" value="${bookingDTO.boDate}" pattern="yyyy-MM-dd" />
			   <input type="hidden" value="${boDate }" name="boDate" id="boDate">
               <input type="hidden" value="${bookingDTO.boTime }" name="boTime" id="boTime" >
               <input type="hidden" value="${bookingDTO.boHour }" name="boHour" id="boHour">
               <input type="hidden" value="${bookingDTO.boRoadName }" name="boRoadName" id="boRoadName">
               <input type="hidden" value="${bookingDTO.boRoadNameDetail }" name="boRoadNameDetail" id="boRoadNameDetail">
               <input type="hidden" value="${bookingDTO.boRemarks }" name="boRemarks" id="boRemarks">
               <input type="hidden" name="boPayment"  id="boPayment" value="${bookingDTO.boPayment }"><br>
               <input type="hidden" name="boCancel"  id="boCancel" value="${bookingDTO.boCancel }"><br>
			
 
  <input type="button" id="resultVal" name="resultVal" value="예약조회하기" onclick="location.href='http://localhost:8080/carelife/usermain/bookingcheck'">
 
</div>

</form>
<%@ include file="../includes/footer.jsp"%>

</body>
</html>