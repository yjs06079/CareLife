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
   
   .card{
   	 width: 220px;
   	 height: 250px;
   	 border-radius: 15px;
   }
</style>
</head>
<body>

 <%@ include file="../includes/userHeader.jsp"%>
   
<div class="all">

	<form action="bookingteacherresult" method="post">
	
	<input type="hidden" name="pno" value="${bDTO.pno }">
	<input type="hidden" name="pName" value="${pName }">
	<input type="hidden" name="pPhone" value="${pPhone}">
		
		<h1> 담당선생님을 선택해주세요. </h1>
	    <p> 사랑과 정성으로 아이와 함께하는 선생님 </p>
	    <p> 슬기로운 돌봄생활과 함께하는 선생님들은 </p>
	    <p> 자녀를 키워본 양육경험, 삶의 연륜에서 나오는 </p>
	    <p> 여유와 인내심으로 아이를 기다려주고, 지지해 줍니다.</p>
		
		  <br>
		  
		  	<!-- 테스트 후 삭제예정  -->
			<c:forEach var="item" items="${list }">
			   <c:out value="${item.boAddr }"></c:out> <br>
			   <fmt:formatDate var="boDate" value="${item.boDate}" pattern="yyyy-MM-dd" />
			   <c:out value="${boDate }"/> <br>
			   <c:out value="${item.boTime }"></c:out> <br>
			</c:forEach>
		  
		  <!-- forEach문 돌려서 사용예정 -->
		  <div id="form">
			  <div class="card" style="float:left; margin-right: 10px;">
				  <img src="" alt="" /> 선생님사진
				  <div class="card-body">
				    <h5 class="card-title"> 선생님이름 ${tName }</h5>
				    <p class="card-text">선생님소개 ${tInfo }</p>
				    <input type="radio" name="tNo" id="tNo" value="${tNo }"> 
			  </div>
			</div>

			  <div class="card">
				  <img src="" alt="" /> 선생님사진
				  <div class="card-body">
				    <h5 class="card-title"> 선생님이름 ${tName }</h5>
				    <p class="card-text">선생님소개 ${tInfo }</p>
				    <input type="radio" name="tNo" id="tNo" value="${tNo }"> 
			  </div>
			</div>
			  
			  <br>
			  
			  <!-- 테스트 후 삭제예정  -->
			  <input type='radio' name='tName' value='이경실' id="tName"/>이경실
			  <input type='radio' name='tName' value='조승우' id="tName" />조승우
			
			  <br>
			
			<input type="submit" id="btn" name="btn" value="결제하기" >
			
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
<script src="${pageContext.servletContext.contextPath}/resources/js/bookingSMSSend.js"></script>      

<%@ include file="../includes/footer.jsp"%>

</body>
</html>