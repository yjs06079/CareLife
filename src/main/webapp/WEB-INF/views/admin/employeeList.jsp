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
	  width: 60%;
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
</head>
<body>
	<%@ include file="../includes/adminHeader.jsp"%>
	
	<div class="all">
		<div id="info">
	         <h3>상세 내역은 지원자명을 클릭한 후 조회 가능합니다.</h3>
	         <br>
	    </div>
		<div id="table">
			<table>
				<thead>
			    	<tr>
			    		<th>번호</th>
			      		<th>지원자명</th>
			      		<th>합격 여부</th>
			    	</tr>
			  	</thead>
			  	<tbody>
			  		<c:forEach var="item" items="${list }">
					    <tr>
					    	<td><c:out value="${item.eno }"/></td>
					      	<td><a href="employeelist/detail/${item.eno }"><c:out value="${item.ename }"/></a></td>
					      	<c:choose>
					      		<c:when test="${item.epass eq 0 }">
					      			<td><p style="font-weight: bolder">대기중</p></td>
					      		</c:when>
					      		<c:when test="${item.epass eq 1 }">
					      			<td><p style="color: blue; font-weight: bolder;">합격</p></td>
					      		</c:when>
					      		<c:when test="${item.epass eq 2 }">
					      			<td><p style="color: red; font-weight: bolder;">불합격</p></td>
					      		</c:when>
					      	</c:choose>
					    </tr>
			    	</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- 페이징 -->
	<div class="page">
		<!-- 이전페이지 -->
		<c:if test="${page.prev }">
			<a href="employeelist?currPage=${page.startBlock-1}">
				<c:out value="이전" />
			</a>
		</c:if>
		
		<!-- 현재 페이지 -->
		<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
			<c:if test="${index == page.currPage }">
				<c:out value="${index }"></c:out>
			</c:if>
			<c:if test="${index != page.currPage }">
				<a href="employeelist?currPage=${index }">
					<c:out value="${index }"></c:out>
				</a>
			</c:if>
		</c:forEach>
		
		<!-- 다음 페이지 -->
		<c:if test="${page.next}">
			<a href="employeelist?currPage=${page.endBlock+1}">
				<c:out value="다음"></c:out>
			</a>
		</c:if>
	</div>
					
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>