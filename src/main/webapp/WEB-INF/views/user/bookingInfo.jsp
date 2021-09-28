<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   
   #namediv {
		margin-bottom: 10px;
	}
 	
 	#btn {
      background-color: #FFF49C;
      font-weight: bold;
      margin-bottom: 10px;
      padding: 10px 15px;
      border: none;
      border-radius: 12px;
   }
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- 도로명주소 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

</head>
<body>

<%-- <%
// 세션값 가져오기
String pPhone = (String) session.getAttribute("pPhone"); // Object 타입이므로 다운캐스팅

System.out.print(pPhone +"    여기!!!    "); 

%>   --%>
 <%@ include file="../includes/userHeader.jsp"%>

<div class="all">

	<form action="bookingteacher" method="post">
	
		<input type="hidden" name ="pno" id="pno" value="${pno}">
	    <input type="hidden" name ="pName" id="pName" value="${pName}">
	    <input type="hidden" name ="pPhone" id="pPhone" value="${pPhone}">
		
		<!-- 테스트 후 삭제예정  -->
		<span> SessionAttributes로 넘어온 pPhone값 : ${pPhone} pno : ${pno}</span>
	
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
				<label> 예약시간대 </label>
				<label for="boTime"style="width: 32%; text-align: right;"> 오전 </label>
				<input type="radio" id="boTime" name="boTime" value="0"> 
				<label for="boTime"style="width: 30%; text-align: right;"> 오후 </label> 
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
				<input type="text" id="boRoadNameDetail" name="boRoadNameDetail" style="width: 50%"> 
				<input type="button" value="도로명주소검색"  id="btn" onclick="execPostCode();" style="width: 22%">
			</div>
			
			<br>
			
			<div id="namediv">
				<label for="boRemarks" style="padding-right: 5px"> 요청사항 </label>
				<textarea rows="1" cols="10" name="boRemarks" style="width: 70%; margin: -5px"></textarea> 
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