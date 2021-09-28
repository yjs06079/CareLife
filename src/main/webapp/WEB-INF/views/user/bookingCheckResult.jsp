<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
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
   
   #btndel{
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
</head>
<body>

 <%@ include file="../includes/userHeader.jsp"%>

<div class="all">

		<h1> 예약조회 </h1>
		
		<c:forEach var="item" items="${list }" begin="0" end="0">
			<c:out value="${item.pname }"></c:out> 
			<c:out value="님의 예약 내역입니다."></c:out>
		</c:forEach>
	    <p> 예약 변경은 예약취소 후 재예약 진행바랍니다. </p>
	    
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
					<th>예약취소</th>
				</tr>
			</thead>
		
			<tbody>
				<c:if test="${list == null }">
					<tr><td colspan="8"> 해당자료가 없습니다.</td></tr>			
				</c:if>
				
				<c:if test="${list != null }">
					<c:forEach var="item" items="${list }">
						<tr>
							<td>${item.pno }</td>
							<td>${item.boAddr }</td>
							<fmt:formatDate var="boDate" value="${item.boDate}" pattern="yyyy-MM-dd" />
							<td>${boDate }</td>
							<td>${item.boRoadName }</td>
							<td>${item.boTime }</td>
							<td>${item.boHour }</td>
							<td>${item.boRemarks }</td>
							<td>
								<input type="button" id="btndel" value="삭제" onclick="location='http://localhost:8080/carelife/usermain/bookingDelete?pno=${item.pno }'" >
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
         
         
	</form>
</div>

<%@ include file="../includes/footer.jsp"%>


</body>
</html>