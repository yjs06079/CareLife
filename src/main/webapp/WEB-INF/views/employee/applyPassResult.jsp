<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슬기로운 돌봄생활</title>
<style>
	* {
		box-sizing: border-box;
	}
	
	h1 {
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
		margin: 10px 0px;
		padding: 10px 0px;
		border: none;
		border-radius: 12px;
		width: 100%;
	}
</style>
</head>
<body>
	<%@ include file="../includes/userHeader.jsp"%>
	
	<script>
		if(${size } == 0) {
			alert("잘못된 지원자 정보입니다.\n다시 입력해주세요.");
			location.href="${pageContext.servletContext.contextPath}/usermain/passcheck";
		}
	</script>
	
	<form>
		<div class="container">
			<h1>합격 결과 조회</h1>
			<hr>

			 <c:forEach var="item" items="${dto }">
				<label for="eName"><b>이름</b></label>
				<input type="text" name="ename" id="eName" value="${item.ename }" readonly="readonly">
				
				<label for="eBirth"><b>생년월일</b></label>
				<input type="text" name="ebirth" id="eBirth" value="${item.ebirth }" readonly="readonly">
				
				<label for="ePhone"><b>휴대폰 번호</b></label>
				<input type="text" name="ephone" id="ePhone" value="${item.ephone }" readonly="readonly">
				<hr>
				
				<label for="ePass"><b>합격 여부</b></label>
				<c:choose>
					<c:when test="${item.epass eq 0}">
						<input type="text" name="epass" id="ePass" value="대기중" readonly="readonly">
					</c:when>
					<c:when test="${item.epass eq 1}">
						<input type="text" name="epass" id="ePass" value="합격" readonly="readonly" style="color: blue">
					</c:when>
					<c:when test="${item.epass eq 2}">
						<input type="text" name="epass" id="ePass" value="불합격" readonly="readonly" style="color: red">
					</c:when>
				</c:choose>
			</c:forEach>
		</div>
	</form>
	
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>