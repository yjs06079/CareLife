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
   .gobtn{
   background-color: #FFF49C;
		margin: 10px 0px;
		padding: 10px 0px;
		border: none;
		border-radius: 12px;
		width: 100%;
   }
</style>
</head>
<body>
   <%@ include file="../includes/adminHeader.jsp"%>
   
   <div class="all">
      <div id="info">
         <h1>${dto.pname }님의 예약 내역입니다.</h1>
         <c:if test="${dto.bopayment eq 0}">
			  <h5 style="color: red">※ 이미 취소된 예약입니다.</h5>
		 </c:if>
      </div>
      <div class="row">
        <div class="col-75">
          <div class="container">
           
            <hr>
              <div class="row" style="margin-top: 20px;">
                  <label for="pname">보호자명</label>
                  <input type="text" id="pname" name="pname" value="${dto.pname}" readonly>
                  
                  <label for="pphone">연락처</label>
                  <input type="text" id="pphone" name="pphone" value="${dto.pphone }" readonly>
                  
                  <label for="psubphone">보조 연락처</label>
                  <input type="text" id="psubphone" name="psubphone" value="${dto.psubphone }" readonly>
                  
                  <label for="boroadname">주소</label>
                  <input type="text" id="boroadname" name="boroadname" value="${dto.boroadname }" readonly>
                  
                  <label for="bodate">날짜</label>
                  <input type="text" id="bodate" name="bodate" value="${dto.bodate }" readonly>
              
              	<c:if test="${dto.botime ne 2 }">
	                 <label for="botime">오전/오후</label>
	                 <c:choose>
	                 	<c:when test="${dto.botime eq 0 }">
	                 		<input type="text" id="botime" name="botime" value="오전" readonly>
	                    </c:when>
	                    <c:when test="${dto.botime eq 1 }">
	                        <input type="text" id="botime" name="botime" value="오후" readonly>
	                    </c:when>
	                 </c:choose>
                 </c:if>
                 
                 <label for="bohour">시간</label>
                 <c:choose>
					<c:when test="${dto.bohour eq 0 }">
						<input type="text" value="1시간" readonly>
					</c:when>
					<c:when test="${dto.bohour eq 1 }">
						 <input type="text" value="2시간" readonly>
					</c:when>
					<c:when test="${dto.bohour eq 2 }">
						  <input type="text" value="3시간" readonly>
					</c:when>
					<c:when test="${dto.bohour eq 3 }">
						 <input type="text" value="4시간" readonly>
					</c:when>
				</c:choose>
              
                <label for="boremarks">요청사항</label>
                <textarea rows="10" cols="30" id="boremarks" name="boremarks" readonly style="margin-bottom: 5px">${dto.boremarks }</textarea>
              
              </div>
              <hr>
              
              <input type="button" class="gobtn" value="목록"  onClick="location.href='/carelife/adminmain/bookinglist'"/>
              
          </div>
        </div>
      </div>
   </div>
   
   <%@ include file="../includes/footer.jsp"%>
</body>
</html>