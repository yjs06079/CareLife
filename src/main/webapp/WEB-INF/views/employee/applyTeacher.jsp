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
	
	.link {
		margin: 20px;
	}
	
	a {
		text-decoration: underline;
	}
	
	#btn {
		background-color: #FFF49C;
		font-weight: bold;
		margin-bottom: 10px;
		padding: 10px 15px;
		border: none;
		border-radius: 12px;
	}
	
	#form {
/* 		border: 1px solid #FFD754; */
		padding: 20px;
		width: 450px;
		margin: 0px auto;
		text-align: left;
	}
	
	input[type="submit"] {
		background-color: #FFCD4A;
		font-weight: bold;
		margin-top: 20px;
		margin-bottom: 10px;
		padding: 10px 50px;
		border: none;
		border-radius: 12px;
	}
	
	#namediv {
		margin-bottom: 10px;
	}
</style>
</head>
<body>
	<%@ include file="../includes/userHeader.jsp"%>
	
	<div class="all">
		<h1>아이들의 새로운 선생님이 되어주세요!</h1>
		<p>아래의 지원서 양식을 다운받아 작성하세요.</p>
		<p>파일명은 <b>[이름_이력서.hwp]</b> 형식으로 제출해주세요.</p>
		<div class="link">
			<button id="btn" onclick="location.href='download'">이력서 양식 다운받기</button>
		</div>
		<form action="applyresult" method="post">
	   		<div id="form">
	   			<div id="namediv">
					<label for="e_name">지원자 이름</label>
					<input type="text" id="e_name" name="e_name" required="required">
				</div>
				<div id="filediv">
					<label for="e_file">이력서 첨부</label>
					<input type="file" id="e_file" name="e_file" required="required">
				</div>
			</div>
			<input type="submit" value="지원하기">
		</form>
	</div>
	
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>