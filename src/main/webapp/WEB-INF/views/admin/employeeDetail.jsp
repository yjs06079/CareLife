<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
	
	input[type=button] {
		width: 500px;
		padding: 10px;
		margin: 8px 0;
		border: none;
		border-radius: 12px;
	}
	
	#pass {
	  color: white;
	  background-color: #04AA6D;
	}
	
	#nonpass {
	  color: white;
	  background-color: #f44336;
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
	
	.col-25,
	.col-75 {
	  padding: 0 16px;
	}
	
	input[type=text], input[type=file], textarea {
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
</head>
<body>
	<%@ include file="../includes/adminHeader.jsp"%>
	
	<div class="all">
		<div id="info">
			<h1>${dto.ename }님의 이력서입니다.</h1>
			<input type="hidden" value="${dto.eno }">
			<img src="<spring:url value='/images/${dto.ephoto}' />" class="employeeimg" width="200px" height="200px" />
		</div>
		<div class="row">
		  <div class="col-75">
		    <div class="container">
		      <form method="post">
		      <hr>
		      <h3 style="margin-top: 20px;">지원자 인적사항</h3>
		        <div class="row">
		            <label for="eName">이름</label>
		            <input type="text" id="eName" name="ename" value="${dto.ename}" readonly>
		            
		            <label for="eBirth">생년월일</label>
		            <input type="text" id="eBirth" name="ebirth" value="${dto.ebirth }" readonly>
		            
		            <label for="ePhone">휴대폰 번호</label>
		            <input type="text" id="ePhone" name="ephone" value="${dto.ephone }" readonly>
		            
		            <label for="eAddr">주소</label>
		            <input type="text" id="eAddr" name="eaddr" value="${dto.eaddr }" readonly style="margin-bottom: 5px">
		        </div>
		        <hr>
		        
		        <h3>지원자 이력사항</h3>
		        <div class="row">   
		            <label for="eEdu">최종 학력 사항</label>
		            <input type="text" id="eEdu" name="eedu" value="${dto.eedu }" readonly>
		            
		            <label for="eCareer">경력 사항</label>
		            <input type="text" id="eCareer" name="ecareer" value="${dto.ecareer }" readonly>
		            
		            <label for="eLicense">자격 사항</label>
		            <input type="text" id="eLicense" name="elicense" value="${dto.elicense }" readonly>
		        </div>
		        <hr>
		        
		        <h3>지원자 자기소개</h3>
		        <div class="row">
		            <textarea rows="10" cols="30" id="eInfo" name="einfo" readonly>${dto.einfo }</textarea>
		        </div>
		        <hr>
		        <c:if test="${dto.epass eq 0 }">
			        <input type="button" id="nonpass" value="불합격" onclick="location.href='http://localhost:8080/carelife/adminmain/nonpass/${dto.eno}'">
			        <input type="button" id="pass" value="합격" onclick="location.href='http://localhost:8080/carelife/adminmain/pass/${dto.eno}'">
			    </c:if>
		      </form>
		    </div>
		  </div>
		</div>
	</div>
	
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>