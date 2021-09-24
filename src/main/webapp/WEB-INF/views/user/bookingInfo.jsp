<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
${pno}

<%-- <%
// 세션값 가져오기
String pPhone = (String) session.getAttribute("pPhone"); // Object 타입이므로 다운캐스팅

System.out.print(pPhone +" 	여기!!! 	"); 

%>   --%>



<form action="bookingteacher" method="post">


<span>2222     SessionAttributes로 넘어온 pPhone값 : ${pPhone}</span>




<label> 예약지역 </label>
<select name="boAddr">
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

<br>

<label> 예약일자 </label>
<input type="date" name="boDate">

<br>

<label> 예약시간대 </label>
<input type="radio" id="boTime" name="boTime" value="0">  <label for="boTime"> 오전 </label>
<input type="radio" id="boTime" name="boTime" value="1"> <label for="boTime"> 오후 </label>

<br>

<label> 예약이용시간 </label>
<input type="radio" id="boHour" name="boHour" value="0"> <label for="boHour"> 1시간 </label>
<input type="radio" id="boHour" name="boHour" value="1"> <label for="boHour"> 2시간 </label>
<input type="radio" id="boHour" name="boHour" value="2"> <label for="boHour"> 3시간 </label>
<input type="radio" id="boHour" name="boHour" value="3"> <label for="boHour"> 4시간 </label>

<br>

<label for="boRoadName"> 도로명주소 </label>
<input type="text" id="boRoadName" name="boRoadName"> 

<br>

<label for="boRemarks"> 요청사항 </label>
<textarea rows="10" cols="30" name="boRemarks"></textarea> 

<br>


<input type="button"  value="이전" onclick="location=''" />
<input type="submit"  value="다음" id="resultVal" />

</form>



<script src="${pageContext.servletContext.contextPath}/resources/js/bookingInfo.js"></script> 

</body>
</html>