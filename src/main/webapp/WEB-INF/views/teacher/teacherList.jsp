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
	p {
		margin: 20px 0px;
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
		height: 180px;
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
	
	<!--모달창 -->
	button[type=submit] {
	  background-color: #04AA6D;
	  color: white;
	  padding: 10px 50px;
	  margin: 8px 0;
	  border: none;
	  cursor: pointer;
	}
	
	.cancelbtn {
	  color: white;
	  border: none;
	  cursor: pointer;
	  text-align: right;
	  padding-right: 10px;
	  font-size: 30px;
	  font-weight:bolder;
	  background-color: #FEC54E;
	}
	
	label {
		font-size: 20px;
    	font-weight: bold;
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
	
	.teClick{
		width: 50%;
		background-color: #FFF49C;
		margin-bottom: 10px;
		padding: 10px 0px;
		border: none;
		border-radius: 12px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
	<%@ include file="../includes/userHeader.jsp"%>



	<div class="container">
		<img src="${pageContext.servletContext.contextPath}/resources/images/teacherlist.png" style="margin-bottom: 20px">
		<!-- 커리큘럼 모달창 -->
			<div class="link2" style="text-align: center;">
				<button type="button" class="teClick" onclick="document.getElementById('id02').style.display='block'">선생님 교육 커리큘럼 보기</button>
			</div>
			<hr style="margin: 40px 0px;">
			<div id="id02" class="modal">
				<form class="modal-content animate" style="width: 50%;">
				<button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn">X</button>
				    <div class="container" style="background-color: #FEC54E;">
				    	<img src="${pageContext.servletContext.contextPath}/resources/images/curriculum.png" style="width: 130%; height: 50%;">
				    
				    </div>
				</form>
			</div>
		
		<div class="info">
			현재 슬기로운 돌봄생활은 서울시 내에서만 제공가능합니다. <br>검색하고자 하는 자치구를 선택하여 선생님 소개를
			확인해 보세요.
		</div>

		<div class="teacheraddr">
			<c:out value="${searchtxt}"></c:out>
		</div>
		
		<form method="get" action="teacherList" class="checklist">
			<select name="searchtxt"
				style="width: 800px; margin-left: 20px; margin-right: 20px; padding: 10px 0px; border: 1px solid;">
				<option value="">&nbsp;&nbsp;&nbsp;지역을 선택하세요.</option>
				<option value="강동구">강동구</option>
				<option value="강북구">강북구</option>
				<option value="강서구">강서구</option>
				<option value="관악구">관악구</option>
				<option value="광진구">광진구</option>
				<option value="구로구">구로구</option>
				<option value="금천구">금천구</option>
				<option value="노원구">노원구</option>
				<option value="도봉구">도봉구</option>
				<option value="동대문구">동대문구</option>
				<option value="동작구">동작구</option>
				<option value="마포구">마포구</option>
				<option value="서대문구">서대문구</option>
				<option value="서초구">서초구</option>
				<option value="성동구">성동구</option>
				<option value="성북구">성북구</option>
				<option value="송파구">송파구</option>
				<option value="양천구">양천구</option>
				<option value="영등포구">영등포구</option>
				<option value="용산구">용산구</option>
				<option value="은평구">은평구</option>
				<option value="종로구">종로구</option>
				<option value="중구">중구</option>
				<option value="중랑구">중랑구</option>
			</select>
			<button type="submit" style="background-color: white; color: black; padding: 10px;"><i class="fa fa-search"></i></button>
		</form>



		<div class="row">

			<c:if test="${list!=null}">
				<c:forEach var="item" items="${list }">

					<div class="col-4" style="margin-bottom: 30px; margin-top: 20px;">
						<p></p>

						<div class="card">
							<div class="card-header" style="height: 300px">
								<div class="circle">
									<img src="/carelife/${path }/${item.tphoto}"
										class="teacherimg" width="200px" height="200px" />
								</div>
							</div>

							<div class="card-body">
								<h5 class="card-title">
									<c:out value="${item.tname}" />
									&nbsp;선생님
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

		<div class="page">
			<!-- 검색 + 페이징 -->
			<c:if test="${page.prev }">
				<a
					href="teacherList?currPage=${page.startBlock-1}&searchtxt=${searchtxt}">
					<c:out value="이전" />
				</a>
			</c:if>

			<c:forEach var="index" begin="${page.startBlock }"
				end="${page.endBlock }">
				<c:if test="${index == page.currPage }">
					<c:out value="${index }"></c:out>
				</c:if>
				<c:if test="${index != page.currPage }">
					<a href="teacherList?currPage=${index }&searchtxt=${searchtxt}">
						<c:out value="${index }"></c:out>
					</a>
				</c:if>
			</c:forEach>

			<c:if test="${page.next}">
				<a
					href="teacherList?currPage=${page.endBlock+1}&searchtxt=${searchtxt}">
					<c:out value="다음"></c:out>
				</a>
			</c:if>
		</div>
	</div>
<script>
		var modal2 = document.getElementById('id02');
		
		window.onclick = function() {
	    	console.log("admin");
		    if (event.target == modal2) {
		        modal2.style.display = "none";
		    }
		}
	</script>
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>