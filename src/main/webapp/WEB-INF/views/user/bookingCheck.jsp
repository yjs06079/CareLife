<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슬기로운 돌봄생활</title>

<style>
	* {
		box-sizing: border-box;
	}
	
	h1, p {
		text-align: center;
	}
	
	input[type=text] {
		width: 100%;
		padding: 15px;
		margin: 5px 0 22px 0;
		display: inline-block;
		border: 1px solid #ccc;
		background: #f1f1f1;
	}
	
	#btn {
		background-color: #FFF49C;
		margin-top: 10px;
		margin-bottom: 30px;
		padding: 10px 0px;
		border: none;
		border-radius: 12px;
		width: 100%;
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


	<form action="bookingcheck" method="post">
		<div class="container">
			<h1>보호자의 정보로 예약을 조회할 수 있습니다.</h1>
			<p>예약조회가 이루어지지 않을 시</p>
			<p>슬기로운 돌봄생활로 문의하시기 바랍니다.</p>
			<hr>

			<label for="pname"> 보호자 이름 </label> 
			<input type="text" id="pname" name="pname">
			
			<label for="pphone"> 휴대폰 번호 </label> 
			<input type="text" id="pphone" name="pphone">
			<hr>
			
			<input type="submit" value="조회하기" id="btn">
		</div>
	</form>

	<%@ include file="../includes/footer.jsp"%>
</body>
</html>