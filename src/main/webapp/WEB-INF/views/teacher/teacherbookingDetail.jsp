<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
 	#btn {
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
	  margin-top: 20px;
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
	
	input[type=text], input[type=file] {
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
	<%@ include file="../includes/teacherHeader.jsp"%>
	
	<div class="all">
		<div id="info">
			<h1>${dto.pname }님의 예약 내역입니다.</h1>
			<c:if test="${dto.boCancel eq 'x'}">
				<h5 style="color: red">※ 이미 취소된 예약입니다.</h5>
			</c:if>
		</div>
		<div class="row">
		  <div class="col-75">
		    <div class="container">
		      <form action="cancel/${dto.boNo }" method="post">
		      <hr>
		        <div class="row">
		            <label for="pname">보호자명</label>
		            <input type="text" id="pname" name="pname" value="${dto.pname}" readonly>
		            
		            <label for="pphone">연락처</label>
		            <input type="text" id="pphone" name="pphone" value="${dto.pphone }" readonly>
		            
		            <label for="psubphone">보조 연락처</label>
		            <input type="text" id="psubphone" name="psubphone" value="${dto.psubphone }" readonly>
		            
		            <label for="boRoadName">주소</label>
		            <input type="text" id="boRoadName" name="boRoadName" value="${dto.boRoadName }" readonly>
		            
		            <label for="boDate">날짜</label>
		            <input type="text" id="boDate" name="boDate" value="${dto.boDate }" readonly>
		        
		        	<label for="boTime">오전/오후</label>
		            <c:choose>
				    	<c:when test="${dto.boTime eq 0 }">
				      		<input type="hidden" id="boTime" name="boTime" value="${dto.boTime }" readonly>
				      		<input type="text" value="오전" readonly>
				      	</c:when>
				      	<c:when test="${dto.boTime eq 1 }">
				      		<input type="hidden" id="boTime" name="boTime" value="${dto.boTime }" readonly>
				      		<input type="text" value="오후" readonly>
				      	</c:when>
				    </c:choose>
		        
		        	<label for="boHour">시간</label>
		        	<c:choose>
				    	<c:when test="${dto.boHour eq 0 }">
		            		<input type="hidden" id="boHour" name="boHour" value="${dto.boHour }" readonly>
		            		<input type="text" value="1시간" readonly>
		           		</c:when>
		           		<c:when test="${dto.boHour eq 1 }">
		            		<input type="hidden" id="boHour" name="boHour" value="${dto.boHour }" readonly>
		            		<input type="text" value="2시간" readonly>
		           		</c:when>
		           		<c:when test="${dto.boHour eq 2 }">
		            		<input type="hidden" id="boHour" name="boHour" value="${dto.boHour }" readonly>
		            		<input type="text" value="3시간" readonly>
		           		</c:when>
		           		<c:when test="${dto.boHour eq 3 }">
		            		<input type="hidden" id="boHour" name="boHour" value="${dto.boHour }" readonly>
		            		<input type="text" value="4시간" readonly>
		           		</c:when>
		           	</c:choose>
		        
		        	<label for="boRemarks">요청사항</label>
		            <input type="text" id="boRemarks" name="boRemarks" value="${dto.boRemarks }" readonly style="margin-bottom: 5px">
		        </div>
		        <hr>
		        
		        <c:if test="${dto.boCancel ne 'x'}">
		        	<input type="submit" id="btn" value="예약 취소">
		        </c:if>
		        </form>
		    </div>
		  </div>
		</div>
	</div>
	
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>