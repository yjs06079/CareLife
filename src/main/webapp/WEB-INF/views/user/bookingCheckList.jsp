<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

#form {
	padding: 20px;
	width: 500px;
	margin: 0px auto;
	text-align: center;
}

#btndel {
	background-color: #FFF49C;
	font-weight: bold;
	margin-bottom: 10px;
	padding: 10px 15px;
	border: none;
	border-radius: 12px;
}

#btn {
	background-color: #FFCD4A;
	font-weight: bold;
	margin-top: 20px;
	margin-bottom: 10px;
	padding: 10px 50px;
	border: none;
	border-radius: 12px;
	width: 400px;
}

table {
	width: 100%;
	border: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #444444;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- iamport.payment.js -->
<script integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
</head>
<body>

	<%@ include file="../includes/userHeader.jsp"%>

	
		<div class="all">
			<h1>예약조회</h1>



			<c:forEach var="item" items="${list }" begin="0" end="0">
				<c:out value="${item.pname }"></c:out>
				<c:out value="님의 예약 내역입니다."></c:out>
			</c:forEach>
			<p>예약 변경은 예약취소 후 재예약 진행바랍니다.</p>

			<br>

			<table>
				<thead>
					<tr>
						<th>예약번호</th>
						<th>지역</th>
						<th>예약일자</th>
						<th>주소</th>
						<th>시간대</th>
						<th>이용시간</th>
						<th>요청사항</th>
						<button onclick="cancelPay()">예약취소</button>
					</tr>
				</thead>

				<tbody>

					<c:if test="${list != null }">
						<c:forEach var="item" items="${list }">
							<input type="hidden" id="" name="" value="">
							<tr>
								<td><input type="text" value="${item.pno }" id="pno"
									name="pno" readonly="readonly"></td>
								<td><input type="text" value="${item.boAddr }" id="boAddr"
									name="boAddr" readonly="readonly"></td>
								<fmt:formatDate var="boDate" value="${item.boDate}"
									pattern="yyyy-MM-dd" />
								<td><input type="text" value="${boDate }" id="boDate"
									name="boDate" readonly="readonly"></td>
								<td><input type="text" value="${item.boRoadName }"
									id="boRoadName" name="boRoadName" readonly="readonly"></td>
								<td><c:if test="${item.boTime==0 }">
										<input type="text" value="오전" id="boTime" name="boTime"
											readonly="readonly">
									</c:if> <c:if test="${item.boTime==1 }">
										<input type="text" value="오후" id="boTime" name=""
											readonly="readonly">
									</c:if></td>
								<td><input type="text" value="${item.boHour }" id="boHour"
									name="boHour" readonly="readonly">시간</td>
								<td><input type="text" value="${item.boRemarks }"
									id="boRemarks" name="boRemarks" readonly="readonly"></td>
								<td><input type="hidden" value="${item.boRemarks }"
									id="boCancel" name="boCancel" readonly="readonly"></td>
								<type>
								<td><input type="button" id="btndel" value="삭제"
									onclick="location='http://localhost:8080/carelife/usermain/bookingcancelpayresult?pno=${item.pno }'">
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>




			<form action="/carelife/usermain/bookingchecklist" method="post">
				<input type="hidden" name="pname" value="${userParentsDTO.pname }">
				<input type="hidden" name="pphone" value="${userParentsDTO.pphone}">




				<!-- 페이징 -->
				<div class="page">
					<!-- 이전페이지 -->
					<c:if test="${page.prev }">
					<!-- currpage에 값을 넘길것 버튼눌렀을때 실행  -->
					    <input type="hidden" name="currPage" value="${page.startBlock-1}">
						<button type="submit">이전</button>
					</c:if>

					<!-- 현재 페이지 -->
					<c:forEach var="currPage" begin="${page.startBlock }" end="${page.endBlock }">			
						<c:if test="${currPage == page.currPage }">
							<button type="submit">${currPage }</button>
						</c:if>
						<c:if test="${currPage != page.currPage }">
						<input type="hidden" name="currPage" value="${currPage }">				
								<button type="submit">${currPage }</button>					
						</c:if>
					</c:forEach>

					<!-- 다음 페이지 -->
					<c:if test="${page.next}">
					<input type="hidden" name="currPage" value="${page.endBlock+1}">								
							<button type="submit">다음</button>						
					</c:if>
				</div>
			</form>

			<div>
				<c:forEach var="item" items="${list }" begin="0" end="0">
					<input type="text" value="${item.pname }" name="pname">
					<input type="text" value="${item.pphone }" name="pphone">
				</c:forEach>
			</div>
		</div>
		
		
	<script>


   if(${size } < 1) {
	   console.log(${size})
	   alert("조회 할 자료가 없습니다")
	   location.href="${pageContext.servletContext.contextPath}/usermain/bookingcheck";
   } 
</script>




	<%@ include file="../includes/footer.jsp"%>


</body>
</html>