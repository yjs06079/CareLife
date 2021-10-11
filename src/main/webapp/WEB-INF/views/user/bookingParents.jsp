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
	
	 	#sendPhoneNumber {
		background-color: #FFF49C;
		margin: 10px 0px;
		padding: 10px 0px;
		border: none;
		border-radius: 12px;
		width: 100%;
	}
	
	 	#checkBtn {
		background-color: #FFF49C;
		margin: 10px 0px;
		padding: 10px 0px;
		border: none;
		border-radius: 12px;
		width: 100%;
	}
	
	 	#resultVal {
		background-color: #FFF49C;
		margin: 10px 0px;
		padding: 10px 0px;
		border: none;
		border-radius: 12px;
		width: 100%;
	}
	
	 	#listbtn {
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
	
	input[type=text], input[type=file] {
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>

   <%@ include file="../includes/userHeader.jsp"%>
   

 
   
<div class="all">

  
		      <form class="infoForm" action="bookinginfo" method="post">
      
      <h1> 보호자의 정보를 입력해주세요. </h1>
      <p> 보호자의 정보는 돌봄 예약 서비스 이용시 </p>
      <p> 돌봄 선생님에게 정보가 제공됩니다. </p>
      
      <br>
      <div class="all">
     <div class="row">
		  <div class="col-75">
		    <div class="container">
		      <hr>
		     

		
		      <hr>
		        <div class="row">
		            <label for="pname"> 보호자이름 </label>
		            <input type="text" id="pname" name="pname">
		            
				    <label for="pphone"> 핸드폰번호 </label>
		            <input type="text" id="pphone" name="pphone">
		            <br>
		            <button  type="button" id="sendPhoneNumber" name="sendPhoneNumber" >인증번호 발송</button>
		            <br>
		            


		           <label for="confirm"> 인증번호 </label>
		           <br>
		           <input type="text" id="confirm" name="confirm" >
		           <br>
		           <button type="button" id="checkBtn" name="checkBtn" >인증번호 확인</button>
		            
		            
		           <label for="psubPhone"> 보조연락처 </label>
           		   <input type="text" id="psubPhone" name="psubPhone">
		            
		           <button  type="button" id="resultVal" name="resultVal">다음</button>
              	  
		          
		            
		        </div>
		        <hr>
	
		   
		    </div>
		  </div>
		</div>
				

		</div>
		
		 
</div>
          </form>

</div>
<script src="${pageContext.servletContext.contextPath}/resources/js/bookingSMSSend.js"></script>      

<%@ include file="../includes/footer.jsp"%>

</body>
</html>