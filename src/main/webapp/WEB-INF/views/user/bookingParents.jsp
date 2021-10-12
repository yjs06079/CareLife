<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슬기로운 돌봄생활</title>
<style>
	.info {
		margin-bottom: 20px;
		text-align: center;
	}

	#btn {
		background-color: #FFF49C;
		margin: 10px 0px;
		padding: 10px 0px;
		border: none;
		border-radius: 12px;
		width: 100%;
	}
	
	#sendPhoneNumber, #checkBtn {
		background-color: #FFF49C;
		margin-left: 2%;
		padding: 15px 0px;
		border: none;
		border-radius: 12px;
		width: 28%;
	}
	
	#resultVal {
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
	}
	
	.col-25 {
		-ms-flex: 50%; /* IE10 */
		flex: 50%;
	}
	
	.col-75 {
		-ms-flex: 75%; /* IE10 */
		flex: 75%;
	}
	
	.col-25, .col-75 {
		padding: 0 16px;
	}
	
	input[type=text] {
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
	
	.sendSMS {
		width: 100%;
		display: inline-table;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>

	<%@ include file="../includes/userHeader.jsp"%>

	<form class="infoForm" action="bookinginfo" method="post">
		<div class="info">
			<h1>보호자의 정보를 입력해주세요.</h1>
			<p>보호자의 정보는 돌봄 예약 서비스 이용시</p>
			<p>돌봄 선생님에게 정보가 제공됩니다.</p>
		</div>
		<div class="all">
			<div class="row">
				<div class="col-75">
					<div class="container">
						<hr>
						<div class="row">
							<label for="pname"> 보호자 이름 </label> 
							<input type="text" id="pname" name="pname">
							
							<label for="pphone"> 휴대폰 번호 </label>
							<div class="sendSMS">
								<input type="text" id="pphone" name="pphone" style="width: 70%">
								<button type="button" id="sendPhoneNumber" name="sendPhoneNumber">인증번호 발송</button>
							</div>
							
							<label for="confirm"> 인증번호 </label>
							<div class="sendSMS">
								<input type="text" id="confirm" name="confirm" style="width: 70%">
								<button type="button" id="checkBtn" name="checkBtn">인증번호 확인</button>
							</div>
							
							<label for="psubPhone"> 보조연락처 </label>
							<input type="text" id="psubPhone" name="psubPhone">
						</div>
						<hr>
						<button type="button" id="resultVal" name="resultVal">다음</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	
	<script src="${pageContext.servletContext.contextPath}/resources/js/bookingSMSSend.js"></script>

	<%@ include file="../includes/footer.jsp"%>

</body>
</html>