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
</head>
<body>

  <%@ include file="../includes/userHeader.jsp"%>
   
<div class="all">

	<form action="bookingpayresult" method="post">
	
		<div id="form">
			<h1> 예약확정을 위해 결제해주세요. </h1>
	        <p> 결제 진행 후 담당선생님에게 예약정보가 안내됩니다. </p>
			
			<!-- 결제 api -->		
			
			<button  type="submit" id="btn" name="btn" >찐 결제완료 후 예약  insert!!!!</button>
			
			<!-- dto정보  -->
			<div hidden="true">
				<c:out value="${bDTO.boAddr }"></c:out> <br>
				<fmt:formatDate var="boDate" value="${bDTO.boDate}" pattern="yyyy-MM-dd" />
				<c:out value="${boDate }"></c:out> <br>
				<c:out value="${bDTO.boTime }"></c:out> <br>
				<c:out value="${bDTO.boHour }"></c:out> <br>
				<c:out value="${bDTO.boRoadName }"></c:out> <br>
				<c:out value="${bDTO.boRoadNameDetail }"></c:out> <br>
				<c:out value="${bDTO.boRemarks }"></c:out> <br>
				
				<div style="background-color: yellow;">
					<input type="text" value="${bDTO.boAddr }" name="boAddr">
					<input type="text" value="${boDate }" name="boDate">
					<input type="text" value="${bDTO.boTime }" name="boTime">
					<input type="text" value="${bDTO.boHour }" name="boHour">
					<input type="text" value="${bDTO.boRoadName }" name="boRoadName">
					<input type="text" value="${bDTO.boRoadNameDetail }" name="boRoadNameDetail">
					<input type="text" value="${bDTO.boRemarks }" name="boRemarks">
				</div>
				
			</div>
			
		</div>
	</form>
</div>
<%@ include file="../includes/footer.jsp"%>

</body>
</html>