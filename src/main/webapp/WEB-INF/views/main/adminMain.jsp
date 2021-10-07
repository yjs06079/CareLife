<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슬기로운 돌봄생활</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	.img{
		text-align: center;
		margin-bottom: 50px;
	}
</style>
</head>
<body>
	<%@ include file="../includes/adminHeader.jsp"%>
	
	<div class="img">
		<img alt="admin" src="${pageContext.servletContext.contextPath}/resources/images/adminMain.png" >
	</div>
	
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>