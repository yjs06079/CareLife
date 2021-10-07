<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<title>슬기로운 돌봄생활</title>
<style>
	.all {
	   text-align: center;
	   padding: 20px 0px;
	}
	.list{
	   width: 80%;
	   margin: 0px auto;
	}
	.page{
	   text-align: center;
	   margin-bottom: 50px;
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
	
	.calTotal{
	   font-size:18px;
	   text-align: right;
	}
	
	.info {
	   margin-bottom: 20px;
	}
</style>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
</head>

<body>
   <%@ include file="../includes/adminHeader.jsp"%>
   <div class="all">
	  <div id="info">
         <h3>상세 내역은 보호자명을 클릭한 후 조회 가능합니다.</h3>
         <br>
      </div>
      <div class="list">
         <form method="get" action="bookinglist">
            <select name="search" style="width: 100px; height: 30px; border: 1px solid;">
               <option value="t_no">사원번호</option>
               <option value="t_name">선생님 이름</option>
            </select> 
            <input type="text" name="searchtxt" style="width: 300px; height: 30px; margin-left: 20px; margin-right: 20px; padding: 10px 0px;border: 1px solid;">
            <button type="submit" style="background-color: white;"><i class="fa fa-search"></i></button>
         </form>
         
         <div class="calTotal">총 매출&nbsp; | &nbsp;${bototal}원</div>
      </div>
      
      <table>
         <thead>
            <tr>
               <th>예약번호</th>
               <th>보호자명</th>
               <th>사원번호</th>
               <th>사원명</th>
               <th>결제금액</th>
            </tr>
         </thead>

         <tbody>
            <c:forEach var="item" items="${list}">
            	<c:choose>
            		<c:when test="${item.bopayment eq 0}">
		               <tr>
		                  <td><p style="text-decoration:line-through; color: red">${item.bono}</p></td>
		                  <td><a href="bookinglist/detail/${item.bono }"><p style="text-decoration:line-through; color: red">${item.pname }</p></a></td>
		                  <td><p style="text-decoration:line-through; color: red">${item.tno}</p></td>
		                  <td><p style="text-decoration:line-through; color: red">${item.tname}</p></td>
		                  <td><p style="text-decoration:line-through; color: red">${item.bopayment}</p></td>
		               </tr>
               		</c:when>
               		<c:when test="${item.bopayment ne 0}">
               			<tr>
               				<td>${item.bono}</td>
               				<td><a href="bookinglist/detail/${item.bono }">${item.pname }</a></td>
               				<td>${item.tno}</td>
               				<td>${item.tname}</td>
               				<td>${item.bopayment}</td>
               			</tr>
               		</c:when>
               </c:choose>
            </c:forEach>
         </tbody>

      </table>

      <br>
      <div class="page">
         <!-- 검색 + 페이징 -->
         <c:if test="${page.prev }">
            <a
               href="bookinglist?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt}">
               <c:out value="이전" />
            </a>
         </c:if>

         <c:forEach var="index" begin="${page.startBlock }"
            end="${page.endBlock }">
            <c:if test="${index == page.currPage }">
               <c:out value="${index }"></c:out>
            </c:if>
            <c:if test="${index != page.currPage }">
               <a
                  href="bookinglist?currPage=${index }&search=${search }&searchtxt=${searchtxt}">
                  <c:out value="${index }"></c:out>
               </a>
            </c:if>
         </c:forEach>

         <c:if test="${page.next}">
            <a
               href="bookinglist?currPage=${page.endBlock+1}&search=${search}&searchtxt=${searchtxt}">
               <c:out value="다음"></c:out>
            </a>
         </c:if>
      </div>
   </div>
   
   <%@ include file="../includes/footer.jsp"%>
</body>
</html>