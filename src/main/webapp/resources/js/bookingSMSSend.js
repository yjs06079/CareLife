/**
 * 
 */			let result;

        $('#sendPhoneNumber').click(function(){
            let phoneNumber = $('#pPhone').val();
            alert('인증번호 발송');


            $.ajax({
                type: "GET",
                url: "http://localhost:8080/carelife/message/sendsms",
                data: {
                    "phoneNumber" : phoneNumber
                },
                success: function(res){
                   console.log(res)
                   console.log('번호보냄')
                    $('#checkBtn').click(function(){
                        if($.trim(res) ==$('#confirm').val()){
                        	
                        	alert('성공');
                        	result =0;
                        	
                        }else{
                        	alert('실패');
                        	result =1;
                        }
                    })
                }
            })
        });
        
        
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
        