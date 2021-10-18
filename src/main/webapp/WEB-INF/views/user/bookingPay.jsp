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
	  	padding: 20px 0px;
	}
	
	.info {
		margin-bottom: 20px;
	}
	
	#check {
		background-color: #FFF49C;
		margin-bottom: 10px;
		padding: 10px 0px;
		border: none;
		border-radius: 12px;
		width: 100%;
	}
	
 	#btn {
		background-color: #FFF49C;
		margin: 10px 0px;
		padding: 10px 0px;
		border: none;
		border-radius: 12px;
		width: 100%;
	}
	
	.row {
	  display: -ms-flexbox; /* IE10 */
	  display: flex;
	  -ms-flex-wrap: wrap; /* IE10 */
	  flex-wrap: wrap;
	  margin-bottom: 20px;
	  margin-top: 20px;
	}
	
	.col-25 {
	  -ms-flex: 50%; /* IE10 */
	  flex: 50%;
	}
	
	.col-75 {
	  -ms-flex: 75%; /* IE10 */
	  flex: 75%;
	}
	
	.col-25,
	.col-75 {
	  padding: 0 16px;
	}
	
	input[type=text], input[type=file], textarea {
	  width: 100%;
	  margin-bottom: 20px;
	  padding: 15px;
	  border: 1px solid #ccc;
	  border-radius: 3px;
	  background: #f1f1f1;
	}
	
	label {
	  margin-bottom: 10px;
	  display: block;
	  color: black;
	}
	
	hr {
		border: 1px solid #f1f1f1;
		margin-bottom: 25px;
	}
</style>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript">
 window.history.forward();
 function noBack(){window.history.forward();}
</script>
</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">

  <%@ include file="../includes/userHeader.jsp"%>
   
<div class="all">


        <div class="row">
		  <div class="col-75">
		    <div class="container">
		      <form action="bookingcompletionresult" method="post">
		      	<input type="hidden" name="pno" id="pno" value="${pno}">	
				<input type="hidden" name="pname" id="pname" value="${pname}">
				<input type="hidden" name="pphone" id="pphone" value="${pphone}">
				<input type="hidden" name="tno" id="tno" value="${tno}">
		      
		      <hr>
		        <div class="row">
		            <label for="boAddr">예약지역</label>
		            <input type="text" value="${bookingDTO.boAddr }" name="boAddr" id="boAddr">
		            
		            <label for="boDate">예약날짜</label>
		            <fmt:formatDate var="boDate" value="${bookingDTO.boDate}" pattern="yyyy-MM-dd" />
			   		<input type="text" value="${boDate }" name="boDate" id="boDate">
		            
		            <label for="boTime">예약시간대</label>
		            <c:choose>
				    	<c:when test="${bookingDTO.boTime eq 0 }">
				      		<input type="hidden" id="boTime" name="boTime" value="${bookingDTO.boTime }" readonly>
				      		<input type="text" value="오전" readonly>
				      	</c:when>
				      	<c:when test="${bookingDTO.boTime eq 1 }">
				      		<input type="hidden" id="boTime" name="boTime" value="${bookingDTO.boTime }" readonly>
				      		<input type="text" value="오후" readonly>
				      	</c:when>
				    </c:choose>
		            
		            
		            <label for="boHour">예약이용시간</label>
		        	<c:choose>
				    	<c:when test="${bookingDTO.boHour eq 0 }">
		            		<input type="hidden" id="boHour" name="boHour" value="${bookingDTO.boHour }" readonly>
		            		<input type="text" value="1시간" readonly>
		           		</c:when>
		           		<c:when test="${bookingDTO.boHour eq 1 }">
		            		<input type="hidden" id="boHour" name="boHour" value="${bookingDTO.boHour }" readonly>
		            		<input type="text" value="2시간" readonly>
		           		</c:when>
		           		<c:when test="${bookingDTO.boHour eq 2 }">
		            		<input type="hidden" id="boHour" name="boHour" value="${bookingDTO.boHour }" readonly>
		            		<input type="text" value="3시간" readonly>
		           		</c:when>
		           		<c:when test="${bookingDTO.boHour eq 3 }">
		            		<input type="hidden" id="boHour" name="boHour" value="${bookingDTO.boHour }" readonly>
		            		<input type="text" value="4시간" readonly>
		           		</c:when>
		           	</c:choose>
		            
		            <label for="boRoadNameDetail">상세주소</label>
		            <input type="text" value="${bookingDTO.boRoadName }" name="boRoadName" id="boRoadName">
              	    <input type="text" value="${bookingDTO.boRoadNameDetail }" name="boRoadNameDetail" id="boRoadNameDetail">
              	  
		            

		            
		            <label for="boPayment">예약요금</label>	           
              		<input type="text" value="${bookingDTO.boPayment }" name="boPayment"  id="boPayment" ><br>
              		<input type="hidden" value="${bookingDTO.boCancel }" name="boCancel"  id="boCancel" ><br>

		        
		        	<label for="boRemarks">요청사항</label>
		            <textarea rows="10" cols="30" id="boRemarks" name="boRemarks" readonly style="margin-bottom: 5px">${bookingDTO.boRemarks }</textarea>
		            
		        </div>
		        <hr>
		         <button  type="submit" id="btn" name="btn" >결제 완료</button>
		       
		        </form>
		    </div>
		  </div>
		</div>
				

		</div>
		
		 
</div>

<script src="${pageContext.servletContext.contextPath}/resources/js/bookingPay.js"></script>
<%@ include file="../includes/footer.jsp"%>

</body>
</html>