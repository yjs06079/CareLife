<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슬기로운 돌봄생활</title>
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
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


</head>
<body>

  <%@ include file="../includes/userHeader.jsp"%>
   
<div class="all">

	<form action="bookingcompletion" method="post">
	<input type="hidden" name="pno" id="pno" value="${pno}">	
	<input type="hidden" name="pname" id="pname" value="${pname}">
	<input type="hidden" name="pphone" id="pphone" value="${pphone}">
		<input type="hidden" name="tno" id="tno" value="${tno}">

	
	
		<div id="form">
			<h1> 예약확정을 위해 결제해주세요. </h1>
	        <p> 결제 진행 후 담당선생님에게 예약정보가 안내됩니다. </p>
			
			<!-- 결제 api -->		
			
			<button  type="submit" id="btn" name="btn" >찐 결제완료 후 예약  insert!!!!</button>
			
			<!-- dto정보  -->
				
            <div style="background-color: yellow;">
               <input type="text" value="${bookingDTO.boAddr }" name="boAddr" id="boAddr">
			   <fmt:formatDate var="boDate" value="${bookingDTO.boDate}" pattern="yyyy-MM-dd" />
			   <input type="hidden" value="${boDate }" name="boDate" id="boDate">
               <input type="text" value="${bookingDTO.boTime }" name="boTime" id="boTime" >
               <input type="text" value="${bookingDTO.boHour }" name="boHour" id="boHour">
               <input type="text" value="${bookingDTO.boRoadName }" name="boRoadName" id="boRoadName">
               <input type="text" value="${bookingDTO.boRoadNameDetail }" name="boRoadNameDetail" id="boRoadNameDetail">
               <input type="text" value="${bookingDTO.boRemarks }" name="boRemarks" id="boRemarks">
               <input type="hidden" name="boPayment"  id="boPayment" value="${bookingDTO.boPayment }"><br>
            </div>
				

		</div>
	</form>
</div>

<script src="${pageContext.servletContext.contextPath}/resources/js/bookingPay.js"></script>
<%@ include file="../includes/footer.jsp"%>

</body>
</html>