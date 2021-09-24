/**
 * 
 */
  //다음버튼 
 $('#resultVal').click(function(){
        	 
	 let boPhone = $('#pPhone').val();
	 
	 
    	if(result == 0){
    		//인증번호 성공 
    		location.href = 'http://localhost:8080/carelife/usermain/bookinginfo?boPhone=' + boPhone;
    	}else{
    		alert("인증번호 실패");
    	}
    })