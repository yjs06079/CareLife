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
   
 	#btn {
      background-color: #FFF49C;
      font-weight: bold;
      margin-bottom: 10px;
      padding: 10px 15px;
      border: none;
      border-radius: 12px;
   }
   
   
      #yes {
      background-color: #FFF49C;
      font-weight: bold;
      margin-bottom: 10px;
      padding: 10px 15px;
      border: none;
      border-radius: 12px;
   }
   

</style>

   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

 <%@ include file="../includes/userHeader.jsp"%>
 

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <input type="button" value="확인" id="yes">
      </div>
    </div>
  </div>
</div>
 

<div class="all">

	<form action="bookingchecklist" method="post">
	
		<h1> 보호자의 정보로 예약을 조회 할 수 있습니다. </h1>
	    <p> 예약조회가 이루어지지 않을 시  </p>
	    <p> 슬기로운 돌봄생활로 문의하시기 바랍니다.  </p>
	    
	    <br>
	
		 <div id="form">
            <label for="pname"> 보호자이름 </label>
            <input type="text" id="pname" name="pname">
	         
	         <br>
	         
            <label for="pphone"> 핸드폰번호 </label>
            <input type="text" id="pphone" name="pphone">
         </div>
         
         <br>
          <input type="submit" value="조회하기" id="btn">
                    <input type="button" value="조회하기" id="tt">
        
	</form>
</div>


 <script>
$(document).ready(function(){
$('#tt').click(function(){
	$('#exampleModal').modal('show');
	


	
}) 
});

</script>  

<%@ include file="../includes/footer.jsp"%>


</body>
</html>