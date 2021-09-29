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
   
<div class="all">

<form method="post" action="bookingpayresult"></form>
 
  <h1> ${tname }과 매칭이 완료되었습니다. </h1>
  <h1> 슬기로운 돌봄생활과 함께해 주셔서 감사합니다. </h1>
  
  
  		       <div style="background-color: yellow;">
					<input type="text" value="${bookingDTO.boAddr }" name="boAddr" id="addr">
					<input type="text" value="${bookingDTO.boDate }" name="boDate" id="date">
					<input type="text" value="${bookingDTO.boTime }" name="boTime" id="time" >
					<input type="text" value="${bookingDTO.boHour }" name="boHour" id="hour">
					<input type="text" value="${bookingDTO.boRoadName }" name="boRoadName" id="">
					<input type="text" value="${bookingDTO.boRoadNameDetail }" name="boRoadNameDetail" id="roadNameDetail">
					<input type="text" value="${bookingDTO.boRemarks }" name="boRemarks">
				</div>
 
  <input type="button" id="resultVal" name="resultVal" value="예약조회하기" onclick="location.href='#'">
 
</div>
<%@ include file="../includes/footer.jsp"%>

</body>
</html>