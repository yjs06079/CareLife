<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<title>슬기로운 돌봄생활</title>
<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> -->
<style>
p {
	margin: 20px 0px;
}

.container {
	/*  width: 1120px;
  max-width: none !important; */
	/* text-align: center; */
	
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

.info {
	margin-bottom: 30px;
	font-size: 20px;
	text-align: center;
}

.form {
	margin-bottom: 20px;
	text-align: center;
}
.page{
	text-align: center;
}
.row{
	margin-top: 20px;
}
.teacheraddr{
	text-align: center;
	font-size: 30px;
	font-weight: bold;
}
.checklist{
	text-align: center;
}
</style>

</head>
<body>
	<%@ include file="../includes/userHeader.jsp"%>

	<div class="container">
		<div class="info">
			현재 슬기로운 돌봄생활은 서울시 내에서만 제공가능합니다. <br>검색하고자 하는 자치구를 선택하여 선생님 소개를
			확인해 보세요.
		</div>

		<div class="teacheraddr">
			<c:out value="${searchtxt}"></c:out>
		</div>
		
		<form method="get" action="teacherList" class="checklist">
			<select name="searchtxt"
				style="width: 800px; margin-left: 20px; margin-right: 20px; padding: 10px 0px;">
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
			<button type="submit" style="background-color: white;"><i class="fa fa-search"></i></button>
		</form>



		<div class="row">

			<c:if test="${list!=null}">
				<c:forEach var="item" items="${list }">

					<div class="col-4" style="margin-bottom: 30px">
						<p></p>

						<div class="card">
							<div class="card-header" style="height: 300px">
								<div class="circle">
									<img src="<spring:url value='/images/${item.tphoto}' />"
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

	<!-- 
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script> -->

	<%@ include file="../includes/footer.jsp"%>
</body>
</html>