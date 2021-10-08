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




input {
border:none;
text-align: center;
}

</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>

	<%@ include file="../includes/userHeader.jsp"%>

<div class="container">
		<div class="all">
			<h1>예약조회</h1>

				<c:out value="${sessionUserDTO.pname }"></c:out>
				<c:out value="님의 예약 내역입니다."></c:out>
			<p>예약 변경은 예약취소 후 재예약 진행바랍니다.</p>

			<br>


			<table>
				<thead>
					<tr>
						<th>예약번호</th>				
						<th>예약일자</th>
						<th>예약지역</th>
						<th></th>
					</tr>
				</thead>

				<tbody>

					<c:if test="${list != null }">
						<c:forEach var="item" items="${list }">
							<tr>
							<c:choose>
			  				<c:when test="${item.boCancel eq 'x' }">
								<td class="boNo">
								   <input type="text" value="${item.boNo }" id="boNo" readonly="readonly" style="text-decoration:line-through; color: red" >
								</td>
								
								<fmt:formatDate var="boDate" value="${item.boDate}" pattern="yyyy-MM-dd" />
								<td>
									<input type="text" value="${boDate }" id="boDate" name="boDate" readonly="readonly" style="text-decoration:line-through; color: red">
								</td>
								
								<td>
									<input type="text" value="${item.boAddr }" id="boAddr" name="boAddr" readonly="readonly" style="text-decoration:line-through; color: red">
								</td>
							
			                       									
								<td>
									<input type="button" id="btndel" class="btndel" value="상세보기"  onclick="location.href='http://localhost:8080/carelife/usermain/bookingdetail/'+${item.boNo}">
								</td>		
			                         </c:when>
			                         
			                        <c:when test="${item.boCancel ne 'x' }"> 
			                        <td class="boNo">
								   <input type="text" value="${item.boNo }" id="boNo" readonly="readonly">
								</td>
								
								<fmt:formatDate var="boDate" value="${item.boDate}" pattern="yyyy-MM-dd" />
								<td>
									<input type="text" value="${boDate }" id="boDate" name="boDate" readonly="readonly" >
								</td>
								
								<td>
									<input type="text" value="${item.boAddr }" id="boAddr" name="boAddr" readonly="readonly" >
								</td>
		
								<td>
									<input type="button" id="btndel" class="btndel" value="상세보기"  onclick="location.href='http://localhost:8080/carelife/usermain/bookingdetail/'+${item.boNo}">
								</td>	
			                       
			                         </c:when>
			                    </c:choose>
			                  
							
												
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>




			<form action="/carelife/usermain/bookingchecklist" method="post">
				<input type="hidden" name="pname" value="${sessionUserDTO.pname }">
				<input type="hidden" name="pphone" value="${sessionUserDTO.pphone}">




				<!-- 페이징 -->
				<div class="page">
					<!-- 이전페이지 -->
					<c:if test="${page.prev }">
					<!-- currpage에 값을 넘길것 버튼눌렀을때 실행  -->
					    <input type="hidden" name="currPage" value="${page.startBlock-1}">
						<button type="submit" style="background-color:transparent;">이전</button>
					</c:if>

					<!-- 현재 페이지 -->
					<c:forEach var="currPage" begin="${page.startBlock }" end="${page.endBlock }">			
						<c:if test="${currPage == page.currPage }">
							<button type="submit" style="background-color:transparent;">${currPage }</button>
						</c:if>
						<c:if test="${currPage != page.currPage }">
						<input type="hidden" name="currPage" value="${currPage }">				
								<button type="submit" style="background-color:transparent;">${currPage }</button>					
						</c:if>
					</c:forEach>

					<!-- 다음 페이지 -->
					<c:if test="${page.next}">
					<input type="hidden" name="currPage" value="${page.endBlock+1}">								
							<button type="submit" style="background-color:transparent;">다음</button>						
					</c:if>
				</div>
			</form>


		</div>
		
	</div>	
		<%@ include file="../includes/footer.jsp"%>
		
		
		
	<script>
 
   if(${size } == 0) {
	   console.log(${size})
	   alert("조회 할 자료가 없습니다")
	   location.href="${pageContext.servletContext.contextPath}/usermain/bookingcheck";
   } 
 
</script>




	


</body>
</html>