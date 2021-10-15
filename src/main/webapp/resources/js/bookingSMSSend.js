/**
 * 
 */			let result=0;
			const infoForm = document.querySelector(".infoForm");

        $('#sendPhoneNumber').click(function(){
            let phoneNumber = $('#pphone').val();
            alert('인증번호 발송');


            $.ajax({
                type: "GET",
                url: "/carelife/usermain/message/sendsms",
                data: {
                    "phoneNumber" : phoneNumber
                },
                success: function(res){
                   console.log(res)
                   console.log('번호보냄')
                    $('#checkBtn').click(function(){
                        if($.trim(res) ==$('#confirm').val()){
                        	result =res;
                        	alert('인증번호 성공');           	                       	
                        }else{   	                    	
                        	result =1;
						alert('인증번호 실패'); 
                          
                        }
                    })
                }
            })
        });
        
        
        //인증번호 확인 
     $('#resultVal').click(function(){
            	 
    	 let boPhone = $('#pphone').val();

        	if(result == 1 || result == 0 || result == null){
        		//인증번호 실패
			alert('인증번호를 다시 확인해주세요');
        	}else{
					infoForm.submit();
        	}
        })



