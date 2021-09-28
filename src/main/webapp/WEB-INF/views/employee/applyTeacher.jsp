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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
	<%@ include file="../includes/userHeader.jsp"%>
	
	<div class="all">
		<div id="info">
			<h1>아이들의 새로운 선생님이 되어주세요!</h1>
			<p>아래의 지원서 양식에 맞게 작성 후 지원해주세요.</p>
		</div>
		<div class="row">
		  <div class="col-75">
		    <div class="container">
		      <form action="applyresult" method="post">
		      <hr>
		      <h3>지원자 인적사항</h3>
		        <div class="row">
			        <label for="ePhoto">지원자 사진&nbsp;</label>
			        <label style="color: gray">(이미지는 3x4 규격이며, 이미지 파일명은 이름.jpg/이름.png 형식으로 제출하세요.)</label>
		            <input type="file" id="ePhoto" name="ephoto" required="required">
		        
		            <label for="eName">이름</label>
		            <input type="text" id="eName" name="ename" placeholder="홍길동" required="required">
		            
		            <label for="eBirth">생년월일</label>
		            <input type="text" id="eBirth" name="ebirth" placeholder="19701023" required="required">
		            
		            <label for="ePhone">휴대폰 번호</label>
		            <input type="text" id="ePhone" name="ephone" placeholder="010-1234-5678" required="required">
		            
		            <label for="eAddr">주소</label>
		            <input type="text" id="eAddr" name="eaddr" placeholder="서울특별시 금천구 가산동" required="required" style="margin-bottom: 5px">
		            
		        </div>
		        <hr>
		        
		        <h3>지원자 이력사항</h3>
		        <div class="row">   
		            <label for="eEdu">최종 학력 사항</label>
		            <input type="text" id="eEdu" name="eedu" placeholder="돌봄고등학교 문과 or 돌봄대학교 유아교육학과" required="required">
		            
		            <label for="eCareer">경력 사항</label>
		            <input type="text" id="eCareer" name="ecareer" placeholder="돌봄유치원 3년 경력" required="required">
		            
		            <label for="eLicense">자격 사항</label>
		            <input type="text" id="eLicense" name="elicense" placeholder="유치원 정교사 2급" required="required">
		        </div>
		        <hr>
		        
		        <h3>지원자 자기소개</h3>
		        <div class="row">
		            <textarea rows="10" cols="30" id="eInfo" name="einfo" placeholder="입사 시 홈페이지에 기재될 자기소개를 작성해 주세요. (500자 내외)" required="required"></textarea>
		        </div>
		        <hr>
		        
		        <input type="submit" value="지원하기" id="btn">
		      </form>
		    </div>
		  </div>
		</div>
	</div>
	
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>