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
	
	.container {
		padding: 16px;
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
	<%@ include file="../includes/teacherHeader.jsp"%>

	<form action="teachermain/bookinglist" method="post">
		<div class="container">
			<h1>사원번호와 사원명으로 로그인해주세요.</h1>
			<p>로그인 후 서비스를 이용하실 수 있습니다.</p>
			<hr>

			<label for="tno"><b>사원번호</b></label>
			<input type="text" name="tno" id="tno" required>
			
			<label for="tno"><b>사원명</b></label>
			<input type="text" name="tname" id="tname" required>
			
			<button type="submit" id="btn">로그인</button>
		</div>
	</form>
	
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>