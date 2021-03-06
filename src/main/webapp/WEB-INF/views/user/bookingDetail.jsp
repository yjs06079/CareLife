<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
	#listbtn {
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
	  margin-top: 20px;
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
	
	input[type=text], input[type=file], textarea {
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
</style>
</head>
<body>
 <%@ include file="../includes/userHeader.jsp"%>
	
	<form action="/carelife/usermain/bookingchecklist" method="post">
	<div class="all">
		<div id="info">
			<h1>${bookingDTO.boNo }번 예약입니다.</h1>
			<c:if test="${bookingDTO.boCancel eq 'x'}">
				<h5 style="color: red">※ 이미 취소된 예약입니다.</h5>
			</c:if>
		</div>
		<div class="row">
		  <div class="col-75">
		    <div class="container">
		      <hr>
		        <div class="row">

		        	<label for="tname">예약 번호</label>
		       		<input type="text" value="${bookingDTO.boNo }" id="boNo" nmae="boNo" readonly="readonly" >
		        
		            <label for="tname">예약 선생님</label>
		            <input type="text" id="tname" name="tname" value="${tname} 선생님" readonly>
		            
		            <label for="boAddr">예약 지역</label>
		           <input type="text" value="${bookingDTO.boAddr }" id="boAddr" name="boAddr" readonly="readonly">
		            
		            <label for="boDate">예약 날짜</label>
		            <fmt:formatDate var="boDate" value="${bookingDTO.boDate}" pattern="yyyy-MM-dd" />
			   		<input type="text" value="${boDate }" name="boDate" id="boDate">
		        
		        	<c:if test="${bookingDTO.boTime ne 2 }">
			        	<label for="boTime">오전/오후</label>
			            <c:choose>
					    	<c:when test="${bookingDTO.boTime eq 0 }">
					      		<input type="hidden" id="boTime" name="boTime" value="${bookingDTO.boTime }" readonly>
					      		<input type="text" value="오전" readonly>
					      	</c:when>
					      	<c:when test="${bookingDTO.boTime eq 1 }">
					      		<input type="hidden" id="boTime" name="boTime" value="${bookingDTO.boTime }" readonly>
					      		<input type="text" value="오후" readonly>
					      	</c:when>
					    </c:choose>
				    </c:if>
		        
		        	<label for="boHour">예약 이용시간</label>
		        	<c:choose>
				    	<c:when test="${bookingDTO.boHour eq 0 }">
		            		<input type="hidden" id="boHour" name="boHour" value="${bookingDTO.boHour }" readonly>
		            		<input type="text" value="1시간" readonly>
		           		</c:when>
		           		<c:when test="${bookingDTO.boHour eq 1 }">
		            		<input type="hidden" id="boHour" name="boHour" value="${bookingDTO.boHour }" readonly>
		            		<input type="text" value="2시간" readonly>
		           		</c:when>
		           		<c:when test="${bookingDTO.boHour eq 2 }">
		            		<input type="hidden" id="boHour" name="boHour" value="${bookingDTO.boHour }" readonly>
		            		<input type="text" value="3시간" readonly>
		           		</c:when>
		           		<c:when test="${bookingDTO.boHour eq 3 }">
		            		<input type="hidden" id="boHour" name="boHour" value="${bookingDTO.boHour }" readonly>
		            		<input type="text" value="4시간" readonly>
		           		</c:when>
		           	</c:choose>
		           	
		           	<label for="boRoadName">주소</label>
		            <input type="text" id="boRoadName" name="boRoadName" value="${bookingDTO.boRoadName }" readonly>

		        
		        	<label for="boRemarks">요청사항</label>
		            <textarea rows="10" cols="30" id="boRemarks" name="boRemarks" readonly style="margin-bottom: 5px">${bookingDTO.boRemarks }</textarea>
		        </div>
		        <hr>
		        <input type="submit" value="목록" id="listbtn" name="listbtn" >
		        <c:if test="${bookingDTO.boCancel ne 'x'}">
		        	<input type="button" id="btn" value="예약 취소">
		        </c:if>
		      </div>
		   </div>
		</div>
	</div>
	</form>
	<%@ include file="../includes/footer.jsp"%>
	
			
	<script>

   
$('#btn').click(function(){

 //    console.log($(this).parent().siblings().eq(0).children().val());
 //    내가찾는거(삭제버튼).부모(input의 부모 td).(td전체를 찾음).(td의 0번째 (class의 이름을 안써서).(td의 자식 input))

 //	 let boNo = $(this).parent().siblings('.boNo').children().val();
 
  let boNo = $('#boNo').val();

 console.log(boNo);

 	    $.ajax({
		url: "/carelife/usermain/bookingremove/"+boNo,
		contentType: 'application/json; charset=utf-8',
		success: function(data){
			alert('예약 취소가 완료되었습니다.');
			console.log(data);
			 location.href="/carelife/usermain/bookingdetail/"+boNo;
			
		},
		error: function (request, status, error){
			alert('오류 발생 : 다시 시도해주세요.');
		}

    }) 
});


</script>
</body>
</html>