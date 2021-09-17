<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슬기로운 돌봄생활</title>
<style>
	body {
		background-color: #FFF49C;
	}
	
	.all {
		text-align: center;
	}
	
	#user {
		background-color: #FFCD4A;
		font-size: 25px;
		font-weight: bold;
		margin-bottom: 10px;
		padding: 10px 15px;
		border: none;
		border-radius: 12px;
	}
	
	.link1 {
		margin-bottom: 8px;
	}
	
	a {
		text-decoration: none;
		font-size: 15px;
	}
	
	a:link {
		color: black;
	}
</style>
</head>
<body>
	<div class="all">
		<img alt="logo" src="${pageContext.servletContext.contextPath}/resources/images/helloLogo2.png">
		<div class="btn">
			<button id="user" onclick="location.href='usermain'">돌봄 서비스 이용하기</button>
			<div class="link1">
				<a href="teachermain">선생님이신가요?</a>
			</div>
			<div class="link2">
				<a href="adminmain">관리자이신가요?</a>
			</div>
		</div>
	</div>
</body>
</html>