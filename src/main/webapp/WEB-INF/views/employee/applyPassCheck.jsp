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
	
	hr {
		border: 1px solid #f1f1f1;
		margin-bottom: 25px;
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
</style>
</head>
<body>
	<%@ include file="../includes/userHeader.jsp"%>

	<form action="passresult" method="post">
		<div class="container">
			<h1>합격 결과 조회</h1>
			<p>지원 시 입력한 이름, 생년월일, 휴대폰 번호로 조회해 주세요.</p>
			<hr>

			<label for="eName"><b>이름</b></label>
			<input type="text" name="ename" id="eName" required>
			
			<label for="eBirth"><b>생년월일</b></label>
			<input type="text" name="ebirth" id="eBirth" required>
			
			<label for="ePhone"><b>휴대폰 번호</b></label>
			<input type="text" name="ephone" id="ePhone" required>
			<hr>
			
			<button type="submit" id="btn">결과 확인하기</button>
		</div>
	</form>

	<%@ include file="../includes/footer.jsp"%>
</body>
</html>