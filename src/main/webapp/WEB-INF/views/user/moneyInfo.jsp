<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슬기로운 돌봄생활</title>
<style>
.info{
	text-align: center;
}
table {
	   border-collapse: collapse;
	   border-spacing: 0;
	   width: 50%;
	   border: 1px solid;
	   margin: 0px auto;
	   text-align: center;
	   margin-bottom: 20px;
	}
	
	th, td {
	   border: 1px solid;
	   padding: 16px;
	   text-align: center;
	}
	
	th {
	   background-color: #FFF49C;
	}
	h2{
	font-weight: bold;
	}
	.go{
		margin: 0px auto;
		width: 30%;
		text-align: center;
		margin-bottom: 20px;
	}
	.gobtn{
		border: solid 2px transparent;
		border-radius: 12px; 
		width: 70%;
		background-color: #FFF49C;
		font-size: 15px;
	}
</style>
</head>
<body>
<%@ include file="../includes/userHeader.jsp"%>

<div class="info">

<img src="${pageContext.servletContext.contextPath}/resources/images/moneyinfo.png" style="margin-bottom: 20px; width: 50%">
		

<br>
	
</div>

<table>
         <thead>
            <tr>
               <th colspan="2">서비스 시간</th>
               <th>시간당 이용 요금</th>
            </tr>
         </thead>
         
         <tbody>
         	<tr>
         		<td>오전</td>
         		<td>07:00 ~ 12:00</td>
         		<td>10,000원</td>
         	</tr>
         	<tr>
         	    <td>오후</td>
         	    <td>13:00 ~ 20:00</td>
         	    <td>10,000원</td>
         	</tr>
         </tbody>
</table>
<div class="go">
	<input type="button" class="gobtn" value="돌봄  서비스 예약하러 가기"  onClick="location.href='/carelife/usermain/bookingparents'"/>
</div>
<%@ include file="../includes/footer.jsp"%>
</body>
</html>