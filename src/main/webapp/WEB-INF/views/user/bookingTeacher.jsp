<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슬기로운 돌봄생활</title>
<style>
	.all {
		text-align: center;
	}
	
	.info {
		margin-bottom: 20px;
	}
	
	#btn {
		background-color: #FFF49C;
		margin-bottom: 10px;
		padding: 10px 0px;
		border: none;
		border-radius: 12px;
		width: 100%;
	}
	
	.circle {
		width: 250px;
		height: 250px;
		border-radius: 70%;
		overflow: hidden;
		display: inline-block;
	}
	
	.teacherimg {
		width: 100%;
		height: 100%;
		object-fit: cover;
		text-align: center;
	}
	
	.card-header {
		width: 100%;
		text-align: center;
	}
	
	.card-title {
		font-weight: bold;
	}
	
	.card-body {
		height: 300px;
	}
	
	.info {
		margin-bottom: 30px;
		font-size: 20px;
		text-align: center;
	}
	
	.page {
		text-align: center;
		margin-bottom: 50px;
	}
	
	.teacheraddr {
		text-align: center;
		font-size: 30px;
		font-weight: bold;
	}
	
	.checklist {
		text-align: center;
	}
	
	hr {
		border: 1px solid #f1f1f1;
		margin-bottom: 25px;
	}
</style>
</head>
<body>
	<%@ include file="../includes/userHeader.jsp"%>
	
	<div class="container">
	    <form action="bookingpay" method="post">
		<div class="all">
			<input type="hidden" name="pno" id="pno" value="${pno}">	
			<input type="hidden" name="pname" value="${pname}">
			<input type="hidden" name="pphone" value="${pphone}">
	
			<div class="info">
				<h1> 담당선생님을 선택해주세요. </h1>
			    <p> 슬기로운 돌봄생활의 선생님들은 </p>
			    <p> 사랑과 정성으로 아이와 함께합니다. </p>
		    </div>
			<hr>
			<div class="row">
				<c:if test="${list!=null}">
					<c:forEach var="item" items="${list }">
						<div class="col-4" style="margin-bottom: 30px; margin-top: 20px;">
							<div class="card">
								<div class="card-header" style="height: 300px">
									<div class="circle">
										<img src="/carelife/${path }/${item.tphoto}" class="teacherimg" width="200px" height="200px" />
									</div>
								</div>
								<div class="card-body">
									<h5 class="card-title">
										<input type="radio" name="tno" id="tno" value="${item.tno}"> 
										<c:out value="${item.tname}" />&nbsp;선생님
									</h5>
									<p class="card-text">
										<c:out value="${item.tinfo}" />
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<hr>
			<input type="submit" id="btn" name="btn" value="결제하기" >
			
			<!-- dto정보  -->
			<input type="hidden" value="${bookingDTO.boAddr }" name="boAddr">
			<fmt:formatDate var="boDate" value="${bookingDTO.boDate}" pattern="yyyy-MM-dd" />
			<input type="hidden" value="${boDate }" name="boDate">
			<input type="hidden" value="${bookingDTO.boTime }" name="boTime">
			<input type="hidden" value="${bookingDTO.boHour }" name="boHour">
			<input type="hidden" value="${bookingDTO.boRoadName }" name="boRoadName">
			<input type="hidden" value="${bookingDTO.boRoadNameDetail }" name="boRoadNameDetail">
			<input type="hidden" value="${bookingDTO.boRemarks }" name="boRemarks">
			<input type="hidden" name="boPayment" value="${bookingDTO.boPayment }"><br>
			<input type="hidden" value="${bookingDTO.boCancel }" name="boCancel"  id="boCancel" ><br>
			</div>
		</form>
	</div>
	
	<%@ include file="../includes/footer.jsp"%>

</body>
</html>