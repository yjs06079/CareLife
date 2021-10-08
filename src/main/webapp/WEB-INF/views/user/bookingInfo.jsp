<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	.info {
		margin-bottom: 20px;
	}
	
	#check {
		background-color: #FFF49C;
		margin-bottom: 10px;
		padding: 10px 0px;
		border: none;
		border-radius: 12px;
		width: 100%;
	}
	
 	#btn {
		background-color: #FFF49C;
		margin: 10px 0px;
		padding: 10px 0px;
		border: none;
		border-radius: 12px;
		width: 100%;
	}
	
	.row {
	  display: -ms-flexbox; /* IE10 */
	  display: flex;
	  -ms-flex-wrap: wrap; /* IE10 */
	  flex-wrap: wrap;
	  margin-bottom: 20px;
	}
	
	.col-25 {
	  -ms-flex: 50%; /* IE10 */
	  flex: 50%;
	}
	
	.col-75 {
	  -ms-flex: 75%; /* IE10 */
	  flex: 75%;
	}
	
	.col-25,
	.col-75 {
	  padding: 0 16px;
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
   #resultVal, #before {
      background-color: #FFCD4A;
      font-weight: bold;
      margin-top: 20px;
      margin-bottom: 10px;
      padding: 10px 50px;
      border: none;
      border-radius: 12px;
      width: 400px;
   }
   
  
 	#btn {
      background-color: #FFF49C;
      font-weight: bold;
      margin-bottom: 10px;
      padding: 10px 10px;
      border: none;
      border-radius: 12px;
   }
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- 도로명주소 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

</head>
<body>


 <%@ include file="../includes/userHeader.jsp"%>

<div class="all">

	<form action="bookingteacher" method="post">
	
	
	<input type="hidden" name="pno" id="pno" value="${userDTO.pno}">	
	<input type="hidden" name="pname" value="${userDTO.pname}">
	<input type="hidden" name="pphone" value="${userDTO.pphone}">
		    
	
		<br>
		
		<h1> 돌봄 장소와 시간을 입력해주세요. </h1>
	    <p> 현재 슬기로운 돌봄생활은 서울시 내에서만 예약가능합니다. </p>
	    <p> 아래의 정보를 입력해주세요. </p>

		<br>
		
		<div class="form">
			<div id="namediv">
				<label> 예약지역 </label>
				<select name="boAddr"style="width: 70%; text-align: center;">
				   <option value="강동구"> 강동구 </option>
				   <option value="강북구"> 강북구 </option>
				   <option value="강서구"> 강서구 </option>
				   <option value="관악구"> 관악구 </option>
				   <option value="광진구"> 광진구 </option>
				   <option value="구로구"> 구로구 </option>
				   <option value="금천구"> 금천구 </option>
				   <option value="노원구"> 노원구 </option>
				   <option value="도봉구"> 도봉구 </option>
				   <option value="동대문구"> 동대문구 </option>
				   <option value="동작구"> 동작구 </option>
				   <option value="마포구"> 마포구 </option>
				   <option value="서대문구"> 서대문구 </option>
				   <option value="서초구"> 서초구 </option>
				   <option value="성동구"> 성동구 </option>
				   <option value="성북구"> 성북구 </option>
				   <option value="송파구"> 송파구 </option>
				   <option value="양천구"> 양천구 </option>
				   <option value="영등포구"> 영등포구 </option>
				   <option value="용산구"> 용산구 </option>
				   <option value="은평구"> 은평구 </option>
				   <option value="종로구"> 종로구 </option>
				   <option value="중구"> 중구 </option>
				   <option value="중랑구"> 중랑구 </option>
				</select>
			</div>
			<br>
			
			<div id="namediv">
				<label> 예약일자 </label>
				<input type="date" name="boDate" style="width: 70%; text-align: center;">
			</div>
			
			<br>
			
			<div id="namediv">
				<label style="margin-right: 20px"> 예약시간대 </label>
				<label for="boTime"style="width: 27%; text-align: right;"> 오전 </label>
				<input type="radio" id="boTime" name="boTime" value="0"> 
				<label for="boTime"style="width: 27%; text-align: right;"> 오후 </label> 
				<input type="radio" id="boTime" name="boTime" value="1"> 
			</div>
			
		
			
			<br>
			
			<div id="namediv">
				<label> 예약이용시간 </label>
				<label for="boHour" style="width: 13%; text-align: right;"> 1시간 </label>
				<input type="radio" id="boHour" name="boHour" value="0">
				<label for="boHour" style="width: 13%; text-align: right;"> 2시간 </label>
				<input type="radio" id="boHour" name="boHour" value="1">
				<label for="boHour" style="width: 13%; text-align: right;"> 3시간 </label>
				<input type="radio" id="boHour" name="boHour" value="2">
				<label for="boHour" style="width: 13%; text-align: right;"> 4시간 </label>
				<input type="radio" id="boHour" name="boHour" value="3"> 
			</div>
			
			<br>
			
			
			<div id="namediv">
				<label for="boRoadName"> 도로명주소 </label>
				<input type="text" id="boRoadName" name="boRoadName" readonly="readonly" style="width: 70%"> 
			</div>
						
			<br>
			
			<div id="namediv">                   
				<label for="boRoadNameDetail"> 상세주소 </label>
				<input type="text" id="boRoadNameDetail" name="boRoadNameDetail" style="width: 54%"> 
				<input type="button" value="도로명주소검색"  id="btn" onclick="execPostCode();" style="width: 15%">
			</div>
			
			<br>
			<div id="namediv">	
			<label for="boRemarks"> 요청사항 </label> <br>
			 <br>	<textarea rows="10" cols="5" name="boRemarks" style="width: 73%; margin: -10px"
				placeholder="-아이의 이름을 입력해주세요

-아이의 나이를 입력해주세요 

-성별(남아,여아)을 입력해주세요

-아이의 성향을 입력해주세요

-아이의 주의사항을 입력해주세요"></textarea> 
			</div>
			
			<input type="button"  value="이전" id="before" style="width: 40%" onclick="location='http://localhost:8080/carelife/usermain/bookingparentsresult'" />
			<input type="submit"  value="다음" id="resultVal"style="width: 40%" />
		
		</div>
	</form>
</div>

<%@ include file="../includes/footer.jsp"%>

<script src="${pageContext.servletContext.contextPath}/resources/js/bookingInfo.js"></script> 

</body>
</html>