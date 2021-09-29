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
	
	<!--모달창 -->
	input[type=password] {
	  width: 100%;
	  padding: 20px 40px;
	  margin: 8px 0;
	  display: inline-block;
	  border: 1px solid #ccc;
	  box-sizing: border-box;
	}
	
	/* Set a style for all buttons */
	button[type=submit] {
	  background-color: #04AA6D;
	  color: white;
	  padding: 10px 50px;
	  margin: 8px 0;
	  border: none;
	  cursor: pointer;
	}
	
	.cancelbtn {
	  padding: 10px 50px;
	  color: white;
	  background-color: #f44336;
	  border: none;
	  cursor: pointer;
	}
	
	label {
		font-size: 20px;
    	font-weight: bold;
	}
	
	.container {
	  padding: 20px;
	}
	
	span.psw {
	  float: right;
	  padding-top: 16px;
	}
	
	/* The Modal (background) */
	.modal {
	  display: none; /* Hidden by default */
	  position: fixed; /* Stay in place */
	  z-index: 1; /* Sit on top */
	  left: 0;
	  top: 0;
	  width: 100%; /* Full width */
	  height: 100%; /* Full height */
	  overflow: auto; /* Enable scroll if needed */
	  background-color: rgb(0,0,0); /* Fallback color */
	  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	  padding-top: 60px;
	}
	
	/* Modal Content/Box */
	.modal-content {
	  background-color: #fefefe;
	  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
	  border: 1px solid #888;
	  width: 30%; /* Could be more or less, depending on screen size */
	}
	
	/* The Close Button (x) */
	.close {
	  position: absolute;
	  right: 25px;
	  top: 0;
	  color: #000;
	  font-size: 35px;
	  font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
	  color: red;
	  cursor: pointer;
	}
	
	/* Add Zoom Animation */
	.animate {
	  -webkit-animation: animatezoom 0.6s;
	  animation: animatezoom 0.6s
	}
	
	@-webkit-keyframes animatezoom {
	  from {-webkit-transform: scale(0)} 
	  to {-webkit-transform: scale(1)}
	}
	  
	@keyframes animatezoom {
	  from {transform: scale(0)} 
	  to {transform: scale(1)}
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="all">
		<img alt="logo" src="${pageContext.servletContext.contextPath}/resources/images/helloLogo2.png">
		<div class="btn">
			<!-- 사용자 -->
			<button id="user" onclick="location.href='usermain'">돌봄 서비스 이용하기</button>
			
			<!-- 선생님 -->
			<div class="link1">
				<a id="teacherClick" onclick="document.getElementById('id01').style.display='block'" style="width:auto;">선생님이신가요?</a>
			</div>
			<div id="id01" class="modal">
				<form class="modal-content animate" action="teacherresult" method="post">
				    <div class="container">
				    	<label>사원명과 사원번호를 입력하세요.</label>
				    	<br>
				    	<p>사원명</p>
				      	<input type="text" name="tname" id="tname" style="padding: 10px; width: 80%;" required>
				      	<br>
				      	<p>사원번호</p>
				      	<input type="password" name="tno" id="tno" style="margin-bottom: 20px; padding: 10px; width: 80%;" required>
				      	<br>
				      	<button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">취소</button>
				      	<button type="submit">인증</button>
				    </div>
				</form>
			</div>
			
			<!-- 관리자 -->
			<div class="link2">
				<a id="adminClick" onclick="document.getElementById('id02').style.display='block'" style="width:auto;">관리자이신가요?</a>
			</div>
			<div id="id02" class="modal">
				<form class="modal-content animate" action="adminresult" method="post">
				    <div class="container">
				    	<label for="key">관리자 키를 입력하세요.</label>
				    	<br>
				      	<input type="password" name="key" id="key" style="margin: 20px 0px; padding: 10px; width: 80%;" required>
				      	<br>
				      	<button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn">취소</button>
				      	<button type="submit">인증</button>
				    </div>
				</form>
			</div>
		</div>
	</div>
	<script>
		var modal = document.getElementById('id01');
	
		window.onclick = function(event) {
		    if (event.target == modal) {
		        modal.style.display = "none";
		    }
		}
		
		var modal2 = document.getElementById('id02');
		
		window.onclick = function(event) {
		    if (event.target == modal2) {
		        modal2.style.display = "none";
		    }
		}
	</script>
</body>
</html>