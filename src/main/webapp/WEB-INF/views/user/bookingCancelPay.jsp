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

	<form action="bookingcancelpayresult" method="post">
	
	
	<input type="hidden" value="${bookingDTO.pno }" name="pno" id="pno">
	<input type="hidden" value="${bookingDTO.boNo }" name="boNo" id="boNo">
   <input type="hidden" value="${bookingDTO.boAddr }" name="boAddr" id="boAddr">
   <input type="hidden" value="${bookingDTO.tno }" name="tno" id="tno">
   <fmt:formatDate var="boDate" value="${bookingDTO.boDate}" pattern="yyyy-MM-dd" />
   <input type="hidden" value="${boDate }" name="boDate" id="boDate">
   <input type="hidden" value="${bookingDTO.boTime }" name="boTime" id="boTime" >
   <input type="hidden" value="${bookingDTO.boHour }" name="boHour" id="boHour">
   <input type="hidden" value="${bookingDTO.boRoadName }" name="boRoadName" id="boRoadName">
   <input type="hidden" value="${bookingDTO.boRoadNameDetail }" name="boRoadNameDetail" id="boRoadNameDetail">
   <input type="hidden" value="${bookingDTO.boRemarks }" name="boRemarks" id="boRemarks">
   <input type="hidden" value="${bookingDTO.boPayment }" name="boPayment"  id="boPayment"><br>
   <input type="hidden" value="${bookingDTO.boCancel }" name="boCancel"  id="boCancel" ><br>

		<h1> 보호자의 정보로 예약을 조회 할 수 있습니다. </h1>
	    <p> 예약조회가 이루어지지 않을 시  </p>
	    <p> 슬기로운 돌봄생활로 문의하시기 바랍니다.  </p>
	    
	    <br>
	
		 <div id="infoForm">
            <label for="pname"> 환불계좌 예금주 </label>
            <input type="text" id="cancleName" name="cancleName">
	         
	           <br>
	         
            <label for="pphone"> 환불계좌 은행 </label>
            <input type="text" id="cancleBank" name="cancleBank">
        
           <br>
        
             <label for="pname"> 환불계좌 계좌번호 </label>
             <input type="text" id="cancleAccount" name="cancleAccount">
	         
	         <br>
	         
            <label for="pphone"> 환불계좌 예금주 연락처 </label>
            <input type="text" id="canclePhone" name="canclePhone">
        
         
         <br>
         

         <input type="button" value="목록으로" id="list" name="list">
         <input type="button"  id="cancel" name="cancel" value="결제취소">
	</form>
</div>
<script src="${pageContext.servletContext.contextPath}/resources/js/bookingCheckResult.js"></script>
<%@ include file="../includes/footer.jsp"%>
</body>
</html>