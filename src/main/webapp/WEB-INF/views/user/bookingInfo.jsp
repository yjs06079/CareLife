<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슬기로운 돌봄생활</title>
<style>
	.center {
		text-align: center;
		padding-bottom: 20px;
	}
	
	.roadAddr {
		width: 100%;
		display: inline-table;
	}
	
	#btn {
		background-color: #FFF49C;
		margin-left: 2%;
		padding: 15px 0px;
		border: none;
		border-radius: 12px;
		width: 28%;
	}
	
	.col-25 {
	  -ms-flex: 50%; /* IE10 */
	  flex: 50%;
	}
	
	.col-75 {
	  -ms-flex: 75%; /* IE10 */
	  flex: 75%;
	}
	
	.col-25, .col-75 {
	  padding: 0 16px;
	}
	
	input[type=text], textarea, select, input[type=date]{
	  width: 100%;
	  margin-bottom: 20px;
	  padding: 15px;
	  border: 1px solid #ccc;
	  border-radius: 3px;
	  background: #f1f1f1;
	}
	
	label {
	  margin-bottom: 10px;
	  display: block;
	  color: black;
	}
	
	hr {
	  border: 1px solid #f1f1f1;
	  margin-bottom: 25px;
	}
	
	.timediv, .hourdiv {
	  width: 100%;
	  margin-bottom: 20px;
	  padding: 15px;
	  border: 1px solid #ccc;
	  border-radius: 3px;
	  background: #f1f1f1;
	}
	
	.timediv>label, .hourdiv>label {
		margin-bottom: 0px;
	}
	
	input[type=radio] {
		margin-right: 5%;
	}
	
	#before, #resultVal{
		width: 500px;
		padding: 10px;
		margin: 8px 0;
		border: none;
		border-radius: 12px;
		background-color: #FFF49C;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- 도로명주소 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

</head>
<body>

<%@ include file="../includes/userHeader.jsp"%>

<form action="bookingteacher" method="post">
	<input type="hidden" name="pno" id="pno" value="${userDTO.pno}">	
	<input type="hidden" name="pname" value="${userDTO.pname}">
	<input type="hidden" name="pphone" value="${userDTO.pphone}">
    
	<div class="center">
		<h1> 돌봄 장소와 시간을 입력해주세요. </h1>
		<p> 현재 슬기로운 돌봄생활은 서울시 내에서만 예약가능합니다. </p>
		<p> 아래의 정보를 입력해주세요. </p>
	</div>
	<div class="row">
		<div class="col-75">
			<div class="container">
			<hr>
				<label> 예약 지역 </label>
				<select name="boAddr" style="margin-bottom: 20px">
					<option value="">지역을 선택하세요.</option>
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
			
				<label> 예약 일자 </label>
				<input type="date" name="boDate" required="required">
			
				<label> 예약 시간대 </label>
				<div class="timediv">
					<label for="boTime0"> 오전 </label>
					<input type="radio" id="boTime0" name="boTime" value="0"> 
					<label for="boTime1"> 오후 </label> 
					<input type="radio" id="boTime1" name="boTime" value="1">
				</div>
			
				<label> 예약 이용시간 </label>
				<div class="hourdiv">
					<label for="boHour0" > 1시간 </label>
					<input type="radio" id="boHour0" name="boHour" value="0">
					<label for="boHour1" > 2시간 </label>
					<input type="radio" id="boHour1" name="boHour" value="1">
					<label for="boHour2" > 3시간 </label>
					<input type="radio" id="boHour2" name="boHour" value="2">
					<label for="boHour3" > 4시간 </label>
					<input type="radio" id="boHour3" name="boHour" value="3"> 
				</div>
						
				<label for="boRoadName"> 도로명 주소 </label>
				<div class="roadAddr">
					<input type="text" id="boRoadName" name="boRoadName" readonly="readonly" required="required" style="width: 70%">
					<input type="button" value="도로명주소검색"  id="btn" onclick="execPostCode();" required="required">
				</div>
			                
				<label for="boRoadNameDetail"> 상세주소 </label>
				<input type="text" id="boRoadNameDetail" name="boRoadNameDetail" > 
						
				<label> 요청사항 </label>
				<textarea rows="10" cols="30" name="boRemarks" id="boRemarks" style="margin-bottom: 5px" placeholder="아이의 이름, 나이, 성별, 성향, 주의사항 등"></textarea>
			<hr>
			</div>
			
			<div class="center">
				<input type="button" value="이전" id="before" onclick="/carelife/usermain/bookingparentsresult'" />
				<input type="submit" value="다음" id="resultVal"/>
			</div>
		</div>
	</div>
</form>

<%@ include file="../includes/footer.jsp"%>

<script src="${pageContext.servletContext.contextPath}/resources/js/bookingInfo.js"></script> 

</body>
</html>