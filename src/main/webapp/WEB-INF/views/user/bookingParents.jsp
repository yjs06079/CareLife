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
   }
   
   #form {
      padding: 20px;
      width: 500px;
      margin: 0px auto;
      text-align: center;
   }
   
   #sendPhoneNumber, #checkBtn {
      background-color: #FFF49C;
      font-weight: bold;
      margin-bottom: 10px;
      padding: 10px 15px;
      border: none;
      border-radius: 12px;
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
   
   #namediv {
		margin-bottom: 10px;
	}
   
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>

   <%@ include file="../includes/userHeader.jsp"%>
   
   
<!-- Modal -->
<div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title" id="exampleModalLabel">hi</h1>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <h3>인증번호를 다시 확인해주세요</h3> 
      </div>
      <div class="modal-footer">
        <input type="button" value="확인" id="yes"  onClick="location.href = 'http://localhost:8080/carelife/usermain/bookingparents'">
      </div>
    </div>
  </div>
</div>
 
   
<div class="all">

   <form class="infoForm" action="bookinginfo" method="post">
		
      
      <h1> 보호자의 정보를 입력해주세요. </h1>
      <p> 보호자의 정보는 돌봄 예약 서비스 이용시 </p>
      <p> 돌봄 선생님에게 정보가 제공됩니다. </p>
      
      <br>
      
      <div id="form">
         <div id="namediv">
            <label for="pname"> 보호자이름 </label>
            <input type="text" id="pname" name="pname"style="width: 70%">
         </div>
         
         <br>
         
         <div id="namediv">
            <label for="pphone"> 핸드폰번호 </label>
            <input type="text" id="pphone" name="pphone"  style="width: 40%">
            <button  type="button" id="sendPhoneNumber" name="sendPhoneNumber"  style="width: 28%">인증번호 발송</button>
         </div>
         
         <br>
         
         <div id="namediv">
            <label for="confirm"> 인증번호 </label>
            <input type="text" id="confirm" name="confirm"  style="width: 40%">
            <button type="button" id="checkBtn" name="checkBtn"  style="width: 28%">인증번호 확인</button>
         </div>
                   
         <br>
         
         <div id="namediv">
            <label for="psubPhone"> 보조연락처 </label>
            <input type="text" id="psubPhone" name="psubPhone"  style="width: 70%">
         </div>
         
         <br>
         
         <button  type="button" id="resultVal" name="resultVal">다음</button>
      </div>
   </form>
   

</div>
<script src="${pageContext.servletContext.contextPath}/resources/js/bookingSMSSend.js"></script>      

<%@ include file="../includes/footer.jsp"%>

</body>
</html>