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
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


</head>
<body>

  <%@ include file="../includes/userHeader.jsp"%>
   
<div class="all">

	<form action="bookingcompletion" method="post">
	
	<input type="hidden" name="pno" id="pno" value="${userDTO.pno}">	
	<input type="hidden" name="pname" value="${userParentsDTO.pname}">
	<input type="hidden" name="pphone" value="${userParentsDTO.phone}">

	
	
		<div id="form">
			<h1> 예약확정을 위해 결제해주세요. </h1>
	        <p> 결제 진행 후 담당선생님에게 예약정보가 안내됩니다. </p>
			
			<!-- 결제 api -->		
			
			<button  type="submit" id="btn" name="btn" >찐 결제완료 후 예약  insert!!!!</button>
			
			<!-- dto정보  -->
			<div hidden="true">
				<c:out value="${bookingDTO.boAddr }"></c:out> <br>
				<fmt:formatDate var="boDate" value="${bookingDTO.boDate}" pattern="yyyy-MM-dd" />
				<c:out value="${bookingDTO.boDate }"></c:out> <br>
				<c:out value="${bookingDTO.boTime }"></c:out> <br>
				<c:out value="${bookingDTO.boHour }"></c:out> <br>
				<c:out value="${bookingDTO.boRoadName }"></c:out> <br>
				<c:out value="${bookingDTO.boRoadNameDetail }"></c:out> <br>
				<c:out value="${bookingDTO.boRemarks }"></c:out> <br>
				<c:out value="${bookingDTO.boPayment }"></c:out> <br>
				<input type="hidden" name="pay" id="pay" value="${bookingDTO.boPayment }"><br>
				
				
				
				
				<div style="background-color: yellow;">
					<input type="text" value="${bookingDTO.boAddr }" name="boAddr" id="addr">
					<input type="text" value="${boDate }" name="boDate" id="date">
					<input type="text" value="${bookingDTO.boTime }" name="boTime" id="time" >
					<input type="text" value="${bookingDTO.boHour }" name="boHour" id="hour">
					<input type="text" value="${bookingDTO.boRoadName }" name="boRoadName" id="">
					<input type="text" value="${bookingDTO.boRoadNameDetail }" name="boRoadNameDetail" id="roadNameDetail">
					<input type="text" value="${bookingDTO.boRemarks }" name="boRemarks">
				</div>
				
			</div>
			
		</div>
	</form>
</div>

<script src="${pageContext.servletContext.contextPath}/resources/js/bookingPay.js"></script>
<%@ include file="../includes/footer.jsp"%>

</body>
</html>