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
	
	table {
	  border-collapse: collapse;
	  border-spacing: 0;
	  width: 80%;
	  border: 1px solid;
	  margin: 0px auto;
	  text-align: center;
	}
	
	th, td {
	  border: 1px solid;
	  padding: 16px;
	  text-align: center;
	}
	
	th {
		background-color: #FFF49C;
	}
	
	#table {
		margin-bottom: 20px;
	}
	
	.page{
		text-align: center;
		margin-bottom: 50px;
	}
	
	.info {
	   margin-bottom: 20px;
	}
</style>
<script>
	if(${size } <= 0) {
		alert("잘못된 사원 정보입니다.\n다시 입력해주세요.");
		location.href="${pageContext.servletContext.contextPath}/teachermain";
	} 
</script>
</head>
<body>
	<%@ include file="../includes/teacherHeader.jsp"%>
	
	<div class="all">
		<div id="info">
		     <h3>상세 내역은 보호자명을 클릭한 후 조회 가능합니다.</h3>
		     <br>
		</div>
		<div id="table">
			<table>
				<thead>
			    	<tr>
			    		<th>예약 번호</th>
			    		<th>선생님명</th>
			    		<th>보호자명</th>
			    		<th>주소</th>
			      		<th>일자</th>
			      		<th>오전/오후</th>
			      		<th>시간</th>
			    	</tr>
			  	</thead>
			  	<tbody>
			  		<c:forEach var="item" items="${list }">
			  			<c:choose>
			  				<c:when test="${item.boCancel eq 'x' }">
			  					<tr>
			  						<td><p style="text-decoration:line-through; color: red">${item.boNo }</p></td>
			  						<td><p style="text-decoration:line-through; color: red">${item.tname }</p></td>
			  						<td><a href="bookinglist/detail/${item.boNo }"><p style="text-decoration:line-through; color: red">${item.pname }</p></a></td>
			  						<td><p style="text-decoration:line-through; color: red">${item.boRoadName }</p></td>
			  						<td><p style="text-decoration:line-through; color: red">${item.boDate }</p></td>
			  						<c:choose>
						      		<c:when test="${item.boTime eq 0 }">
						      			<td><p style="text-decoration:line-through; color: red">오전</p></td>
						      		</c:when>
						      		<c:when test="${item.boTime eq 1 }">
						      			<td><p style="text-decoration:line-through; color: red">오후</p></td>
						      		</c:when>
						      	</c:choose>
			  						<td><p style="text-decoration:line-through; color: red">${item.boHour }시간</p></td>
			  					</tr>
			  				</c:when>
			  				<c:when test="${item.boCancel ne 'x' }">
						  		<tr>
						  			<td><c:out value="${item.boNo }"></c:out></td>
						  			<td><c:out value="${item.tname }"></c:out></td>
						  			<td><a href="bookinglist/detail/${item.boNo }"><c:out value="${item.pname }"></c:out></a></td>
							  		<td><c:out value="${item.boRoadName }"></c:out></td>
									<td><c:out value="${item.boDate }"></c:out></td>
									<c:choose>
							      		<c:when test="${item.boTime eq 0 }">
							      			<td>오전</td>
							      		</c:when>
							      		<c:when test="${item.boTime eq 1 }">
							      			<td>오후</td>
							      		</c:when>
							      	</c:choose>
							      	<c:choose>
				    					<c:when test="${dto.boHour eq 0 }">
											<td><c:out value="1시간"></c:out></td>
										</c:when>
										<c:when test="${dto.boHour eq 1 }">
											<td><c:out value="2시간"></c:out></td>
										</c:when>
										<c:when test="${dto.boHour eq 2 }">
											<td><c:out value="3시간"></c:out></td>
										</c:when>
										<c:when test="${dto.boHour eq 3 }">
											<td><c:out value="4시간"></c:out></td>
										</c:when>
									</c:choose>
								</tr>
							</c:when>
						</c:choose>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- 페이징 -->
	<div class="page">
		<!-- 이전페이지 -->
		<c:if test="${page.prev }">
			<a href="bookinglist?currPage=${page.startBlock-1}&tno=${dto.tno}&tname=${dto.tname}">
				<c:out value="이전" />
			</a>
		</c:if>
		
		<!-- 현재 페이지 -->
		<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
			<c:if test="${index == page.currPage }">
				<c:out value="${index }"></c:out>
			</c:if>
			<c:if test="${index != page.currPage }">
				<a href="bookinglist?currPage=${index }&tno=${dto.tno}&tname=${dto.tname}">
					<c:out value="${index }"></c:out>
				</a>
			</c:if>
		</c:forEach>
		
		<!-- 다음 페이지 -->
		<c:if test="${page.next}">
			<a href="bookinglist?currPage=${page.endBlock+1}&tno=${dto.tno}&tname=${dto.tname}">
				<c:out value="다음"></c:out>
			</a>
		</c:if>
	</div>
	
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>